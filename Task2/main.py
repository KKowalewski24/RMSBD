import psycopg2
import numpy as np
import essentia.standard as es
from pytube import YouTube
from musicnn.extractor import extractor
from uuid import uuid4


def connect_to_database():
    return psycopg2.connect(host='localhost',
                            database='songs',
                            user='song',
                            password='song')


def get_songs_list(connection):
    with connection.cursor() as cursor:
        cursor.execute("select title,id from songs_external_metadata")
        return cursor.fetchall()


def download_audio_from_youtube(url):
    YouTube(url).streams.filter(
        only_audio=True,
        subtype='mp4').order_by('abr').desc().first().download()


def import_song(connection, filename, title, artist, album, year):
    # samples
    samples, sample_rate, channels, _, bit_rate, codec = es.AudioLoader(
        filename=filename)()

    # features
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

    # tags
    taggram, _, _ = extractor(filename, model='MSD_musicnn')
    tags = np.average(taggram, axis=0).tolist()

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


def export_song(connection,
                uuid,
                filename,
                format='wav',
                sample_rate=44100,
                bitrate=192):
    with connection.cursor() as cursor:
        cursor.execute("select samples, sample_rate from songs where id = %s",
                       uuid)
        samples, old_sample_rate = cursor.fetchone()
    samples = es.Resample(inputSampleRate=old_sample_rate,
                          outputSampleRate=sample_rate)(samples)
    es.AudioWriter(bitrate=bitrate,
                   filename=filename,
                   format=format,
                   sampleRate=sample_rate)(samples)


connection = connect_to_database()
add_song(connection, 'take_five.mp4', 'Take Five', 'Dave Brubeck', 'Time Out',
         1959)
#data = get_song(connection, 'Take Five')
