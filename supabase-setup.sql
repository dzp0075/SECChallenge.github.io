-- Run this once in your Supabase project's SQL editor
-- Dashboard → SQL Editor → New query → paste → Run

CREATE TABLE IF NOT EXISTS picks (
  id          BIGSERIAL PRIMARY KEY,
  season      TEXT        NOT NULL,
  player_id   TEXT        NOT NULL,
  payload     JSONB       NOT NULL,
  updated_at  TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  UNIQUE (season, player_id)
);

-- Allow anyone with the anon key to read and write
-- (all validation happens client-side; tighten this if you add auth later)
ALTER TABLE picks ENABLE ROW LEVEL SECURITY;

CREATE POLICY "public read"   ON picks FOR SELECT USING (true);
CREATE POLICY "public insert" ON picks FOR INSERT WITH CHECK (true);
CREATE POLICY "public update" ON picks FOR UPDATE USING (true);

-- Optional: auto-update updated_at on every write
CREATE OR REPLACE FUNCTION set_updated_at()
RETURNS TRIGGER LANGUAGE plpgsql AS $$
BEGIN NEW.updated_at = NOW(); RETURN NEW; END;
$$;

CREATE TRIGGER picks_updated_at
  BEFORE UPDATE ON picks
  FOR EACH ROW EXECUTE FUNCTION set_updated_at();
