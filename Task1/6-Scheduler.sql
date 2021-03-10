-- PG AGENT
DO $$
BEGIN
  UPDATE employees SET salary = salary * 1.1;
END
$$;
