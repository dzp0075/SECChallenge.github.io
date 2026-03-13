-- Run this in your Supabase project's SQL Editor
-- Dashboard → SQL Editor → New query → paste → Run

CREATE TABLE IF NOT EXISTS config (
  key   TEXT PRIMARY KEY,
  value TEXT NOT NULL
);

ALTER TABLE config ENABLE ROW LEVEL SECURITY;

CREATE POLICY "public read" ON config FOR SELECT USING (true);

-- Set your admin PIN (change '1234' to whatever you want)
INSERT INTO config (key, value) VALUES ('admin_pin', '1234')
  ON CONFLICT (key) DO UPDATE SET value = EXCLUDED.value;
