CREATE OR REPLACE FUNCTION list_songs(artist_arg text, album_arg text, year_arg integer, length_range float[2], bpm_range integer[2], tags_arg text[]) 
    RETURNS TABLE(id uuid, artist text, title text, album text, year integer, tags text[]) 
AS $$
    SELECT songs_external_metadata.id, artist, title, album, year, tags FROM songs_external_metadata
        INNER JOIN songs_features ON songs_features.id = songs_external_metadata.id
        WHERE 
            (artist_arg IS NULL OR artist_arg = artist) AND
            (album_arg IS NULL OR album_arg = album) AND
            (year_arg IS NULL OR year_arg = year) AND
            (length_range IS NULL OR (length >= length_range[1] AND length <= length_range[2])) AND
            (bpm_range IS NULL OR (bpm >= bpm_range[1] AND bpm <= bpm_range[2])) AND
            (tags_arg IS NULL OR tags_arg <@ tags);
$$ LANGUAGE SQL;
