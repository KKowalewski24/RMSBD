-- PG AGENT
-- Take a look at this tutorial and do step by step what has
-- been shown - I've tested this and it worked
-- https://www.youtube.com/watch?v=nMLd27Fy6B0

DO $$
BEGIN
  UPDATE employees SET salary = salary * 1.1;
END
$$;
