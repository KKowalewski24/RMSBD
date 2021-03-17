CREATE FUNCTION list_songs() RETURNS TABLE(id uuid,title text) AS $$
    SELECT id, title FROM songs_external_metadata;
$$ LANGUAGE SQL;
