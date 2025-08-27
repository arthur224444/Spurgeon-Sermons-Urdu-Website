-- Insert data into PreachingLocations table
INSERT OR IGNORE INTO PreachingLocations (location_name)
VALUES ('Metropolitan Tabernacle');
INSERT OR IGNORE INTO PreachingLocations (location_name)
VALUES ('New Park Street Chapel, Southwark');


-- Add a denomination if not exists
INSERT OR IGNORE INTO Denominations (denomination_name)
VALUES ('Baptist');

-- Add a language if not exists
INSERT OR IGNORE INTO Languages (language_name)
VALUES ('Urdu');
INSERT OR IGNORE INTO Languages (language_name)
VALUES ('English');

INSERT INTO ProjectContributors (human_bool, first_name, last_name, denomination_id)
VALUES (1, 'Charles', 'Spurgeon',
        (SELECT id FROM Denominations WHERE denomination_name = 'Baptist'));

-- Sermon #1
INSERT OR IGNORE INTO Sermons (
  preacher_id,
  bible_passage,
  location_id,
  date_delivered,
  original_language_id,
  title,
  summary,
  spurgeon_gems_number
)
VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name = 'Charles' AND last_name = 'Spurgeon'),
  'Malachi 3:6',
  (SELECT id FROM PreachingLocations WHERE location_name = 'Metropolitan Tabernacle'),
  '1855-01-07',
  (SELECT id FROM Languages WHERE language_name = 'English'),
  'The Immutability of God',
  'A sermon on the eternal unchangeableness of God.',
  1
);

-- Sermon #2
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage, location_id, date_delivered,
  original_language_id, title, summary, spurgeon_gems_number
)
VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name = 'Charles' AND last_name = 'Spurgeon'),
  '1 Corinthians 11:24',
  (SELECT id FROM PreachingLocations WHERE location_name = 'New Park Street Chapel, Southwark'),
  '1855-01-07',
  (SELECT id FROM Languages WHERE language_name = 'English'),
  'The Remembrance of Christ',
  'A sermon on the duty and blessing of remembering Christ in the Lord’s Supper.',
  2
);

-- Sermon #3
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage, location_id, date_delivered,
  original_language_id, title, summary, spurgeon_gems_number
)
VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name = 'Charles' AND last_name = 'Spurgeon'),
  '2 Kings 7:19',
  (SELECT id FROM PreachingLocations WHERE location_name = 'New Park Street Chapel, Southwark'),
  '1855-01-14',
  (SELECT id FROM Languages WHERE language_name = 'English'),
  'The Sin of Unbelief',
  'A sermon exposing unbelief as a great sin that dishonors God and endangers the soul.',
  3
);

-- Sermon #4
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage, location_id, date_delivered,
  original_language_id, title, summary, spurgeon_gems_number
)
VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name = 'Charles' AND last_name = 'Spurgeon'),
  'John 14:16-17',
  (SELECT id FROM PreachingLocations WHERE location_name = 'New Park Street Chapel, Southwark'),
  '1855-01-21',
  (SELECT id FROM Languages WHERE language_name = 'English'),
  'The Personality of the Holy Ghost',
  'A sermon affirming the personhood of the Holy Spirit and His work among believers.',
  4
);

-- Sermon #5
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage, location_id, date_delivered,
  original_language_id, title, summary, spurgeon_gems_number
)
VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name = 'Charles' AND last_name = 'Spurgeon'),
  'John 14:26',
  (SELECT id FROM PreachingLocations WHERE location_name = 'New Park Street Chapel, Southwark'),
  '1855-01-21',
  (SELECT id FROM Languages WHERE language_name = 'English'),
  'The Comforter',
  'A sermon on the Holy Spirit as the promised Comforter who teaches and guides believers.',
  5
);
