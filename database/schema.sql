PRAGMA foreign_keys = ON;

-- Reference tables first
CREATE TABLE IF NOT EXISTS PreachingLocations (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  location_name TEXT NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS Denominations (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  denomination_name TEXT NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS Languages (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  language_name TEXT NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS TextFileFormats (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  format_name TEXT NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS AudioFileFormats (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  format_name TEXT NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS ReviewTypes (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  review_type TEXT NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS ProjectContributors (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  human_bool INTEGER NOT NULL CHECK (human_bool IN (0, 1)),
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL,
  denomination_id INTEGER NOT NULL,
  FOREIGN KEY (denomination_id) REFERENCES Denominations(id)
);

-- Main entities
CREATE TABLE IF NOT EXISTS Sermons (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  preacher_id INTEGER NOT NULL,
  bible_passage TEXT NOT NULL,
  location_id INTEGER NOT NULL,
  date_delivered TEXT NOT NULL,              -- ISO 8601 date
  original_language_id INTEGER NOT NULL,
  title TEXT NOT NULL,
  summary TEXT,
  spurgeon_gems_number INTEGER NOT NULL UNIQUE,
  FOREIGN KEY (preacher_id) REFERENCES ProjectContributors(id),
  FOREIGN KEY (location_id) REFERENCES PreachingLocations(id),
  FOREIGN KEY (original_language_id) REFERENCES Languages(id)
);

CREATE TABLE IF NOT EXISTS Translations (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  sermon_id INTEGER NOT NULL,
  translator_id INTEGER NOT NULL,
  date_translated TEXT NOT NULL,             -- ISO 8601
  language_id INTEGER NOT NULL,
  FOREIGN KEY (sermon_id) REFERENCES Sermons(id),
  FOREIGN KEY (translator_id) REFERENCES ProjectContributors(id),
  FOREIGN KEY (language_id) REFERENCES Languages(id)
);

CREATE TABLE IF NOT EXISTS TranslationFiles (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  translation_id INTEGER NOT NULL,
  text_file_format_id INTEGER NOT NULL,
  file_path TEXT NOT NULL,
  checksum TEXT NOT NULL,
  file_size_bytes INTEGER NOT NULL,
  FOREIGN KEY (translation_id) REFERENCES Translations(id),
  FOREIGN KEY (text_file_format_id) REFERENCES TextFileFormats(id)
);

CREATE TABLE IF NOT EXISTS Audio (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  sermon_id INTEGER NOT NULL,
  reader_id INTEGER NOT NULL,                -- aka recorder_id in ERD
  date_recorded TEXT NOT NULL,               -- ISO 8601
  duration_seconds INTEGER NOT NULL,
  language_id INTEGER NOT NULL,
  FOREIGN KEY (sermon_id) REFERENCES Sermons(id),
  FOREIGN KEY (reader_id) REFERENCES ProjectContributors(id),
  FOREIGN KEY (language_id) REFERENCES Languages(id)
);

CREATE TABLE IF NOT EXISTS AudioFiles (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  audio_id INTEGER NOT NULL,
  audio_file_path TEXT NOT NULL,
  checksum TEXT NOT NULL,
  file_size_bytes INTEGER NOT NULL,
  audio_file_format_id INTEGER NOT NULL,
  bitrate REAL NOT NULL,
  FOREIGN KEY (audio_id) REFERENCES Audio(id),
  FOREIGN KEY (audio_file_format_id) REFERENCES AudioFileFormats(id)
);

CREATE TABLE IF NOT EXISTS Reviews (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  translation_id INTEGER,
  translation_file_id INTEGER,
  audio_id INTEGER,
  audio_file_id INTEGER,
  project_contributor_id INTEGER NOT NULL,
  review_type_id INTEGER NOT NULL,
  date_reviewed TEXT NOT NULL, -- ISO 8601
  pass_bool INTEGER NOT NULL CHECK (pass_bool IN (0, 1)),
  comments TEXT,
  FOREIGN KEY (translation_id) REFERENCES Translations(id),
  FOREIGN KEY (translation_file_id) REFERENCES TranslationFiles(id),
  FOREIGN KEY (audio_id) REFERENCES Audio(id),
  FOREIGN KEY (audio_file_id) REFERENCES AudioFiles(id),
  FOREIGN KEY (project_contributor_id) REFERENCES ProjectContributors(id),
  FOREIGN KEY (review_type_id) REFERENCES ReviewTypes(id),
  CHECK (
    translation_id IS NOT NULL OR 
    translation_file_id IS NOT NULL OR 
    audio_id IS NOT NULL OR 
    audio_file_id IS NOT NULL
  )
);

CREATE TABLE IF NOT EXISTS ContentErrorReports (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  review_id INTEGER,
  translation_id INTEGER,
  translation_file_id INTEGER,
  audio_id INTEGER,
  audio_file_id INTEGER,
  project_contributor_id INTEGER NOT NULL,
  error_description TEXT NOT NULL,
  date_reported TEXT NOT NULL,               -- ISO 8601
  resolved_bool INTEGER NOT NULL DEFAULT 0 CHECK (resolved_bool IN (0, 1)),
  date_resolved TEXT,                        -- ISO 8601
  resolution_description TEXT,
  FOREIGN KEY (review_id) REFERENCES Reviews(id),
  FOREIGN KEY (translation_id) REFERENCES Translations(id),
  FOREIGN KEY (translation_file_id) REFERENCES TranslationFiles(id),
  FOREIGN KEY (audio_id) REFERENCES Audio(id),
  FOREIGN KEY (audio_file_id) REFERENCES AudioFiles(id),
  FOREIGN KEY (project_contributor_id) REFERENCES ProjectContributors(id),
  CHECK (
    review_id IS NOT NULL OR
    translation_id IS NOT NULL OR 
    translation_file_id IS NOT NULL OR 
    audio_id IS NOT NULL OR 
    audio_file_id IS NOT NULL
  )
);

-- Indexes
CREATE INDEX IF NOT EXISTS idx_sermons_preacher   ON Sermons(preacher_id);
CREATE INDEX IF NOT EXISTS idx_sermons_location   ON Sermons(location_id);
CREATE INDEX IF NOT EXISTS idx_sermons_language   ON Sermons(original_language_id);
CREATE INDEX IF NOT EXISTS idx_translations_sermon    ON Translations(sermon_id);
CREATE INDEX IF NOT EXISTS idx_translations_translator ON Translations(translator_id);
CREATE INDEX IF NOT EXISTS idx_translations_language   ON Translations(language_id);
CREATE INDEX IF NOT EXISTS idx_audio_sermon   ON Audio(sermon_id);
CREATE INDEX IF NOT EXISTS idx_audio_reader   ON Audio(reader_id);
CREATE INDEX IF NOT EXISTS idx_audio_language ON Audio(language_id);
CREATE INDEX IF NOT EXISTS idx_reviews_translation ON Reviews(translation_id);
CREATE INDEX IF NOT EXISTS idx_reviews_audio       ON Reviews(audio_id);
CREATE INDEX IF NOT EXISTS idx_reviews_contributor ON Reviews(project_contributor_id);
CREATE INDEX IF NOT EXISTS idx_translation_files_translation ON TranslationFiles(translation_id);
CREATE INDEX IF NOT EXISTS idx_audio_files_audio ON AudioFiles(audio_id);
CREATE INDEX IF NOT EXISTS idx_error_reports_resolved ON ContentErrorReports(resolved_bool);
CREATE INDEX IF NOT EXISTS idx_sermons_date ON Sermons(date_delivered);
CREATE INDEX IF NOT EXISTS idx_reviews_type ON Reviews(review_type_id);
CREATE INDEX IF NOT EXISTS idx_reviews_translation_file ON Reviews(translation_file_id);
CREATE INDEX IF NOT EXISTS idx_reviews_audio_file       ON Reviews(audio_file_id);
CREATE INDEX IF NOT EXISTS idx_translation_files_format ON TranslationFiles(text_file_format_id);
CREATE INDEX IF NOT EXISTS idx_audio_files_format       ON AudioFiles(audio_file_format_id);
