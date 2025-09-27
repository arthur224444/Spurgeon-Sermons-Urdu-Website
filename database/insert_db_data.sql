-- Insert data into PreachingLocations table
INSERT OR IGNORE INTO PreachingLocations (location_name_english, location_name_urdu)
VALUES ('Metropolitan Tabernacle', 'میٹروپولیٹن ٹیبرنیڪل');
INSERT OR IGNORE INTO PreachingLocations (location_name_english, location_name_urdu)
VALUES ('New Park Street Chapel, Southwark', 'نیو پارک اسٹریٹ چیپل، ساؤتھ ورک');


-- Add a denomination if not exists
INSERT OR IGNORE INTO Denominations (denomination_name_english, denomination_name_urdu)
VALUES ('Baptist', 'باپٹسٹ');

-- Add a language if not exists
INSERT OR IGNORE INTO Languages (language_name_english, language_name_urdu)
VALUES ('Urdu', 'اردو');
INSERT OR IGNORE INTO Languages (language_name_english, language_name_urdu)
VALUES ('English', 'انگلش');

INSERT INTO ProjectContributors (human_bool, first_name_english, first_name_urdu, last_name_english, last_name_urdu, denomination_id)
VALUES (1, 'Charles', 'چارلس', 'Spurgeon', 'سپرژن',
        (SELECT id FROM Denominations WHERE denomination_name_english = 'Baptist'));

-- Sermon #1
INSERT OR IGNORE INTO Sermons (
  preacher_id,
  bible_passage_english,
  bible_passage_urdu,
  location_id,
  date_delivered,
  original_language_id,
  title_english,
  title_urdu,
  summary_english,
  summary_urdu,
  spurgeon_gems_number
)
VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name_english = 'Charles' AND last_name_english = 'Spurgeon'),
  'Malachi 3:6',
  'ملاکی 3:6',
  (SELECT id FROM PreachingLocations WHERE location_name_english = 'Metropolitan Tabernacle'),
  '1855-01-07',
  (SELECT id FROM Languages WHERE language_name_english = 'English'),
  'The Immutability of God',
  'خدا کی عدم تغیر پذیری',
  'A sermon on the eternal unchangeableness of God.',
  'خدا کی ہمیشہ نہ بدلنے والی فطرت پر ایک پیغام',
  1
);

-- Sermon #2
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage_english, bible_passage_urdu, location_id, date_delivered,
  original_language_id, title_english, title_urdu, summary_english, summary_urdu, spurgeon_gems_number
)
VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name_english = 'Charles' AND last_name_english = 'Spurgeon'),
  '1 Corinthians 11:24',
  '1 کورینثی 11:24',
  (SELECT id FROM PreachingLocations WHERE location_name_english = 'New Park Street Chapel, Southwark'),
  '1855-01-07',
  (SELECT id FROM Languages WHERE language_name_english = 'English'),
  'The Remembrance of Christ',
  'مسیح کی یاد',
  'A sermon on the duty and blessing of remembering Christ in the Lord’s Supper.',
  'عشائے ربانی میں مسیح کو یاد کرنے کی ذمہ داری اور برکت پر ایک پیغام',
  2
);

-- Sermon #3
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage_english, bible_passage_urdu, location_id, date_delivered,
  original_language_id, title_english, title_urdu, summary_english, summary_urdu, spurgeon_gems_number
)
VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name_english = 'Charles' AND last_name_english = 'Spurgeon'),
  '2 Kings 7:19',
  '2 کنیں 7:19',
  (SELECT id FROM PreachingLocations WHERE location_name_english = 'New Park Street Chapel, Southwark'),
  '1855-01-14',
  (SELECT id FROM Languages WHERE language_name_english = 'English'),
  'The Sin of Unbelief',
  'کفر کا گناہ',
  'A sermon exposing unbelief as a great sin that dishonors God and endangers the soul.',
  'ایک وعظ جو عدمِ ایمان کو ایک بڑے گناہ کے طور پر ظاہر کرتا ہے جو خدا کی بے عزتی کرتا ہے اور جان کو خطرے میں ڈالتا ہے',
  3
);

-- Sermon #4
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage_english, bible_passage_urdu, location_id, date_delivered,
  original_language_id, title_english, title_urdu, summary_english, summary_urdu, spurgeon_gems_number
)
VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name_english = 'Charles' AND last_name_english = 'Spurgeon'),
  'John 14:16-17',
  'جان 14:16-17',
  (SELECT id FROM PreachingLocations WHERE location_name_english = 'New Park Street Chapel, Southwark'),
  '1855-01-21',
  (SELECT id FROM Languages WHERE language_name_english = 'English'),
  'The Personality of the Holy Ghost',
  'روح القدس کی شخصیت',
  'A sermon affirming the personhood of the Holy Spirit and His work among believers.', 
  'ایک وعظ جو روح القدس کی شخصیت اور ایمانداروں میں اُس کے کام کی تصدیق کرتا ہے',
  4
);

-- Sermon #5
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage_english, bible_passage_urdu, location_id, date_delivered,
  original_language_id, title_english, title_urdu, summary_english, summary_urdu, spurgeon_gems_number
)
VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name_english = 'Charles' AND last_name_english = 'Spurgeon'),
  'John 14:26',
  'جان 14:26',
  (SELECT id FROM PreachingLocations WHERE location_name_english = 'New Park Street Chapel, Southwark'),
  '1855-01-21',
  (SELECT id FROM Languages WHERE language_name_english = 'English'),
  'The Comforter',
  'روحِ تسلی',
  'A sermon on the Holy Spirit as the promised Comforter who teaches and guides believers.',
  'ایک پیغام پاک روح کے بارے میں جو خدا کا وعدہ کیا ہوا مددگار ہے، جو ایمانداروں کو سکھاتا اور رہنمائی کرتا ہے',
  5
);
