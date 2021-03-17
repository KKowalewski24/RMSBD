import os
os.environ['TF_CPP_MIN_LOG_LEVEL'] = '2'
import psycopg2
import numpy as np
import glob
import sys
import argparse
import essentia
essentia.log.infoActive = False
essentia.log.warningActive = False
import essentia.standard as es
from musicnn.extractor import extractor
from uuid import uuid4


def connect_to_database():
    return psycopg2.connect(host='localhost',
                            database='songs',
                            user='song',
                            password='song')


def import_album(connection, dirname, album, artist, year):
    filenames = glob.glob(dirname + '/*')
    for filename in filenames:
        import_song(connection, filename, None, album, artist, year)


def import_song(connection, filename, title, album, artist, year):
    # fix missing title
    if title is None:
        title = os.path.split(filename)[1]
        if title.rfind('.') != -1:
            title = title[:title.rfind('.')]

    print("Importing", title)

    print("\tloading audio file...")
    samples, sample_rate, channels, _, bit_rate, codec = es.AudioLoader(
        filename=filename)()

    print("\textracting features...")
    features, _ = es.MusicExtractor(gfccStats=['mean'],
                                    lowlevelStats=['mean'],
                                    mfccStats=['mean'],
                                    rhythmStats=['mean'],
                                    tonalStats=['mean'])(filename)
    length = features['metadata.audio_properties.length']
    average_loudness = features['lowlevel.average_loudness']
    bpm = features['rhythm.bpm']
    hpcp = features['tonal.hpcp.mean'].tolist()
    chords_histogram = features['tonal.chords_histogram'].tolist()

    print("\ttagging...")
    taggram, _, _ = extractor(filename, model='MSD_musicnn')
    tags = np.average(taggram, axis=0).tolist()

    print("\tinserting to database...")
    with connection.cursor() as cursor:
        uuid = str(uuid4())
        cursor.execute("insert into songs values (%s, %s, %s, %s, %s, %s)",
                       (uuid, psycopg2.Binary(samples), sample_rate, channels,
                        bit_rate, codec))
        cursor.execute(
            "insert into songs_external_metadata values (%s, %s, %s, %s, %s)",
            (uuid, title, artist, album, year))
        cursor.execute(
            "insert into songs_features values (%s, %s, %s, %s, %s, %s)",
            (uuid, length, average_loudness, bpm, hpcp, chords_histogram))
        cursor.execute(
            "insert into songs_tags values (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)",
            [uuid] + tags)
    connection.commit()

    print("\tDONE")


def export_song(connection, uuid, filename, format, sample_rate, bitrate):
    print("Exporting", uuid, "into", filename)

    print("\tloading from database...")
    with connection.cursor() as cursor:
        cursor.execute(
            "select samples, sample_rate, channels from songs where id = %s",
            (uuid, ))
        samples, old_sample_rate, channels = cursor.fetchone()
    samples = np.reshape(np.frombuffer(samples, dtype=np.float32), (-1, 2))

    if sample_rate is None:
        sample_rate = old_sample_rate

    if bitrate is None:
        bitrate = 192

    if sample_rate != old_sample_rate:
        print("\tresampling...")
        resampler = es.Resample(inputSampleRate=old_sample_rate,
                                outputSampleRate=sample_rate)
        samples_channel_1 = resampler(samples[:, 0])
        samples_channel_2 = resampler(samples[:, 1])
        samples = np.stack((samples_channel_1, samples_channel_2), axis=1)

    print("\twriting to file...")
    es.AudioWriter(bitrate=bitrate,
                   filename=filename,
                   format=format,
                   sampleRate=sample_rate)(samples)

    print("\tDONE")


if __name__ == '__main__':
    connection = connect_to_database()

    main_parser = argparse.ArgumentParser(description="Audio database client")
    main_parser.add_argument("action",
                             choices=("import", "export", "list",
                                      "find_similar"))
    main_args = main_parser.parse_args(sys.argv[1:2])

    import_parser = argparse.ArgumentParser(
        description="Import song or songs to audio database",
        prog=sys.argv[0] + " import")
    import_parser.add_argument("filename", metavar="filename/dirname")
    import_parser.add_argument("title", nargs='?')
    import_parser.add_argument("album")
    import_parser.add_argument("artist")
    import_parser.add_argument("year", type=int)

    export_parser = argparse.ArgumentParser(
        description="Export song from audio database",
        prog=sys.argv[0] + " export")
    export_parser.add_argument("filename")
    export_parser.add_argument("id")
    export_parser.add_argument("format",
                               choices=('wav', 'aiff', 'mp3', 'ogg', 'flac'))
    export_parser.add_argument('--sample_rate', type=int)
    export_parser.add_argument('--bitrate',
                               type=int,
                               choices=(32, 40, 48, 56, 64, 80, 96, 112, 128,
                                        144, 160, 192, 224, 256, 320))

    list_parser = argparse.ArgumentParser(
        description="List songs from audio database",
        prog=sys.argv[0] + " list")
    list_parser.add_argument('--artist')
    list_parser.add_argument('--album')
    list_parser.add_argument('--year', type=int)
    list_parser.add_argument(
        '--tag',
        action='append',
        nargs='?',
        choices=('rock', 'pop', 'alternative', 'indie', 'electronic',
                 'female_vocalists', 'dance', 'the_00s', 'alternative_rock',
                 'jazz', 'beautiful', 'metal', 'chillout', 'male_vocalists',
                 'classic_rock', 'soul', 'indie_rock', 'mellow', 'electronica',
                 'the_80s', 'folk', 'the_90s', 'chill', 'instrumental', 'punk',
                 'oldies', 'blues', 'hard_rock', 'ambient', 'acoustic',
                 'experimental', 'female_vocalist', 'guitar', 'hiphop',
                 'the_70s', 'party', 'country', 'easy_listening', 'sexy',
                 'catchy', 'funk', 'electro', 'heavy_metal',
                 'progressive_rock', 'the_60s', 'rnb', 'indie_pop', 'sad',
                 'house', 'happy'))
    list_parser.add_argument('--length-range', nargs=2, type=float)
    list_parser.add_argument('--bpm-range', nargs=2, type=float)

    find_similar_parser = argparse.ArgumentParser(
        description="Find similar songs from audio database",
        prog=sys.argv[0] + " find_similar")

    if main_args.action == "import":
        args = import_parser.parse_args(sys.argv[2:])
        if os.path.isfile(args.filename):
            import_song(connection, args.filename, args.title, args.album,
                        args.artist, args.year)
        elif os.path.isdir(args.filename):
            import_album(connection, args.filename, args.album, args.artist,
                         args.year)

    if main_args.action == "export":
        args = export_parser.parse_args(sys.argv[2:])
        export_song(connection, args.id, args.filename, args.format,
                    args.sample_rate, args.bitrate)

    if main_args.action == "list":
        with connection.cursor() as cursor:
            cursor.execute("select * from list_songs()")
            for song in cursor.fetchall():
                print(song)
