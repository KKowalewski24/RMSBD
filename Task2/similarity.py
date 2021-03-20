import numpy as np
from psycopg2 import sql


def _distance(cursor, feature_name, master_idx):
    cursor.execute(
        sql.SQL("select {} from songs_features order by id").format(
            sql.Identifier(feature_name)))
    samples = np.squeeze(np.array(cursor.fetchall()))
    if samples.ndim == 1:
        samples = samples.reshape((-1, 1))
    samples = (samples - samples.min(axis=0)) / (samples.max(axis=0) -
                                                 samples.min(axis=0))
    master_sample = samples[master_idx]
    samples = np.delete(samples, master_idx, axis=0)
    return np.linalg.norm(master_sample - samples, axis=1)


def find_similar(connection, id, by_length, by_loudness, by_tempo, by_harmony,
                 by_chords, by_tags):
    with connection.cursor() as cursor:

        # get ids and index of master
        cursor.execute("select id from songs_features order by id")
        ids = np.squeeze(np.array(cursor.fetchall()))
        master_idx = np.argmax(ids == id)
        ids = np.delete(ids, master_idx, axis=0)

        distances = []
        if by_length:
            distances.append(_distance(cursor, 'length', master_idx))
        if by_loudness:
            distances.append(_distance(cursor, 'average_loudness', master_idx))
        if by_tempo:
            distances.append(_distance(cursor, 'bpm', master_idx))
        if by_harmony:
            distances.append(_distance(cursor, 'hpcp', master_idx))
        if by_chords:
            distances.append(_distance(cursor, 'chords_histogram', master_idx))
        if by_tags:
            distances.append(_distance(cursor, 'tags_intensity', master_idx))

        return ids[np.argmin(np.average(distances, axis=0))]
