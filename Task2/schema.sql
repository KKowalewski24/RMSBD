create table songs (
    id uuid primary key,
    samples bytea,
    sample_rate integer,
    channels integer,
    bit_rate integer,
    codec text
);

create table songs_external_metadata (
    id uuid primary key,
    foreign key (id) references songs(id),
    title text,
    artist text,
    album text,
    year integer
);

create table songs_features (
    id uuid primary key,
    foreign key (id) references songs(id),
    length real,
    average_loudness real,
    bpm real,
    hpcp real[],
    chords_histogram real[],
    tags text[],
    tags_intensity real[]
);
