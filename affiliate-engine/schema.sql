CREATE TABLE IF NOT EXISTS offers (
  id TEXT PRIMARY KEY,
  network TEXT NOT NULL,
  merchant TEXT NOT NULL,
  title TEXT NOT NULL,
  description TEXT DEFAULT '',
  destination_url TEXT NOT NULL,
  image_url TEXT DEFAULT '',
  price_text TEXT DEFAULT '',
  commission_text TEXT DEFAULT '',
  categories TEXT DEFAULT '',
  keywords TEXT DEFAULT '',
  allowed_sites TEXT DEFAULT '',
  approved INTEGER NOT NULL DEFAULT 0,
  active INTEGER NOT NULL DEFAULT 1,
  expires_at TEXT,
  updated_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX IF NOT EXISTS idx_offers_active_approved ON offers(active, approved);
CREATE INDEX IF NOT EXISTS idx_offers_network ON offers(network);
CREATE INDEX IF NOT EXISTS idx_offers_merchant ON offers(merchant);

CREATE TABLE IF NOT EXISTS click_events (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  offer_id TEXT NOT NULL,
  site TEXT NOT NULL,
  page_url TEXT DEFAULT '',
  placement TEXT DEFAULT '',
  created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX IF NOT EXISTS idx_click_offer ON click_events(offer_id);
CREATE INDEX IF NOT EXISTS idx_click_site ON click_events(site);

CREATE TABLE IF NOT EXISTS conversion_events (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  external_id TEXT,
  offer_id TEXT,
  network TEXT NOT NULL,
  site TEXT DEFAULT '',
  amount REAL,
  commission REAL,
  currency TEXT DEFAULT '',
  occurred_at TEXT,
  recorded_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE UNIQUE INDEX IF NOT EXISTS idx_conversion_external
  ON conversion_events(network, external_id)
  WHERE external_id IS NOT NULL;
