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
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage_english, bible_passage_urdu, location_id, date_delivered, original_language_id, title_english, title_urdu, summary_english, summary_urdu, spurgeon_gems_number
) VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name_english = 'Charles' AND last_name_english = 'Spurgeon'),
  'Job 16:20',
  NULL,
  (SELECT id FROM PreachingLocations WHERE location_name_english = 'Metropolitan Tabernacle'),
  '1867-05-12',
  (SELECT id FROM Languages WHERE language_name_english = 'English'),
  'Man’s Scorn and God’s Succor',
  NULL,
  NULL,
  NULL,
  3373
);
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage_english, bible_passage_urdu, location_id, date_delivered, original_language_id, title_english, title_urdu, summary_english, summary_urdu, spurgeon_gems_number
) VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name_english = 'Charles' AND last_name_english = 'Spurgeon'),
  'Romans 7:13',
  NULL,
  (SELECT id FROM PreachingLocations WHERE location_name_english = 'Metropolitan Tabernacle'),
  '1913-10-02',
  (SELECT id FROM Languages WHERE language_name_english = 'English'),
  'Sin’s True Quality',
  NULL,
  NULL,
  NULL,
  3374
);
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage_english, bible_passage_urdu, location_id, date_delivered, original_language_id, title_english, title_urdu, summary_english, summary_urdu, spurgeon_gems_number
) VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name_english = 'Charles' AND last_name_english = 'Spurgeon'),
  'Psalm 26:12',
  NULL,
  (SELECT id FROM PreachingLocations WHERE location_name_english = 'Metropolitan Tabernacle'),
  '1867-01-31',
  (SELECT id FROM Languages WHERE language_name_english = 'English'),
  'Standing and Singing',
  NULL,
  NULL,
  NULL,
  3375
);
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage_english, bible_passage_urdu, location_id, date_delivered, original_language_id, title_english, title_urdu, summary_english, summary_urdu, spurgeon_gems_number
) VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name_english = 'Charles' AND last_name_english = 'Spurgeon'),
  '1 Kings 18:41',
  NULL,
  (SELECT id FROM PreachingLocations WHERE location_name_english = 'Metropolitan Tabernacle'),
  '1868-07-02',
  (SELECT id FROM Languages WHERE language_name_english = 'English'),
  'God’s Answer to Persistent Prayer',
  NULL,
  NULL,
  NULL,
  3376
);
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage_english, bible_passage_urdu, location_id, date_delivered, original_language_id, title_english, title_urdu, summary_english, summary_urdu, spurgeon_gems_number
) VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name_english = 'Charles' AND last_name_english = 'Spurgeon'),
  'Ezekiel 9:8',
  NULL,
  (SELECT id FROM PreachingLocations WHERE location_name_english = 'Metropolitan Tabernacle'),
  '1913-10-23',
  (SELECT id FROM Languages WHERE language_name_english = 'English'),
  'The Greatest Wonder of Grace',
  NULL,
  NULL,
  NULL,
  3377
);
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage_english, bible_passage_urdu, location_id, date_delivered, original_language_id, title_english, title_urdu, summary_english, summary_urdu, spurgeon_gems_number
) VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name_english = 'Charles' AND last_name_english = 'Spurgeon'),
  'Jude 1:21',
  NULL,
  (SELECT id FROM PreachingLocations WHERE location_name_english = 'Metropolitan Tabernacle'),
  '1866-11-04',
  (SELECT id FROM Languages WHERE language_name_english = 'English'),
  'God’s Prison, Warder and Prisoner',
  NULL,
  NULL,
  NULL,
  3378
);
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage_english, bible_passage_urdu, location_id, date_delivered, original_language_id, title_english, title_urdu, summary_english, summary_urdu, spurgeon_gems_number
) VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name_english = 'Charles' AND last_name_english = 'Spurgeon'),
  'Genesis 42:25',
  NULL,
  (SELECT id FROM PreachingLocations WHERE location_name_english = 'Metropolitan Tabernacle'),
  '1913-11-06',
  (SELECT id FROM Languages WHERE language_name_english = 'English'),
  'Rough, but Friendly',
  NULL,
  NULL,
  NULL,
  3379
);
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage_english, bible_passage_urdu, location_id, date_delivered, original_language_id, title_english, title_urdu, summary_english, summary_urdu, spurgeon_gems_number
) VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name_english = 'Charles' AND last_name_english = 'Spurgeon'),
  '2 Corinthians 8:9',
  NULL,
  (SELECT id FROM PreachingLocations WHERE location_name_english = 'Metropolitan Tabernacle'),
  '1867-02-14',
  (SELECT id FROM Languages WHERE language_name_english = 'English'),
  'Our Lord’s Voluntary Poverty',
  NULL,
  NULL,
  NULL,
  3380
);
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage_english, bible_passage_urdu, location_id, date_delivered, original_language_id, title_english, title_urdu, summary_english, summary_urdu, spurgeon_gems_number
) VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name_english = 'Charles' AND last_name_english = 'Spurgeon'),
  'Proverbs 24:30-32',
  NULL,
  (SELECT id FROM PreachingLocations WHERE location_name_english = 'Metropolitan Tabernacle'),
  '1913-11-20',
  (SELECT id FROM Languages WHERE language_name_english = 'English'),
  'The Broken Fence',
  NULL,
  NULL,
  NULL,
  3381
);
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage_english, bible_passage_urdu, location_id, date_delivered, original_language_id, title_english, title_urdu, summary_english, summary_urdu, spurgeon_gems_number
) VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name_english = 'Charles' AND last_name_english = 'Spurgeon'),
  'Micah 5:4',
  NULL,
  (SELECT id FROM PreachingLocations WHERE location_name_english = 'Metropolitan Tabernacle'),
  '1866-12-02',
  (SELECT id FROM Languages WHERE language_name_english = 'English'),
  'Our Lord’s Transcendent Greatness',
  NULL,
  NULL,
  NULL,
  3382
);
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage_english, bible_passage_urdu, location_id, date_delivered, original_language_id, title_english, title_urdu, summary_english, summary_urdu, spurgeon_gems_number
) VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name_english = 'Charles' AND last_name_english = 'Spurgeon'),
  'Isaiah 28:24',
  NULL,
  (SELECT id FROM PreachingLocations WHERE location_name_english = 'Metropolitan Tabernacle'),
  '1913-12-04',
  (SELECT id FROM Languages WHERE language_name_english = 'English'),
  'The Plowman',
  NULL,
  NULL,
  NULL,
  3383
);
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage_english, bible_passage_urdu, location_id, date_delivered, original_language_id, title_english, title_urdu, summary_english, summary_urdu, spurgeon_gems_number
) VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name_english = 'Charles' AND last_name_english = 'Spurgeon'),
  'Luke 17:5',
  NULL,
  (SELECT id FROM PreachingLocations WHERE location_name_english = 'Metropolitan Tabernacle'),
  '1867-12-12',
  (SELECT id FROM Languages WHERE language_name_english = 'English'),
  'Growth in Faith',
  NULL,
  NULL,
  NULL,
  3384
);
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage_english, bible_passage_urdu, location_id, date_delivered, original_language_id, title_english, title_urdu, summary_english, summary_urdu, spurgeon_gems_number
) VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name_english = 'Charles' AND last_name_english = 'Spurgeon'),
  'John 19:28',
  NULL,
  (SELECT id FROM PreachingLocations WHERE location_name_english = 'Metropolitan Tabernacle'),
  '1913-12-18',
  (SELECT id FROM Languages WHERE language_name_english = 'English'),
  'The Savior’s Thirst',
  NULL,
  NULL,
  NULL,
  3385
);
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage_english, bible_passage_urdu, location_id, date_delivered, original_language_id, title_english, title_urdu, summary_english, summary_urdu, spurgeon_gems_number
) VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name_english = 'Charles' AND last_name_english = 'Spurgeon'),
  'Ephesians 2:14',
  NULL,
  (SELECT id FROM PreachingLocations WHERE location_name_english = 'Metropolitan Tabernacle'),
  '1868-01-19',
  (SELECT id FROM Languages WHERE language_name_english = 'English'),
  'Christ our Peace',
  NULL,
  NULL,
  NULL,
  3386
);
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage_english, bible_passage_urdu, location_id, date_delivered, original_language_id, title_english, title_urdu, summary_english, summary_urdu, spurgeon_gems_number
) VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name_english = 'Charles' AND last_name_english = 'Spurgeon'),
  'Hebrews 13:5',
  NULL,
  (SELECT id FROM PreachingLocations WHERE location_name_english = 'Metropolitan Tabernacle'),
  '1868-09-03',
  (SELECT id FROM Languages WHERE language_name_english = 'English'),
  'A New Year’s Benediction',
  NULL,
  NULL,
  NULL,
  3387
);
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage_english, bible_passage_urdu, location_id, date_delivered, original_language_id, title_english, title_urdu, summary_english, summary_urdu, spurgeon_gems_number
) VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name_english = 'Charles' AND last_name_english = 'Spurgeon'),
  'Isaiah 28:27-28',
  NULL,
  (SELECT id FROM PreachingLocations WHERE location_name_english = 'Metropolitan Tabernacle'),
  '1914-01-08',
  (SELECT id FROM Languages WHERE language_name_english = 'English'),
  'Soul Threshing',
  NULL,
  NULL,
  NULL,
  3388
);
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage_english, bible_passage_urdu, location_id, date_delivered, original_language_id, title_english, title_urdu, summary_english, summary_urdu, spurgeon_gems_number
) VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name_english = 'Charles' AND last_name_english = 'Spurgeon'),
  'John 5:25',
  NULL,
  (SELECT id FROM PreachingLocations WHERE location_name_english = 'Metropolitan Tabernacle'),
  '1914-01-15',
  (SELECT id FROM Languages WHERE language_name_english = 'English'),
  'The Soul’s Awakening',
  NULL,
  NULL,
  NULL,
  3389
);
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage_english, bible_passage_urdu, location_id, date_delivered, original_language_id, title_english, title_urdu, summary_english, summary_urdu, spurgeon_gems_number
) VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name_english = 'Charles' AND last_name_english = 'Spurgeon'),
  'Psalm 33:18',
  NULL,
  (SELECT id FROM PreachingLocations WHERE location_name_english = 'Metropolitan Tabernacle'),
  '1868-02-16',
  (SELECT id FROM Languages WHERE language_name_english = 'English'),
  'Hoping in God’s Mercy',
  NULL,
  NULL,
  NULL,
  3390
);
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage_english, bible_passage_urdu, location_id, date_delivered, original_language_id, title_english, title_urdu, summary_english, summary_urdu, spurgeon_gems_number
) VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name_english = 'Charles' AND last_name_english = 'Spurgeon'),
  '1 Corinthians 11:28',
  NULL,
  (SELECT id FROM PreachingLocations WHERE location_name_english = 'Metropolitan Tabernacle'),
  '1914-01-29',
  (SELECT id FROM Languages WHERE language_name_english = 'English'),
  'Preparation for the Lord’s Supper',
  NULL,
  NULL,
  NULL,
  3391
);
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage_english, bible_passage_urdu, location_id, date_delivered, original_language_id, title_english, title_urdu, summary_english, summary_urdu, spurgeon_gems_number
) VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name_english = 'Charles' AND last_name_english = 'Spurgeon'),
  'Romans 5:1',
  NULL,
  (SELECT id FROM PreachingLocations WHERE location_name_english = 'Metropolitan Tabernacle'),
  '1867-04-28',
  (SELECT id FROM Languages WHERE language_name_english = 'English'),
  'Justification by Faith',
  NULL,
  NULL,
  NULL,
  3392
);
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage_english, bible_passage_urdu, location_id, date_delivered, original_language_id, title_english, title_urdu, summary_english, summary_urdu, spurgeon_gems_number
) VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name_english = 'Charles' AND last_name_english = 'Spurgeon'),
  'Matthew 13:30',
  NULL,
  (SELECT id FROM PreachingLocations WHERE location_name_english = 'Metropolitan Tabernacle'),
  '1914-02-12',
  (SELECT id FROM Languages WHERE language_name_english = 'English'),
  'Wheat in the Barn',
  NULL,
  NULL,
  NULL,
  3393
);
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage_english, bible_passage_urdu, location_id, date_delivered, original_language_id, title_english, title_urdu, summary_english, summary_urdu, spurgeon_gems_number
) VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name_english = 'Charles' AND last_name_english = 'Spurgeon'),
  'Matthew 21:10',
  NULL,
  (SELECT id FROM PreachingLocations WHERE location_name_english = 'Metropolitan Tabernacle'),
  '1914-02-19',
  (SELECT id FROM Languages WHERE language_name_english = 'English'),
  'Who Is This?',
  NULL,
  NULL,
  NULL,
  3394
);
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage_english, bible_passage_urdu, location_id, date_delivered, original_language_id, title_english, title_urdu, summary_english, summary_urdu, spurgeon_gems_number
) VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name_english = 'Charles' AND last_name_english = 'Spurgeon'),
  '1 Peter 1:19',
  NULL,
  (SELECT id FROM PreachingLocations WHERE location_name_english = 'Metropolitan Tabernacle'),
  '1914-02-26',
  (SELECT id FROM Languages WHERE language_name_english = 'English'),
  'The Savior’s Precious Blood',
  NULL,
  NULL,
  NULL,
  3395
);
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage_english, bible_passage_urdu, location_id, date_delivered, original_language_id, title_english, title_urdu, summary_english, summary_urdu, spurgeon_gems_number
) VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name_english = 'Charles' AND last_name_english = 'Spurgeon'),
  'Psalm 48:8',
  NULL,
  (SELECT id FROM PreachingLocations WHERE location_name_english = 'Metropolitan Tabernacle'),
  '1869-05-27',
  (SELECT id FROM Languages WHERE language_name_english = 'English'),
  'Experience Confirming Testimony',
  NULL,
  NULL,
  NULL,
  3396
);
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage_english, bible_passage_urdu, location_id, date_delivered, original_language_id, title_english, title_urdu, summary_english, summary_urdu, spurgeon_gems_number
) VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name_english = 'Charles' AND last_name_english = 'Spurgeon'),
  'Luke 24:5',
  NULL,
  (SELECT id FROM PreachingLocations WHERE location_name_english = 'Metropolitan Tabernacle'),
  '1914-03-12',
  (SELECT id FROM Languages WHERE language_name_english = 'English'),
  'A Timely Expostulation',
  NULL,
  NULL,
  NULL,
  3397
);
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage_english, bible_passage_urdu, location_id, date_delivered, original_language_id, title_english, title_urdu, summary_english, summary_urdu, spurgeon_gems_number
) VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name_english = 'Charles' AND last_name_english = 'Spurgeon'),
  '1 John 4:19',
  NULL,
  (SELECT id FROM PreachingLocations WHERE location_name_english = 'Metropolitan Tabernacle'),
  '1914-03-19',
  (SELECT id FROM Languages WHERE language_name_english = 'English'),
  'Love’s Great Reason',
  NULL,
  NULL,
  NULL,
  3398
);
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage_english, bible_passage_urdu, location_id, date_delivered, original_language_id, title_english, title_urdu, summary_english, summary_urdu, spurgeon_gems_number
) VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name_english = 'Charles' AND last_name_english = 'Spurgeon'),
  '1 Chronicles 16:9',
  NULL,
  (SELECT id FROM PreachingLocations WHERE location_name_english = 'Metropolitan Tabernacle'),
  '1914-03-26',
  (SELECT id FROM Languages WHERE language_name_english = 'English'),
  'Good Talk',
  NULL,
  NULL,
  NULL,
  3399
);
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage_english, bible_passage_urdu, location_id, date_delivered, original_language_id, title_english, title_urdu, summary_english, summary_urdu, spurgeon_gems_number
) VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name_english = 'Charles' AND last_name_english = 'Spurgeon'),
  'Leviticus 16:34',
  NULL,
  (SELECT id FROM PreachingLocations WHERE location_name_english = 'Metropolitan Tabernacle'),
  '1869-05-09',
  (SELECT id FROM Languages WHERE language_name_english = 'English'),
  'The Day of Atonement',
  NULL,
  NULL,
  NULL,
  3400
);
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage_english, bible_passage_urdu, location_id, date_delivered, original_language_id, title_english, title_urdu, summary_english, summary_urdu, spurgeon_gems_number
) VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name_english = 'Charles' AND last_name_english = 'Spurgeon'),
  'John 14:19',
  NULL,
  (SELECT id FROM PreachingLocations WHERE location_name_english = 'Metropolitan Tabernacle'),
  '1867-12-01',
  (SELECT id FROM Languages WHERE language_name_english = 'English'),
  'Sharing Christ’s Life',
  NULL,
  NULL,
  NULL,
  3401
);
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage_english, bible_passage_urdu, location_id, date_delivered, original_language_id, title_english, title_urdu, summary_english, summary_urdu, spurgeon_gems_number
) VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name_english = 'Charles' AND last_name_english = 'Spurgeon'),
  'Isaiah 22:23-25',
  NULL,
  (SELECT id FROM PreachingLocations WHERE location_name_english = 'Metropolitan Tabernacle'),
  '1914-04-16',
  (SELECT id FROM Languages WHERE language_name_english = 'English'),
  'The Nail in a Sure Place',
  NULL,
  NULL,
  NULL,
  3402
);
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage_english, bible_passage_urdu, location_id, date_delivered, original_language_id, title_english, title_urdu, summary_english, summary_urdu, spurgeon_gems_number
) VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name_english = 'Charles' AND last_name_english = 'Spurgeon'),
  'Revelation 7:9-10',
  NULL,
  (SELECT id FROM PreachingLocations WHERE location_name_english = 'Metropolitan Tabernacle'),
  '1914-04-23',
  (SELECT id FROM Languages WHERE language_name_english = 'English'),
  'The Multitude Before the Throne',
  NULL,
  NULL,
  NULL,
  3403
);
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage_english, bible_passage_urdu, location_id, date_delivered, original_language_id, title_english, title_urdu, summary_english, summary_urdu, spurgeon_gems_number
) VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name_english = 'Charles' AND last_name_english = 'Spurgeon'),
  'Matthew 27:30',
  NULL,
  (SELECT id FROM PreachingLocations WHERE location_name_english = 'Metropolitan Tabernacle'),
  '1914-04-30',
  (SELECT id FROM Languages WHERE language_name_english = 'English'),
  'A Gross Indignity',
  NULL,
  NULL,
  NULL,
  3404
);
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage_english, bible_passage_urdu, location_id, date_delivered, original_language_id, title_english, title_urdu, summary_english, summary_urdu, spurgeon_gems_number
) VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name_english = 'Charles' AND last_name_english = 'Spurgeon'),
  'Matthew 10:32-33',
  NULL,
  (SELECT id FROM PreachingLocations WHERE location_name_english = 'Metropolitan Tabernacle'),
  '1868-03-21',
  (SELECT id FROM Languages WHERE language_name_english = 'English'),
  'Confession of Christ',
  NULL,
  NULL,
  NULL,
  3405
);
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage_english, bible_passage_urdu, location_id, date_delivered, original_language_id, title_english, title_urdu, summary_english, summary_urdu, spurgeon_gems_number
) VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name_english = 'Charles' AND last_name_english = 'Spurgeon'),
  '1 John 1:4',
  NULL,
  (SELECT id FROM PreachingLocations WHERE location_name_english = 'Metropolitan Tabernacle'),
  '1914-05-14',
  (SELECT id FROM Languages WHERE language_name_english = 'English'),
  'Fullness of Joy our Privilege',
  NULL,
  NULL,
  NULL,
  3406
);
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage_english, bible_passage_urdu, location_id, date_delivered, original_language_id, title_english, title_urdu, summary_english, summary_urdu, spurgeon_gems_number
) VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name_english = 'Charles' AND last_name_english = 'Spurgeon'),
  'Luke 5:8',
  NULL,
  (SELECT id FROM PreachingLocations WHERE location_name_english = 'Metropolitan Tabernacle'),
  '1869-06-10',
  (SELECT id FROM Languages WHERE language_name_english = 'English'),
  'Peter’s Prayer',
  NULL,
  NULL,
  NULL,
  3407
);
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage_english, bible_passage_urdu, location_id, date_delivered, original_language_id, title_english, title_urdu, summary_english, summary_urdu, spurgeon_gems_number
) VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name_english = 'Charles' AND last_name_english = 'Spurgeon'),
  'Ephesians 2:9',
  NULL,
  (SELECT id FROM PreachingLocations WHERE location_name_english = 'Metropolitan Tabernacle'),
  '1914-05-28',
  (SELECT id FROM Languages WHERE language_name_english = 'English'),
  'Not Boasting but Trusting',
  NULL,
  NULL,
  NULL,
  3408
);
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage_english, bible_passage_urdu, location_id, date_delivered, original_language_id, title_english, title_urdu, summary_english, summary_urdu, spurgeon_gems_number
) VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name_english = 'Charles' AND last_name_english = 'Spurgeon'),
  'Psalm 34:10',
  NULL,
  (SELECT id FROM PreachingLocations WHERE location_name_english = 'Metropolitan Tabernacle'),
  '1869-04-08',
  (SELECT id FROM Languages WHERE language_name_english = 'English'),
  'Seeking Richly Rewarded',
  NULL,
  NULL,
  NULL,
  3409
);
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage_english, bible_passage_urdu, location_id, date_delivered, original_language_id, title_english, title_urdu, summary_english, summary_urdu, spurgeon_gems_number
) VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name_english = 'Charles' AND last_name_english = 'Spurgeon'),
  'Luke 15:1-2',
  NULL,
  (SELECT id FROM PreachingLocations WHERE location_name_english = 'Metropolitan Tabernacle'),
  '1914-06-11',
  (SELECT id FROM Languages WHERE language_name_english = 'English'),
  'Christ and His Hearers',
  NULL,
  NULL,
  NULL,
  3410
);
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage_english, bible_passage_urdu, location_id, date_delivered, original_language_id, title_english, title_urdu, summary_english, summary_urdu, spurgeon_gems_number
) VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name_english = 'Charles' AND last_name_english = 'Spurgeon'),
  '2 Corinthians 8:5',
  NULL,
  (SELECT id FROM PreachingLocations WHERE location_name_english = 'Metropolitan Tabernacle'),
  '1869-10-24',
  (SELECT id FROM Languages WHERE language_name_english = 'English'),
  'Joining the Church',
  NULL,
  NULL,
  NULL,
  3411
);
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage_english, bible_passage_urdu, location_id, date_delivered, original_language_id, title_english, title_urdu, summary_english, summary_urdu, spurgeon_gems_number
) VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name_english = 'Charles' AND last_name_english = 'Spurgeon'),
  'Revelation 4:3',
  NULL,
  (SELECT id FROM PreachingLocations WHERE location_name_english = 'Metropolitan Tabernacle'),
  '1914-06-25',
  (SELECT id FROM Languages WHERE language_name_english = 'English'),
  'The Heavenly Rainbow',
  NULL,
  NULL,
  NULL,
  3412
);
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage_english, bible_passage_urdu, location_id, date_delivered, original_language_id, title_english, title_urdu, summary_english, summary_urdu, spurgeon_gems_number
) VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name_english = 'Charles' AND last_name_english = 'Spurgeon'),
  'Psalm 59:10',
  NULL,
  (SELECT id FROM PreachingLocations WHERE location_name_english = 'Metropolitan Tabernacle'),
  '1870-02-10',
  (SELECT id FROM Languages WHERE language_name_english = 'English'),
  'God’s Mercy Going Before',
  NULL,
  NULL,
  NULL,
  3413
);
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage_english, bible_passage_urdu, location_id, date_delivered, original_language_id, title_english, title_urdu, summary_english, summary_urdu, spurgeon_gems_number
) VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name_english = 'Charles' AND last_name_english = 'Spurgeon'),
  'Psalm 39:4',
  NULL,
  (SELECT id FROM PreachingLocations WHERE location_name_english = 'Metropolitan Tabernacle'),
  '1914-07-09',
  (SELECT id FROM Languages WHERE language_name_english = 'English'),
  'Brief Life Is Here Our Portion',
  NULL,
  NULL,
  NULL,
  3414
);
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage_english, bible_passage_urdu, location_id, date_delivered, original_language_id, title_english, title_urdu, summary_english, summary_urdu, spurgeon_gems_number
) VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name_english = 'Charles' AND last_name_english = 'Spurgeon'),
  'Mark 9:43',
  NULL,
  (SELECT id FROM PreachingLocations WHERE location_name_english = 'Metropolitan Tabernacle'),
  '1914-07-16',
  (SELECT id FROM Languages WHERE language_name_english = 'English'),
  'Right-Hand Sins',
  NULL,
  NULL,
  NULL,
  3415
);
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage_english, bible_passage_urdu, location_id, date_delivered, original_language_id, title_english, title_urdu, summary_english, summary_urdu, spurgeon_gems_number
) VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name_english = 'Charles' AND last_name_english = 'Spurgeon'),
  'Psalm 91:15',
  NULL,
  (SELECT id FROM PreachingLocations WHERE location_name_english = 'Metropolitan Tabernacle'),
  '1914-07-23',
  (SELECT id FROM Languages WHERE language_name_english = 'English'),
  'Shall And Will',
  NULL,
  NULL,
  NULL,
  3416
);
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage_english, bible_passage_urdu, location_id, date_delivered, original_language_id, title_english, title_urdu, summary_english, summary_urdu, spurgeon_gems_number
) VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name_english = 'Charles' AND last_name_english = 'Spurgeon'),
  'Psalm 103:5',
  NULL,
  (SELECT id FROM PreachingLocations WHERE location_name_english = 'Metropolitan Tabernacle'),
  '1870-02-24',
  (SELECT id FROM Languages WHERE language_name_english = 'English'),
  'Our Youth Renewed',
  NULL,
  NULL,
  NULL,
  3417
);
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage_english, bible_passage_urdu, location_id, date_delivered, original_language_id, title_english, title_urdu, summary_english, summary_urdu, spurgeon_gems_number
) VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name_english = 'Charles' AND last_name_english = 'Spurgeon'),
  'Hebrews 9:23',
  NULL,
  (SELECT id FROM PreachingLocations WHERE location_name_english = 'Metropolitan Tabernacle'),
  '1914-08-06',
  (SELECT id FROM Languages WHERE language_name_english = 'English'),
  'An Unalterable Law',
  NULL,
  NULL,
  NULL,
  3418
);
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage_english, bible_passage_urdu, location_id, date_delivered, original_language_id, title_english, title_urdu, summary_english, summary_urdu, spurgeon_gems_number
) VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name_english = 'Charles' AND last_name_english = 'Spurgeon'),
  'Jeremiah 31:32',
  NULL,
  (SELECT id FROM PreachingLocations WHERE location_name_english = 'Metropolitan Tabernacle'),
  '1869-09-30',
  (SELECT id FROM Languages WHERE language_name_english = 'English'),
  'God, The Husband Of His People',
  NULL,
  NULL,
  NULL,
  3419
);
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage_english, bible_passage_urdu, location_id, date_delivered, original_language_id, title_english, title_urdu, summary_english, summary_urdu, spurgeon_gems_number
) VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name_english = 'Charles' AND last_name_english = 'Spurgeon'),
  'John 11:37',
  NULL,
  (SELECT id FROM PreachingLocations WHERE location_name_english = 'Metropolitan Tabernacle'),
  '1914-08-20',
  (SELECT id FROM Languages WHERE language_name_english = 'English'),
  'Could He Not? Ah! But He Would Not',
  NULL,
  NULL,
  NULL,
  3420
);
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage_english, bible_passage_urdu, location_id, date_delivered, original_language_id, title_english, title_urdu, summary_english, summary_urdu, spurgeon_gems_number
) VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name_english = 'Charles' AND last_name_english = 'Spurgeon'),
  'Acts 1:14',
  NULL,
  (SELECT id FROM PreachingLocations WHERE location_name_english = 'Metropolitan Tabernacle'),
  '1868-08-30',
  (SELECT id FROM Languages WHERE language_name_english = 'English'),
  'Prayer Meetings',
  NULL,
  NULL,
  NULL,
  3421
);
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage_english, bible_passage_urdu, location_id, date_delivered, original_language_id, title_english, title_urdu, summary_english, summary_urdu, spurgeon_gems_number
) VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name_english = 'Charles' AND last_name_english = 'Spurgeon'),
  'Isaiah 52:2',
  NULL,
  (SELECT id FROM PreachingLocations WHERE location_name_english = 'Metropolitan Tabernacle'),
  '1914-09-03',
  (SELECT id FROM Languages WHERE language_name_english = 'English'),
  'A Call To The Depressed',
  NULL,
  NULL,
  NULL,
  3422
);
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage_english, bible_passage_urdu, location_id, date_delivered, original_language_id, title_english, title_urdu, summary_english, summary_urdu, spurgeon_gems_number
) VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name_english = 'Charles' AND last_name_english = 'Spurgeon'),
  'Psalm 48:12-14',
  NULL,
  (SELECT id FROM PreachingLocations WHERE location_name_english = 'Metropolitan Tabernacle'),
  '1870-07-14',
  (SELECT id FROM Languages WHERE language_name_english = 'English'),
  'Beholding God’s Church',
  NULL,
  NULL,
  NULL,
  3423
);
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage_english, bible_passage_urdu, location_id, date_delivered, original_language_id, title_english, title_urdu, summary_english, summary_urdu, spurgeon_gems_number
) VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name_english = 'Charles' AND last_name_english = 'Spurgeon'),
  'John 6:55',
  NULL,
  (SELECT id FROM PreachingLocations WHERE location_name_english = 'Metropolitan Tabernacle'),
  '1914-09-17',
  (SELECT id FROM Languages WHERE language_name_english = 'English'),
  'Meat Indeed, And Drink Indeed',
  NULL,
  NULL,
  NULL,
  3424
);
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage_english, bible_passage_urdu, location_id, date_delivered, original_language_id, title_english, title_urdu, summary_english, summary_urdu, spurgeon_gems_number
) VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name_english = 'Charles' AND last_name_english = 'Spurgeon'),
  'Deuteronomy 11:21',
  NULL,
  (SELECT id FROM PreachingLocations WHERE location_name_english = 'Metropolitan Tabernacle'),
  '1866-09-23',
  (SELECT id FROM Languages WHERE language_name_english = 'English'),
  'Days Of Heaven Upon The Earth',
  NULL,
  NULL,
  NULL,
  3425
);
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage_english, bible_passage_urdu, location_id, date_delivered, original_language_id, title_english, title_urdu, summary_english, summary_urdu, spurgeon_gems_number
) VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name_english = 'Charles' AND last_name_english = 'Spurgeon'),
  'Jeremiah 50:6',
  NULL,
  (SELECT id FROM PreachingLocations WHERE location_name_english = 'Metropolitan Tabernacle'),
  '1914-09-01',
  (SELECT id FROM Languages WHERE language_name_english = 'English'),
  'A Sore Grievance',
  NULL,
  NULL,
  NULL,
  3426
);
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage_english, bible_passage_urdu, location_id, date_delivered, original_language_id, title_english, title_urdu, summary_english, summary_urdu, spurgeon_gems_number
) VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name_english = 'Charles' AND last_name_english = 'Spurgeon'),
  'Matthew 21:9',
  NULL,
  (SELECT id FROM PreachingLocations WHERE location_name_english = 'Metropolitan Tabernacle'),
  '1870-07-21',
  (SELECT id FROM Languages WHERE language_name_english = 'English'),
  'The Blessed Christ',
  NULL,
  NULL,
  NULL,
  3427
);
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage_english, bible_passage_urdu, location_id, date_delivered, original_language_id, title_english, title_urdu, summary_english, summary_urdu, spurgeon_gems_number
) VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name_english = 'Charles' AND last_name_english = 'Spurgeon'),
  'Psalm 25:14',
  NULL,
  (SELECT id FROM PreachingLocations WHERE location_name_english = 'Metropolitan Tabernacle'),
  '1914-10-15',
  (SELECT id FROM Languages WHERE language_name_english = 'English'),
  'Private And Confidential',
  NULL,
  NULL,
  NULL,
  3428
);
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage_english, bible_passage_urdu, location_id, date_delivered, original_language_id, title_english, title_urdu, summary_english, summary_urdu, spurgeon_gems_number
) VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name_english = 'Charles' AND last_name_english = 'Spurgeon'),
  'Ephesians 1:6',
  NULL,
  (SELECT id FROM PreachingLocations WHERE location_name_english = 'Metropolitan Tabernacle'),
  '1868-11-19',
  (SELECT id FROM Languages WHERE language_name_english = 'English'),
  'Accepted In The Beloved',
  NULL,
  NULL,
  NULL,
  3429
);
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage_english, bible_passage_urdu, location_id, date_delivered, original_language_id, title_english, title_urdu, summary_english, summary_urdu, spurgeon_gems_number
) VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name_english = 'Charles' AND last_name_english = 'Spurgeon'),
  'John 14:9',
  NULL,
  (SELECT id FROM PreachingLocations WHERE location_name_english = 'Metropolitan Tabernacle'),
  '1914-10-29',
  (SELECT id FROM Languages WHERE language_name_english = 'English'),
  'Chiding And Cheering',
  NULL,
  NULL,
  NULL,
  3430
);
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage_english, bible_passage_urdu, location_id, date_delivered, original_language_id, title_english, title_urdu, summary_english, summary_urdu, spurgeon_gems_number
) VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name_english = 'Charles' AND last_name_english = 'Spurgeon'),
  '2 Samuel 15:23',
  NULL,
  (SELECT id FROM PreachingLocations WHERE location_name_english = 'Metropolitan Tabernacle'),
  '1869-06-18',
  (SELECT id FROM Languages WHERE language_name_english = 'English'),
  'The King Passing Over Kidron',
  NULL,
  NULL,
  NULL,
  3431
);
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage_english, bible_passage_urdu, location_id, date_delivered, original_language_id, title_english, title_urdu, summary_english, summary_urdu, spurgeon_gems_number
) VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name_english = 'Charles' AND last_name_english = 'Spurgeon'),
  'Isaiah 9:7',
  NULL,
  (SELECT id FROM PreachingLocations WHERE location_name_english = 'Metropolitan Tabernacle'),
  '1914-11-12',
  (SELECT id FROM Languages WHERE language_name_english = 'English'),
  'The Zeal Of The LORD',
  NULL,
  NULL,
  NULL,
  3432
);
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage_english, bible_passage_urdu, location_id, date_delivered, original_language_id, title_english, title_urdu, summary_english, summary_urdu, spurgeon_gems_number
) VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name_english = 'Charles' AND last_name_english = 'Spurgeon'),
  'Psalm 91:14',
  NULL,
  (SELECT id FROM PreachingLocations WHERE location_name_english = 'Metropolitan Tabernacle'),
  '1914-11-19',
  (SELECT id FROM Languages WHERE language_name_english = 'English'),
  'Love’s Reward',
  NULL,
  NULL,
  NULL,
  3433
);
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage_english, bible_passage_urdu, location_id, date_delivered, original_language_id, title_english, title_urdu, summary_english, summary_urdu, spurgeon_gems_number
) VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name_english = 'Charles' AND last_name_english = 'Spurgeon'),
  'James 2:17',
  NULL,
  (SELECT id FROM PreachingLocations WHERE location_name_english = 'Metropolitan Tabernacle'),
  '1914-11-26',
  (SELECT id FROM Languages WHERE language_name_english = 'English'),
  'Fruitless Faith',
  NULL,
  NULL,
  NULL,
  3434
);
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage_english, bible_passage_urdu, location_id, date_delivered, original_language_id, title_english, title_urdu, summary_english, summary_urdu, spurgeon_gems_number
) VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name_english = 'Charles' AND last_name_english = 'Spurgeon'),
  'Isaiah 54:11-12',
  NULL,
  (SELECT id FROM PreachingLocations WHERE location_name_english = 'Metropolitan Tabernacle'),
  '1914-12-03',
  (SELECT id FROM Languages WHERE language_name_english = 'English'),
  'Sanctified Sorrow',
  NULL,
  NULL,
  NULL,
  3435
);
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage_english, bible_passage_urdu, location_id, date_delivered, original_language_id, title_english, title_urdu, summary_english, summary_urdu, spurgeon_gems_number
) VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name_english = 'Charles' AND last_name_english = 'Spurgeon'),
  'Isaiah 55:5',
  NULL,
  (SELECT id FROM PreachingLocations WHERE location_name_english = 'Metropolitan Tabernacle'),
  '1869-02-04',
  (SELECT id FROM Languages WHERE language_name_english = 'English'),
  'Christ Glorified',
  NULL,
  NULL,
  NULL,
  3436
);
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage_english, bible_passage_urdu, location_id, date_delivered, original_language_id, title_english, title_urdu, summary_english, summary_urdu, spurgeon_gems_number
) VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name_english = 'Charles' AND last_name_english = 'Spurgeon'),
  'John 15:14',
  NULL,
  (SELECT id FROM PreachingLocations WHERE location_name_english = 'Metropolitan Tabernacle'),
  '1870-09-11',
  (SELECT id FROM Languages WHERE language_name_english = 'English'),
  'Friendship’s Guide',
  NULL,
  NULL,
  NULL,
  3437
);
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage_english, bible_passage_urdu, location_id, date_delivered, original_language_id, title_english, title_urdu, summary_english, summary_urdu, spurgeon_gems_number
) VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name_english = 'Charles' AND last_name_english = 'Spurgeon'),
  'Matthew 9:36',
  NULL,
  (SELECT id FROM PreachingLocations WHERE location_name_english = 'Metropolitan Tabernacle'),
  '1914-12-24',
  (SELECT id FROM Languages WHERE language_name_english = 'English'),
  'The Compassion Of Jesus',
  NULL,
  NULL,
  NULL,
  3438
);
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage_english, bible_passage_urdu, location_id, date_delivered, original_language_id, title_english, title_urdu, summary_english, summary_urdu, spurgeon_gems_number
) VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name_english = 'Charles' AND last_name_english = 'Spurgeon'),
  'Isaiah 40:8',
  NULL,
  (SELECT id FROM PreachingLocations WHERE location_name_english = 'Metropolitan Tabernacle'),
  '1868-11-26',
  (SELECT id FROM Languages WHERE language_name_english = 'English'),
  'Man Transient: God’s Word Eternal',
  NULL,
  NULL,
  NULL,
  3439
);
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage_english, bible_passage_urdu, location_id, date_delivered, original_language_id, title_english, title_urdu, summary_english, summary_urdu, spurgeon_gems_number
) VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name_english = 'Charles' AND last_name_english = 'Spurgeon'),
  'Matthew 17:5',
  NULL,
  (SELECT id FROM PreachingLocations WHERE location_name_english = 'Metropolitan Tabernacle'),
  '1915-01-07',
  (SELECT id FROM Languages WHERE language_name_english = 'English'),
  'Attention!',
  NULL,
  NULL,
  NULL,
  3440
);
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage_english, bible_passage_urdu, location_id, date_delivered, original_language_id, title_english, title_urdu, summary_english, summary_urdu, spurgeon_gems_number
) VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name_english = 'Charles' AND last_name_english = 'Spurgeon'),
  'Isaiah 49:16',
  NULL,
  (SELECT id FROM PreachingLocations WHERE location_name_english = 'Metropolitan Tabernacle'),
  '1915-01-14',
  (SELECT id FROM Languages WHERE language_name_english = 'English'),
  'God’s Memorial Of His People',
  NULL,
  NULL,
  NULL,
  3441
);
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage_english, bible_passage_urdu, location_id, date_delivered, original_language_id, title_english, title_urdu, summary_english, summary_urdu, spurgeon_gems_number
) VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name_english = 'Charles' AND last_name_english = 'Spurgeon'),
  'Haggai 2:7',
  NULL,
  (SELECT id FROM PreachingLocations WHERE location_name_english = 'Metropolitan Tabernacle'),
  '1915-01-21',
  (SELECT id FROM Languages WHERE language_name_english = 'English'),
  'The Desire Of All Nations',
  NULL,
  NULL,
  NULL,
  3442
);
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage_english, bible_passage_urdu, location_id, date_delivered, original_language_id, title_english, title_urdu, summary_english, summary_urdu, spurgeon_gems_number
) VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name_english = 'Charles' AND last_name_english = 'Spurgeon'),
  'John 14:19',
  NULL,
  (SELECT id FROM PreachingLocations WHERE location_name_english = 'Metropolitan Tabernacle'),
  '1896-09-09',
  (SELECT id FROM Languages WHERE language_name_english = 'English'),
  'Seeing Jesus',
  NULL,
  NULL,
  NULL,
  3443
);
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage_english, bible_passage_urdu, location_id, date_delivered, original_language_id, title_english, title_urdu, summary_english, summary_urdu, spurgeon_gems_number
) VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name_english = 'Charles' AND last_name_english = 'Spurgeon'),
  'Psalm 22:29',
  NULL,
  (SELECT id FROM PreachingLocations WHERE location_name_english = 'Metropolitan Tabernacle'),
  '1870-03-27',
  (SELECT id FROM Languages WHERE language_name_english = 'English'),
  'Keeping The Soul Alive',
  NULL,
  NULL,
  NULL,
  3444
);
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage_english, bible_passage_urdu, location_id, date_delivered, original_language_id, title_english, title_urdu, summary_english, summary_urdu, spurgeon_gems_number
) VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name_english = 'Charles' AND last_name_english = 'Spurgeon'),
  'Psalm 57:2',
  NULL,
  (SELECT id FROM PreachingLocations WHERE location_name_english = 'Metropolitan Tabernacle'),
  '1915-02-11',
  (SELECT id FROM Languages WHERE language_name_english = 'English'),
  'Strong Faith In A Faithful God',
  NULL,
  NULL,
  NULL,
  3445
);
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage_english, bible_passage_urdu, location_id, date_delivered, original_language_id, title_english, title_urdu, summary_english, summary_urdu, spurgeon_gems_number
) VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name_english = 'Charles' AND last_name_english = 'Spurgeon'),
  'Colossians 3:11',
  NULL,
  (SELECT id FROM PreachingLocations WHERE location_name_english = 'Metropolitan Tabernacle'),
  '1915-02-18',
  (SELECT id FROM Languages WHERE language_name_english = 'English'),
  'Christ Is All',
  NULL,
  NULL,
  NULL,
  3446
);
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage_english, bible_passage_urdu, location_id, date_delivered, original_language_id, title_english, title_urdu, summary_english, summary_urdu, spurgeon_gems_number
) VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name_english = 'Charles' AND last_name_english = 'Spurgeon'),
  'Acts 18:10',
  NULL,
  (SELECT id FROM PreachingLocations WHERE location_name_english = 'Metropolitan Tabernacle'),
  '1915-02-25',
  (SELECT id FROM Languages WHERE language_name_english = 'English'),
  'A Present Helper',
  NULL,
  NULL,
  NULL,
  3447
);
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage_english, bible_passage_urdu, location_id, date_delivered, original_language_id, title_english, title_urdu, summary_english, summary_urdu, spurgeon_gems_number
) VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name_english = 'Charles' AND last_name_english = 'Spurgeon'),
  'Exodus 33:18-23',
  NULL,
  (SELECT id FROM PreachingLocations WHERE location_name_english = 'Metropolitan Tabernacle'),
  '1915-03-04',
  (SELECT id FROM Languages WHERE language_name_english = 'English'),
  'God’s Glory And His Goodness',
  NULL,
  NULL,
  NULL,
  3448
);
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage_english, bible_passage_urdu, location_id, date_delivered, original_language_id, title_english, title_urdu, summary_english, summary_urdu, spurgeon_gems_number
) VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name_english = 'Charles' AND last_name_english = 'Spurgeon'),
  'Proverbs 23:23',
  NULL,
  (SELECT id FROM PreachingLocations WHERE location_name_english = 'Metropolitan Tabernacle'),
  '1870-06-26',
  (SELECT id FROM Languages WHERE language_name_english = 'English'),
  'Buying The Truth',
  NULL,
  NULL,
  NULL,
  3449
);
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage_english, bible_passage_urdu, location_id, date_delivered, original_language_id, title_english, title_urdu, summary_english, summary_urdu, spurgeon_gems_number
) VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name_english = 'Charles' AND last_name_english = 'Spurgeon'),
  'Genesis 19:16',
  NULL,
  (SELECT id FROM PreachingLocations WHERE location_name_english = 'Metropolitan Tabernacle'),
  '1915-03-18',
  (SELECT id FROM Languages WHERE language_name_english = 'English'),
  'Dangerous Lingering',
  NULL,
  NULL,
  NULL,
  3450
);
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage_english, bible_passage_urdu, location_id, date_delivered, original_language_id, title_english, title_urdu, summary_english, summary_urdu, spurgeon_gems_number
) VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name_english = 'Charles' AND last_name_english = 'Spurgeon'),
  'Galatians 6:14',
  NULL,
  (SELECT id FROM PreachingLocations WHERE location_name_english = 'Metropolitan Tabernacle'),
  '1868-07-05',
  (SELECT id FROM Languages WHERE language_name_english = 'English'),
  'Grand Glorying',
  NULL,
  NULL,
  NULL,
  3451
);
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage_english, bible_passage_urdu, location_id, date_delivered, original_language_id, title_english, title_urdu, summary_english, summary_urdu, spurgeon_gems_number
) VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name_english = 'Charles' AND last_name_english = 'Spurgeon'),
  'Mark 16:6',
  NULL,
  (SELECT id FROM PreachingLocations WHERE location_name_english = 'Metropolitan Tabernacle'),
  '1870-09-15',
  (SELECT id FROM Languages WHERE language_name_english = 'English'),
  'Belief In The Resurrection',
  NULL,
  NULL,
  NULL,
  3452
);
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage_english, bible_passage_urdu, location_id, date_delivered, original_language_id, title_english, title_urdu, summary_english, summary_urdu, spurgeon_gems_number
) VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name_english = 'Charles' AND last_name_english = 'Spurgeon'),
  'Proverbs 27:8',
  NULL,
  (SELECT id FROM PreachingLocations WHERE location_name_english = 'Metropolitan Tabernacle'),
  '1915-04-08',
  (SELECT id FROM Languages WHERE language_name_english = 'English'),
  'The Wandering Bird',
  NULL,
  NULL,
  NULL,
  3453
);
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage_english, bible_passage_urdu, location_id, date_delivered, original_language_id, title_english, title_urdu, summary_english, summary_urdu, spurgeon_gems_number
) VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name_english = 'Charles' AND last_name_english = 'Spurgeon'),
  'Galatians 5:6',
  NULL,
  (SELECT id FROM PreachingLocations WHERE location_name_english = 'Metropolitan Tabernacle'),
  '1866-09-06',
  (SELECT id FROM Languages WHERE language_name_english = 'English'),
  'Circumcision And Uncircumcision',
  NULL,
  NULL,
  NULL,
  3454
);
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage_english, bible_passage_urdu, location_id, date_delivered, original_language_id, title_english, title_urdu, summary_english, summary_urdu, spurgeon_gems_number
) VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name_english = 'Charles' AND last_name_english = 'Spurgeon'),
  'Judges 3:20',
  NULL,
  (SELECT id FROM PreachingLocations WHERE location_name_english = 'Metropolitan Tabernacle'),
  '1915-04-22',
  (SELECT id FROM Languages WHERE language_name_english = 'English'),
  'A Message From God',
  NULL,
  NULL,
  NULL,
  3455
);
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage_english, bible_passage_urdu, location_id, date_delivered, original_language_id, title_english, title_urdu, summary_english, summary_urdu, spurgeon_gems_number
) VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name_english = 'Charles' AND last_name_english = 'Spurgeon'),
  'Luke 24:36',
  NULL,
  (SELECT id FROM PreachingLocations WHERE location_name_english = 'Metropolitan Tabernacle'),
  '1878-10-02',
  (SELECT id FROM Languages WHERE language_name_english = 'English'),
  'Peace Be Unto You',
  NULL,
  NULL,
  NULL,
  3456
);
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage_english, bible_passage_urdu, location_id, date_delivered, original_language_id, title_english, title_urdu, summary_english, summary_urdu, spurgeon_gems_number
) VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name_english = 'Charles' AND last_name_english = 'Spurgeon'),
  'Matthew 27:22-23',
  NULL,
  (SELECT id FROM PreachingLocations WHERE location_name_english = 'Metropolitan Tabernacle'),
  '1915-05-06',
  (SELECT id FROM Languages WHERE language_name_english = 'English'),
  'All Are Guilty',
  NULL,
  NULL,
  NULL,
  3457
);
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage_english, bible_passage_urdu, location_id, date_delivered, original_language_id, title_english, title_urdu, summary_english, summary_urdu, spurgeon_gems_number
) VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name_english = 'Charles' AND last_name_english = 'Spurgeon'),
  'Exodus 13:13',
  NULL,
  (SELECT id FROM PreachingLocations WHERE location_name_english = 'Metropolitan Tabernacle'),
  '1868-02-09',
  (SELECT id FROM Languages WHERE language_name_english = 'English'),
  'Redeeming The Unclean',
  NULL,
  NULL,
  NULL,
  3458
);
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage_english, bible_passage_urdu, location_id, date_delivered, original_language_id, title_english, title_urdu, summary_english, summary_urdu, spurgeon_gems_number
) VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name_english = 'Charles' AND last_name_english = 'Spurgeon'),
  'James 4:6',
  NULL,
  (SELECT id FROM PreachingLocations WHERE location_name_english = 'Metropolitan Tabernacle'),
  '1915-05-20',
  (SELECT id FROM Languages WHERE language_name_english = 'English'),
  'More And More',
  NULL,
  NULL,
  NULL,
  3459
);
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage_english, bible_passage_urdu, location_id, date_delivered, original_language_id, title_english, title_urdu, summary_english, summary_urdu, spurgeon_gems_number
) VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name_english = 'Charles' AND last_name_english = 'Spurgeon'),
  'Psalm 33:18',
  NULL,
  (SELECT id FROM PreachingLocations WHERE location_name_english = 'Metropolitan Tabernacle'),
  '1868-06-18',
  (SELECT id FROM Languages WHERE language_name_english = 'English'),
  'Praise Comely To The Upright',
  NULL,
  NULL,
  NULL,
  3460
);
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage_english, bible_passage_urdu, location_id, date_delivered, original_language_id, title_english, title_urdu, summary_english, summary_urdu, spurgeon_gems_number
) VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name_english = 'Charles' AND last_name_english = 'Spurgeon'),
  'John 11:28-32',
  NULL,
  (SELECT id FROM PreachingLocations WHERE location_name_english = 'Metropolitan Tabernacle'),
  '1915-06-03',
  (SELECT id FROM Languages WHERE language_name_english = 'English'),
  'The Welcome Visitor',
  NULL,
  NULL,
  NULL,
  3461
);
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage_english, bible_passage_urdu, location_id, date_delivered, original_language_id, title_english, title_urdu, summary_english, summary_urdu, spurgeon_gems_number
) VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name_english = 'Charles' AND last_name_english = 'Spurgeon'),
  'Isaiah 49:24',
  NULL,
  (SELECT id FROM PreachingLocations WHERE location_name_english = 'Metropolitan Tabernacle'),
  '1915-06-10',
  (SELECT id FROM Languages WHERE language_name_english = 'English'),
  'To The Rescue',
  NULL,
  NULL,
  NULL,
  3462
);
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage_english, bible_passage_urdu, location_id, date_delivered, original_language_id, title_english, title_urdu, summary_english, summary_urdu, spurgeon_gems_number
) VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name_english = 'Charles' AND last_name_english = 'Spurgeon'),
  'John 5:46',
  NULL,
  (SELECT id FROM PreachingLocations WHERE location_name_english = 'Metropolitan Tabernacle'),
  '1915-06-17',
  (SELECT id FROM Languages WHERE language_name_english = 'English'),
  'Why Men Do Not Believe',
  NULL,
  NULL,
  NULL,
  3463
);
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage_english, bible_passage_urdu, location_id, date_delivered, original_language_id, title_english, title_urdu, summary_english, summary_urdu, spurgeon_gems_number
) VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name_english = 'Charles' AND last_name_english = 'Spurgeon'),
  'Psalm 50:14-15',
  NULL,
  (SELECT id FROM PreachingLocations WHERE location_name_english = 'Metropolitan Tabernacle'),
  '1870-09-01',
  (SELECT id FROM Languages WHERE language_name_english = 'English'),
  'True Worship',
  NULL,
  NULL,
  NULL,
  3464
);
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage_english, bible_passage_urdu, location_id, date_delivered, original_language_id, title_english, title_urdu, summary_english, summary_urdu, spurgeon_gems_number
) VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name_english = 'Charles' AND last_name_english = 'Spurgeon'),
  'Isaiah 53:11',
  NULL,
  (SELECT id FROM PreachingLocations WHERE location_name_english = 'Metropolitan Tabernacle'),
  '1868-03-29',
  (SELECT id FROM Languages WHERE language_name_english = 'English'),
  'The Suffering Christ Satisfied',
  NULL,
  NULL,
  NULL,
  3465
);
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage_english, bible_passage_urdu, location_id, date_delivered, original_language_id, title_english, title_urdu, summary_english, summary_urdu, spurgeon_gems_number
) VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name_english = 'Charles' AND last_name_english = 'Spurgeon'),
  'Colossians 2:18',
  NULL,
  (SELECT id FROM PreachingLocations WHERE location_name_english = 'Metropolitan Tabernacle'),
  '1870-06-16',
  (SELECT id FROM Languages WHERE language_name_english = 'English'),
  'A Warning To Believers',
  NULL,
  NULL,
  NULL,
  3466
);
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage_english, bible_passage_urdu, location_id, date_delivered, original_language_id, title_english, title_urdu, summary_english, summary_urdu, spurgeon_gems_number
) VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name_english = 'Charles' AND last_name_english = 'Spurgeon'),
  'Revelation 21:5',
  NULL,
  (SELECT id FROM PreachingLocations WHERE location_name_english = 'Metropolitan Tabernacle'),
  '1915-07-15',
  (SELECT id FROM Languages WHERE language_name_english = 'English'),
  'A New Creation',
  NULL,
  NULL,
  NULL,
  3467
);
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage_english, bible_passage_urdu, location_id, date_delivered, original_language_id, title_english, title_urdu, summary_english, summary_urdu, spurgeon_gems_number
) VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name_english = 'Charles' AND last_name_english = 'Spurgeon'),
  'Isaiah 38:14',
  NULL,
  (SELECT id FROM PreachingLocations WHERE location_name_english = 'Metropolitan Tabernacle'),
  '1870-11-10',
  (SELECT id FROM Languages WHERE language_name_english = 'English'),
  'Consolation For Poor Petitioners',
  NULL,
  NULL,
  NULL,
  3468
);
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage_english, bible_passage_urdu, location_id, date_delivered, original_language_id, title_english, title_urdu, summary_english, summary_urdu, spurgeon_gems_number
) VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name_english = 'Charles' AND last_name_english = 'Spurgeon'),
  'Luke 10:41-42',
  NULL,
  (SELECT id FROM PreachingLocations WHERE location_name_english = 'Metropolitan Tabernacle'),
  '1915-07-29',
  (SELECT id FROM Languages WHERE language_name_english = 'English'),
  'Martha And Mary',
  NULL,
  NULL,
  NULL,
  3469
);
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage_english, bible_passage_urdu, location_id, date_delivered, original_language_id, title_english, title_urdu, summary_english, summary_urdu, spurgeon_gems_number
) VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name_english = 'Charles' AND last_name_english = 'Spurgeon'),
  'Psalm 17:7',
  NULL,
  (SELECT id FROM PreachingLocations WHERE location_name_english = 'Metropolitan Tabernacle'),
  '1915-08-05',
  (SELECT id FROM Languages WHERE language_name_english = 'English'),
  'An Earnest Entreaty',
  NULL,
  NULL,
  NULL,
  3470
);
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage_english, bible_passage_urdu, location_id, date_delivered, original_language_id, title_english, title_urdu, summary_english, summary_urdu, spurgeon_gems_number
) VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name_english = 'Charles' AND last_name_english = 'Spurgeon'),
  'Matthew 27:45',
  NULL,
  (SELECT id FROM PreachingLocations WHERE location_name_english = 'Metropolitan Tabernacle'),
  '1915-08-12',
  (SELECT id FROM Languages WHERE language_name_english = 'English'),
  'The Three Hours’ Darkness',
  NULL,
  NULL,
  NULL,
  3471
);
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage_english, bible_passage_urdu, location_id, date_delivered, original_language_id, title_english, title_urdu, summary_english, summary_urdu, spurgeon_gems_number
) VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name_english = 'Charles' AND last_name_english = 'Spurgeon'),
  'Ephesians 2:12',
  NULL,
  (SELECT id FROM PreachingLocations WHERE location_name_english = 'Metropolitan Tabernacle'),
  '1915-08-19',
  (SELECT id FROM Languages WHERE language_name_english = 'English'),
  'A Solemn Deprival',
  NULL,
  NULL,
  NULL,
  3472
);
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage_english, bible_passage_urdu, location_id, date_delivered, original_language_id, title_english, title_urdu, summary_english, summary_urdu, spurgeon_gems_number
) VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name_english = 'Charles' AND last_name_english = 'Spurgeon'),
  'Genesis 27:35',
  NULL,
  (SELECT id FROM PreachingLocations WHERE location_name_english = 'Metropolitan Tabernacle'),
  '1870-10-13',
  (SELECT id FROM Languages WHERE language_name_english = 'English'),
  'Household Sin And Sorrow',
  NULL,
  NULL,
  NULL,
  3473
);
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage_english, bible_passage_urdu, location_id, date_delivered, original_language_id, title_english, title_urdu, summary_english, summary_urdu, spurgeon_gems_number
) VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name_english = 'Charles' AND last_name_english = 'Spurgeon'),
  'Psalm 18:19',
  NULL,
  (SELECT id FROM PreachingLocations WHERE location_name_english = 'Metropolitan Tabernacle'),
  '1915-09-02',
  (SELECT id FROM Languages WHERE language_name_english = 'English'),
  'Blessings Manifold And Marvellous',
  NULL,
  NULL,
  NULL,
  3474
);
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage_english, bible_passage_urdu, location_id, date_delivered, original_language_id, title_english, title_urdu, summary_english, summary_urdu, spurgeon_gems_number
) VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name_english = 'Charles' AND last_name_english = 'Spurgeon'),
  'Romans 7:8-9',
  NULL,
  (SELECT id FROM PreachingLocations WHERE location_name_english = 'Metropolitan Tabernacle'),
  '1870-07-24',
  (SELECT id FROM Languages WHERE language_name_english = 'English'),
  'The Soul’s Great Crisis',
  NULL,
  NULL,
  NULL,
  3475
);
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage_english, bible_passage_urdu, location_id, date_delivered, original_language_id, title_english, title_urdu, summary_english, summary_urdu, spurgeon_gems_number
) VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name_english = 'Charles' AND last_name_english = 'Spurgeon'),
  'Isaiah 5:1',
  NULL,
  (SELECT id FROM PreachingLocations WHERE location_name_english = 'Metropolitan Tabernacle'),
  '1871-03-05',
  (SELECT id FROM Languages WHERE language_name_english = 'English'),
  'Holy Song From Happy Saints',
  NULL,
  NULL,
  NULL,
  3476
);
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage_english, bible_passage_urdu, location_id, date_delivered, original_language_id, title_english, title_urdu, summary_english, summary_urdu, spurgeon_gems_number
) VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name_english = 'Charles' AND last_name_english = 'Spurgeon'),
  '1 Chronicles 22:1',
  NULL,
  (SELECT id FROM PreachingLocations WHERE location_name_english = 'Metropolitan Tabernacle'),
  '1915-09-23',
  (SELECT id FROM Languages WHERE language_name_english = 'English'),
  'Araunah’s Threshing Floor',
  NULL,
  NULL,
  NULL,
  3477
);
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage_english, bible_passage_urdu, location_id, date_delivered, original_language_id, title_english, title_urdu, summary_english, summary_urdu, spurgeon_gems_number
) VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name_english = 'Charles' AND last_name_english = 'Spurgeon'),
  'Hebrews 11:15-16',
  NULL,
  (SELECT id FROM PreachingLocations WHERE location_name_english = 'Metropolitan Tabernacle'),
  '1871-07-13',
  (SELECT id FROM Languages WHERE language_name_english = 'English'),
  'Go Back? Never!',
  NULL,
  NULL,
  NULL,
  3478
);
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage_english, bible_passage_urdu, location_id, date_delivered, original_language_id, title_english, title_urdu, summary_english, summary_urdu, spurgeon_gems_number
) VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name_english = 'Charles' AND last_name_english = 'Spurgeon'),
  'Ephesians 2:8',
  NULL,
  (SELECT id FROM PreachingLocations WHERE location_name_english = 'Metropolitan Tabernacle'),
  '1915-10-07',
  (SELECT id FROM Languages WHERE language_name_english = 'English'),
  'All Of Grace',
  NULL,
  NULL,
  NULL,
  3479
);
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage_english, bible_passage_urdu, location_id, date_delivered, original_language_id, title_english, title_urdu, summary_english, summary_urdu, spurgeon_gems_number
) VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name_english = 'Charles' AND last_name_english = 'Spurgeon'),
  'Song of Solomon 1:12',
  NULL,
  (SELECT id FROM PreachingLocations WHERE location_name_english = 'Metropolitan Tabernacle'),
  '1915-10-07',
  (SELECT id FROM Languages WHERE language_name_english = 'English'),
  'Fragrant Graces',
  NULL,
  NULL,
  NULL,
  3480
);
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage_english, bible_passage_urdu, location_id, date_delivered, original_language_id, title_english, title_urdu, summary_english, summary_urdu, spurgeon_gems_number
) VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name_english = 'Charles' AND last_name_english = 'Spurgeon'),
  'John 21:7-8',
  NULL,
  (SELECT id FROM PreachingLocations WHERE location_name_english = 'Metropolitan Tabernacle'),
  '1915-10-15',
  (SELECT id FROM Languages WHERE language_name_english = 'English'),
  'Visits From The Lord',
  NULL,
  NULL,
  NULL,
  3481
);
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage_english, bible_passage_urdu, location_id, date_delivered, original_language_id, title_english, title_urdu, summary_english, summary_urdu, spurgeon_gems_number
) VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name_english = 'Charles' AND last_name_english = 'Spurgeon'),
  'Psalm 119:145-146',
  NULL,
  (SELECT id FROM PreachingLocations WHERE location_name_english = 'Metropolitan Tabernacle'),
  '1915-10-21',
  (SELECT id FROM Languages WHERE language_name_english = 'English'),
  'Struggling Against Sin',
  NULL,
  NULL,
  NULL,
  3482
);
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage_english, bible_passage_urdu, location_id, date_delivered, original_language_id, title_english, title_urdu, summary_english, summary_urdu, spurgeon_gems_number
) VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name_english = 'Charles' AND last_name_english = 'Spurgeon'),
  'Romans 8:14',
  NULL,
  (SELECT id FROM PreachingLocations WHERE location_name_english = 'Metropolitan Tabernacle'),
  '1870-09-28',
  (SELECT id FROM Languages WHERE language_name_english = 'English'),
  'The Family Likeness',
  NULL,
  NULL,
  NULL,
  3483
);
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage_english, bible_passage_urdu, location_id, date_delivered, original_language_id, title_english, title_urdu, summary_english, summary_urdu, spurgeon_gems_number
) VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name_english = 'Charles' AND last_name_english = 'Spurgeon'),
  'Daniel 9:19',
  NULL,
  (SELECT id FROM PreachingLocations WHERE location_name_english = 'Metropolitan Tabernacle'),
  '1870-09-25',
  (SELECT id FROM Languages WHERE language_name_english = 'English'),
  'Daniel: A Pattern For Pleaders',
  NULL,
  NULL,
  NULL,
  3484
);
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage_english, bible_passage_urdu, location_id, date_delivered, original_language_id, title_english, title_urdu, summary_english, summary_urdu, spurgeon_gems_number
) VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name_english = 'Charles' AND last_name_english = 'Spurgeon'),
  'Song of Solomon 3:1-4',
  NULL,
  (SELECT id FROM PreachingLocations WHERE location_name_english = 'Metropolitan Tabernacle'),
  '1915-11-11',
  (SELECT id FROM Languages WHERE language_name_english = 'English'),
  'The Disconsolate Lover',
  NULL,
  NULL,
  NULL,
  3485
);
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage_english, bible_passage_urdu, location_id, date_delivered, original_language_id, title_english, title_urdu, summary_english, summary_urdu, spurgeon_gems_number
) VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name_english = 'Charles' AND last_name_english = 'Spurgeon'),
  'Psalm 51:6',
  NULL,
  (SELECT id FROM PreachingLocations WHERE location_name_english = 'Metropolitan Tabernacle'),
  '1870-08-11',
  (SELECT id FROM Languages WHERE language_name_english = 'English'),
  'God’s Desire For Us, And His Work In Us',
  NULL,
  NULL,
  NULL,
  3486
);
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage_english, bible_passage_urdu, location_id, date_delivered, original_language_id, title_english, title_urdu, summary_english, summary_urdu, spurgeon_gems_number
) VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name_english = 'Charles' AND last_name_english = 'Spurgeon'),
  'Luke 19:6',
  NULL,
  (SELECT id FROM PreachingLocations WHERE location_name_english = 'Metropolitan Tabernacle'),
  '1915-11-25',
  (SELECT id FROM Languages WHERE language_name_english = 'English'),
  'The Honored Guest',
  NULL,
  NULL,
  NULL,
  3487
);
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage_english, bible_passage_urdu, location_id, date_delivered, original_language_id, title_english, title_urdu, summary_english, summary_urdu, spurgeon_gems_number
) VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name_english = 'Charles' AND last_name_english = 'Spurgeon'),
  'Romans 3:24-26',
  NULL,
  (SELECT id FROM PreachingLocations WHERE location_name_english = 'Metropolitan Tabernacle'),
  '1870-10-09',
  (SELECT id FROM Languages WHERE language_name_english = 'English'),
  'Justification, Propitiation, Declaration',
  NULL,
  NULL,
  NULL,
  3488
);
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage_english, bible_passage_urdu, location_id, date_delivered, original_language_id, title_english, title_urdu, summary_english, summary_urdu, spurgeon_gems_number
) VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name_english = 'Charles' AND last_name_english = 'Spurgeon'),
  'Zechariah 4:10',
  NULL,
  (SELECT id FROM PreachingLocations WHERE location_name_english = 'Metropolitan Tabernacle'),
  '1871-04-27',
  (SELECT id FROM Languages WHERE language_name_english = 'English'),
  'Encouragement For The Depressed',
  NULL,
  NULL,
  NULL,
  3489
);
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage_english, bible_passage_urdu, location_id, date_delivered, original_language_id, title_english, title_urdu, summary_english, summary_urdu, spurgeon_gems_number
) VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name_english = 'Charles' AND last_name_english = 'Spurgeon'),
  '1 Chronicles 28:9',
  NULL,
  (SELECT id FROM PreachingLocations WHERE location_name_english = 'Metropolitan Tabernacle'),
  '1871-02-26',
  (SELECT id FROM Languages WHERE language_name_english = 'English'),
  'Sincere Seekers Assured Finders',
  NULL,
  NULL,
  NULL,
  3490
);
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage_english, bible_passage_urdu, location_id, date_delivered, original_language_id, title_english, title_urdu, summary_english, summary_urdu, spurgeon_gems_number
) VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name_english = 'Charles' AND last_name_english = 'Spurgeon'),
  'Mark 10:51',
  NULL,
  (SELECT id FROM PreachingLocations WHERE location_name_english = 'Metropolitan Tabernacle'),
  '1915-12-23',
  (SELECT id FROM Languages WHERE language_name_english = 'English'),
  'The Savior’s Charity',
  NULL,
  NULL,
  NULL,
  3491
);
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage_english, bible_passage_urdu, location_id, date_delivered, original_language_id, title_english, title_urdu, summary_english, summary_urdu, spurgeon_gems_number
) VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name_english = 'Charles' AND last_name_english = 'Spurgeon'),
  'Hebrews 12:25',
  NULL,
  (SELECT id FROM PreachingLocations WHERE location_name_english = 'Metropolitan Tabernacle'),
  '1870-11-27',
  (SELECT id FROM Languages WHERE language_name_english = 'English'),
  'God’s Word Not To Be Refused',
  NULL,
  NULL,
  NULL,
  3492
);
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage_english, bible_passage_urdu, location_id, date_delivered, original_language_id, title_english, title_urdu, summary_english, summary_urdu, spurgeon_gems_number
) VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name_english = 'Charles' AND last_name_english = 'Spurgeon'),
  'Psalm 68:19-20',
  NULL,
  (SELECT id FROM PreachingLocations WHERE location_name_english = 'Metropolitan Tabernacle'),
  '1871-09-21',
  (SELECT id FROM Languages WHERE language_name_english = 'English'),
  'Daily Blessings For God’s People',
  NULL,
  NULL,
  NULL,
  3493
);
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage_english, bible_passage_urdu, location_id, date_delivered, original_language_id, title_english, title_urdu, summary_english, summary_urdu, spurgeon_gems_number
) VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name_english = 'Charles' AND last_name_english = 'Spurgeon'),
  'Ezekiel 17:24',
  NULL,
  (SELECT id FROM PreachingLocations WHERE location_name_english = 'Metropolitan Tabernacle'),
  '1916-01-13',
  (SELECT id FROM Languages WHERE language_name_english = 'English'),
  'Divine Destruction And Protection',
  NULL,
  NULL,
  NULL,
  3494
);
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage_english, bible_passage_urdu, location_id, date_delivered, original_language_id, title_english, title_urdu, summary_english, summary_urdu, spurgeon_gems_number
) VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name_english = 'Charles' AND last_name_english = 'Spurgeon'),
  'Luke 1:20',
  NULL,
  (SELECT id FROM PreachingLocations WHERE location_name_english = 'Metropolitan Tabernacle'),
  '1916-01-20',
  (SELECT id FROM Languages WHERE language_name_english = 'English'),
  'The Judgement Upon Zacharias',
  NULL,
  NULL,
  NULL,
  3495
);
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage_english, bible_passage_urdu, location_id, date_delivered, original_language_id, title_english, title_urdu, summary_english, summary_urdu, spurgeon_gems_number
) VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name_english = 'Charles' AND last_name_english = 'Spurgeon'),
  'Ephesians 2:13',
  NULL,
  (SELECT id FROM PreachingLocations WHERE location_name_english = 'Metropolitan Tabernacle'),
  '1871-09-03',
  (SELECT id FROM Languages WHERE language_name_english = 'English'),
  'Our Glorious Transforming',
  NULL,
  NULL,
  NULL,
  3496
);
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage_english, bible_passage_urdu, location_id, date_delivered, original_language_id, title_english, title_urdu, summary_english, summary_urdu, spurgeon_gems_number
) VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name_english = 'Charles' AND last_name_english = 'Spurgeon'),
  '2 Corinthians 5:20',
  NULL,
  (SELECT id FROM PreachingLocations WHERE location_name_english = 'Metropolitan Tabernacle'),
  '1871-02-26',
  (SELECT id FROM Languages WHERE language_name_english = 'English'),
  'A Solemn Embassy',
  NULL,
  NULL,
  NULL,
  3497
);
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage_english, bible_passage_urdu, location_id, date_delivered, original_language_id, title_english, title_urdu, summary_english, summary_urdu, spurgeon_gems_number
) VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name_english = 'Charles' AND last_name_english = 'Spurgeon'),
  '1 Kings 19:11-13',
  NULL,
  (SELECT id FROM PreachingLocations WHERE location_name_english = 'Metropolitan Tabernacle'),
  '1871-09-10',
  (SELECT id FROM Languages WHERE language_name_english = 'English'),
  'God’s Gentle Power',
  NULL,
  NULL,
  NULL,
  3498
);
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage_english, bible_passage_urdu, location_id, date_delivered, original_language_id, title_english, title_urdu, summary_english, summary_urdu, spurgeon_gems_number
) VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name_english = 'Charles' AND last_name_english = 'Spurgeon'),
  'Revelation 7:16',
  NULL,
  (SELECT id FROM PreachingLocations WHERE location_name_english = 'Metropolitan Tabernacle'),
  '1871-08-13',
  (SELECT id FROM Languages WHERE language_name_english = 'English'),
  'The Bliss Of The Glorified',
  NULL,
  NULL,
  NULL,
  3499
);
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage_english, bible_passage_urdu, location_id, date_delivered, original_language_id, title_english, title_urdu, summary_english, summary_urdu, spurgeon_gems_number
) VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name_english = 'Charles' AND last_name_english = 'Spurgeon'),
  'Proverbs 28:13; Psalm 85:2',
  NULL,
  (SELECT id FROM PreachingLocations WHERE location_name_english = 'Metropolitan Tabernacle'),
  '1916-02-24',
  (SELECT id FROM Languages WHERE language_name_english = 'English'),
  'Two Coverings And Two Consequences',
  NULL,
  NULL,
  NULL,
  3500
);
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage_english, bible_passage_urdu, location_id, date_delivered, original_language_id, title_english, title_urdu, summary_english, summary_urdu, spurgeon_gems_number
) VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name_english = 'Charles' AND last_name_english = 'Spurgeon'),
  '1 Corinthians 11:26',
  NULL,
  (SELECT id FROM PreachingLocations WHERE location_name_english = 'Metropolitan Tabernacle'),
  '1871-09-06',
  (SELECT id FROM Languages WHERE language_name_english = 'English'),
  'The Feast Of The Lord',
  NULL,
  NULL,
  NULL,
  3501
);
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage_english, bible_passage_urdu, location_id, date_delivered, original_language_id, title_english, title_urdu, summary_english, summary_urdu, spurgeon_gems_number
) VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name_english = 'Charles' AND last_name_english = 'Spurgeon'),
  'Matthew 11:27-28',
  NULL,
  (SELECT id FROM PreachingLocations WHERE location_name_english = 'Metropolitan Tabernacle'),
  '1916-03-09',
  (SELECT id FROM Languages WHERE language_name_english = 'English'),
  'Powerful Persuasives',
  NULL,
  NULL,
  NULL,
  3502
);
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage_english, bible_passage_urdu, location_id, date_delivered, original_language_id, title_english, title_urdu, summary_english, summary_urdu, spurgeon_gems_number
) VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name_english = 'Charles' AND last_name_english = 'Spurgeon'),
  'Psalm 9:14',
  NULL,
  (SELECT id FROM PreachingLocations WHERE location_name_english = 'Metropolitan Tabernacle'),
  '1871-07-30',
  (SELECT id FROM Languages WHERE language_name_english = 'English'),
  'Joy In Salvation',
  NULL,
  NULL,
  NULL,
  3503
);
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage_english, bible_passage_urdu, location_id, date_delivered, original_language_id, title_english, title_urdu, summary_english, summary_urdu, spurgeon_gems_number
) VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name_english = 'Charles' AND last_name_english = 'Spurgeon'),
  '2 Samuel 15:21',
  NULL,
  (SELECT id FROM PreachingLocations WHERE location_name_english = 'Metropolitan Tabernacle'),
  '1889-09-22',
  (SELECT id FROM Languages WHERE language_name_english = 'English'),
  'Following Christ',
  NULL,
  NULL,
  NULL,
  3504
);
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage_english, bible_passage_urdu, location_id, date_delivered, original_language_id, title_english, title_urdu, summary_english, summary_urdu, spurgeon_gems_number
) VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name_english = 'Charles' AND last_name_english = 'Spurgeon'),
  '2 Chronicles 33:9-13',
  NULL,
  (SELECT id FROM PreachingLocations WHERE location_name_english = 'Metropolitan Tabernacle'),
  '1916-03-30',
  (SELECT id FROM Languages WHERE language_name_english = 'English'),
  'A Miracle Of Grace',
  NULL,
  NULL,
  NULL,
  3505
);
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage_english, bible_passage_urdu, location_id, date_delivered, original_language_id, title_english, title_urdu, summary_english, summary_urdu, spurgeon_gems_number
) VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name_english = 'Charles' AND last_name_english = 'Spurgeon'),
  'Ezekiel 36:31',
  NULL,
  (SELECT id FROM PreachingLocations WHERE location_name_english = 'Metropolitan Tabernacle'),
  '1870-12-18',
  (SELECT id FROM Languages WHERE language_name_english = 'English'),
  'What Self Deserves',
  NULL,
  NULL,
  NULL,
  3506
);
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage_english, bible_passage_urdu, location_id, date_delivered, original_language_id, title_english, title_urdu, summary_english, summary_urdu, spurgeon_gems_number
) VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name_english = 'Charles' AND last_name_english = 'Spurgeon'),
  'Matthew 27:46',
  NULL,
  (SELECT id FROM PreachingLocations WHERE location_name_english = 'Metropolitan Tabernacle'),
  '1872-04-07',
  (SELECT id FROM Languages WHERE language_name_english = 'English'),
  'Our Lord’s Solemn Inquiry',
  NULL,
  NULL,
  NULL,
  3507
);
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage_english, bible_passage_urdu, location_id, date_delivered, original_language_id, title_english, title_urdu, summary_english, summary_urdu, spurgeon_gems_number
) VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name_english = 'Charles' AND last_name_english = 'Spurgeon'),
  'Zechariah 14:6-7',
  NULL,
  (SELECT id FROM PreachingLocations WHERE location_name_english = 'Metropolitan Tabernacle'),
  '1916-04-20',
  (SELECT id FROM Languages WHERE language_name_english = 'English'),
  'Light At Evening Time',
  NULL,
  NULL,
  NULL,
  3508
);
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage_english, bible_passage_urdu, location_id, date_delivered, original_language_id, title_english, title_urdu, summary_english, summary_urdu, spurgeon_gems_number
) VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name_english = 'Charles' AND last_name_english = 'Spurgeon'),
  '1 Peter 2:4',
  NULL,
  (SELECT id FROM PreachingLocations WHERE location_name_english = 'Metropolitan Tabernacle'),
  '1868-06-27',
  (SELECT id FROM Languages WHERE language_name_english = 'English'),
  'Coming To Christ',
  NULL,
  NULL,
  NULL,
  3509
);
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage_english, bible_passage_urdu, location_id, date_delivered, original_language_id, title_english, title_urdu, summary_english, summary_urdu, spurgeon_gems_number
) VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name_english = 'Charles' AND last_name_english = 'Spurgeon'),
  'Jonah 2:7',
  NULL,
  (SELECT id FROM PreachingLocations WHERE location_name_english = 'Metropolitan Tabernacle'),
  '1916-05-04',
  (SELECT id FROM Languages WHERE language_name_english = 'English'),
  'The Fainting Soul Revived',
  NULL,
  NULL,
  NULL,
  3510
);
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage_english, bible_passage_urdu, location_id, date_delivered, original_language_id, title_english, title_urdu, summary_english, summary_urdu, spurgeon_gems_number
) VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name_english = 'Charles' AND last_name_english = 'Spurgeon'),
  '1 Corinthians 9:7',
  NULL,
  (SELECT id FROM PreachingLocations WHERE location_name_english = 'Metropolitan Tabernacle'),
  '1916-05-11',
  (SELECT id FROM Languages WHERE language_name_english = 'English'),
  'The Battle Of Life',
  NULL,
  NULL,
  NULL,
  3511
);
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage_english, bible_passage_urdu, location_id, date_delivered, original_language_id, title_english, title_urdu, summary_english, summary_urdu, spurgeon_gems_number
) VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name_english = 'Charles' AND last_name_english = 'Spurgeon'),
  'Psalm 14:6',
  NULL,
  (SELECT id FROM PreachingLocations WHERE location_name_english = 'Metropolitan Tabernacle'),
  '1871-09-17',
  (SELECT id FROM Languages WHERE language_name_english = 'English'),
  'Are You Mocked?',
  NULL,
  NULL,
  NULL,
  3512
);
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage_english, bible_passage_urdu, location_id, date_delivered, original_language_id, title_english, title_urdu, summary_english, summary_urdu, spurgeon_gems_number
) VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name_english = 'Charles' AND last_name_english = 'Spurgeon'),
  'Titus 2:14',
  NULL,
  (SELECT id FROM PreachingLocations WHERE location_name_english = 'Metropolitan Tabernacle'),
  '1866-11-25',
  (SELECT id FROM Languages WHERE language_name_english = 'English'),
  'Christ’s Marvelous Giving',
  NULL,
  NULL,
  NULL,
  3513
);
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage_english, bible_passage_urdu, location_id, date_delivered, original_language_id, title_english, title_urdu, summary_english, summary_urdu, spurgeon_gems_number
) VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name_english = 'Charles' AND last_name_english = 'Spurgeon'),
  'Isaiah 51:3',
  NULL,
  (SELECT id FROM PreachingLocations WHERE location_name_english = 'Metropolitan Tabernacle'),
  '1916-06-01',
  (SELECT id FROM Languages WHERE language_name_english = 'English'),
  'A Prospect Of Revival',
  NULL,
  NULL,
  NULL,
  3514
);
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage_english, bible_passage_urdu, location_id, date_delivered, original_language_id, title_english, title_urdu, summary_english, summary_urdu, spurgeon_gems_number
) VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name_english = 'Charles' AND last_name_english = 'Spurgeon'),
  'Isaiah 19:18-25',
  NULL,
  (SELECT id FROM PreachingLocations WHERE location_name_english = 'Metropolitan Tabernacle'),
  '1872-01-21',
  (SELECT id FROM Languages WHERE language_name_english = 'English'),
  'The Fruits Of Grace',
  NULL,
  NULL,
  NULL,
  3515
);
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage_english, bible_passage_urdu, location_id, date_delivered, original_language_id, title_english, title_urdu, summary_english, summary_urdu, spurgeon_gems_number
) VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name_english = 'Charles' AND last_name_english = 'Spurgeon'),
  'Song of Solomon 8:6',
  NULL,
  (SELECT id FROM PreachingLocations WHERE location_name_english = 'Metropolitan Tabernacle'),
  '1916-06-15',
  (SELECT id FROM Languages WHERE language_name_english = 'English'),
  'Love And Jealousy',
  NULL,
  NULL,
  NULL,
  3516
);
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage_english, bible_passage_urdu, location_id, date_delivered, original_language_id, title_english, title_urdu, summary_english, summary_urdu, spurgeon_gems_number
) VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name_english = 'Charles' AND last_name_english = 'Spurgeon'),
  'Romans 12:15',
  NULL,
  (SELECT id FROM PreachingLocations WHERE location_name_english = 'Metropolitan Tabernacle'),
  '1872-01-07',
  (SELECT id FROM Languages WHERE language_name_english = 'English'),
  'Sympathy And Song',
  NULL,
  NULL,
  NULL,
  3517
);
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage_english, bible_passage_urdu, location_id, date_delivered, original_language_id, title_english, title_urdu, summary_english, summary_urdu, spurgeon_gems_number
) VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name_english = 'Charles' AND last_name_english = 'Spurgeon'),
  'Acts 19:19-20',
  NULL,
  (SELECT id FROM PreachingLocations WHERE location_name_english = 'Metropolitan Tabernacle'),
  '1872-02-11',
  (SELECT id FROM Languages WHERE language_name_english = 'English'),
  'The Powerful Truth Of God',
  NULL,
  NULL,
  NULL,
  3518
);
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage_english, bible_passage_urdu, location_id, date_delivered, original_language_id, title_english, title_urdu, summary_english, summary_urdu, spurgeon_gems_number
) VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name_english = 'Charles' AND last_name_english = 'Spurgeon'),
  'Ezekiel 36:27',
  NULL,
  (SELECT id FROM PreachingLocations WHERE location_name_english = 'Metropolitan Tabernacle'),
  '1916-07-06',
  (SELECT id FROM Languages WHERE language_name_english = 'English'),
  'A Gospel Promise',
  NULL,
  NULL,
  NULL,
  3519
);
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage_english, bible_passage_urdu, location_id, date_delivered, original_language_id, title_english, title_urdu, summary_english, summary_urdu, spurgeon_gems_number
) VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name_english = 'Charles' AND last_name_english = 'Spurgeon'),
  'Luke 13:33',
  NULL,
  (SELECT id FROM PreachingLocations WHERE location_name_english = 'Metropolitan Tabernacle'),
  '1916-07-13',
  (SELECT id FROM Languages WHERE language_name_english = 'English'),
  'Jerusalem The Guilty',
  NULL,
  NULL,
  NULL,
  3520
);
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage_english, bible_passage_urdu, location_id, date_delivered, original_language_id, title_english, title_urdu, summary_english, summary_urdu, spurgeon_gems_number
) VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name_english = 'Charles' AND last_name_english = 'Spurgeon'),
  'Titus 1:15',
  NULL,
  (SELECT id FROM PreachingLocations WHERE location_name_english = 'Metropolitan Tabernacle'),
  '1872-01-18',
  (SELECT id FROM Languages WHERE language_name_english = 'English'),
  'A Searching Test',
  NULL,
  NULL,
  NULL,
  3521
);
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage_english, bible_passage_urdu, location_id, date_delivered, original_language_id, title_english, title_urdu, summary_english, summary_urdu, spurgeon_gems_number
) VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name_english = 'Charles' AND last_name_english = 'Spurgeon'),
  'Isaiah 8:14',
  NULL,
  (SELECT id FROM PreachingLocations WHERE location_name_english = 'Metropolitan Tabernacle'),
  '1916-07-27',
  (SELECT id FROM Languages WHERE language_name_english = 'English'),
  'Christ A Sanctuary',
  NULL,
  NULL,
  NULL,
  3522
);
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage_english, bible_passage_urdu, location_id, date_delivered, original_language_id, title_english, title_urdu, summary_english, summary_urdu, spurgeon_gems_number
) VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name_english = 'Charles' AND last_name_english = 'Spurgeon'),
  'Genesis 22:8',
  NULL,
  (SELECT id FROM PreachingLocations WHERE location_name_english = 'Metropolitan Tabernacle'),
  '1916-08-03',
  (SELECT id FROM Languages WHERE language_name_english = 'English'),
  'A Type And Its Teaching',
  NULL,
  NULL,
  NULL,
  3523
);
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage_english, bible_passage_urdu, location_id, date_delivered, original_language_id, title_english, title_urdu, summary_english, summary_urdu, spurgeon_gems_number
) VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name_english = 'Charles' AND last_name_english = 'Spurgeon'),
  'John 21:17',
  NULL,
  (SELECT id FROM PreachingLocations WHERE location_name_english = 'Metropolitan Tabernacle'),
  '1916-08-10',
  (SELECT id FROM Languages WHERE language_name_english = 'English'),
  'Do I Love The Lord Or No?',
  NULL,
  NULL,
  NULL,
  3524
);
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage_english, bible_passage_urdu, location_id, date_delivered, original_language_id, title_english, title_urdu, summary_english, summary_urdu, spurgeon_gems_number
) VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name_english = 'Charles' AND last_name_english = 'Spurgeon'),
  'Genesis 16:8; Genesis 16:13',
  NULL,
  (SELECT id FROM PreachingLocations WHERE location_name_english = 'Metropolitan Tabernacle'),
  '1871-02-22',
  (SELECT id FROM Languages WHERE language_name_english = 'English'),
  'God’s Overtaking Mercy',
  NULL,
  NULL,
  NULL,
  3525
);
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage_english, bible_passage_urdu, location_id, date_delivered, original_language_id, title_english, title_urdu, summary_english, summary_urdu, spurgeon_gems_number
) VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name_english = 'Charles' AND last_name_english = 'Spurgeon'),
  'Matthew 26:2',
  NULL,
  (SELECT id FROM PreachingLocations WHERE location_name_english = 'Metropolitan Tabernacle'),
  '1916-08-24',
  (SELECT id FROM Languages WHERE language_name_english = 'English'),
  'The New Wine Of The Kingdom',
  NULL,
  NULL,
  NULL,
  3526
);
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage_english, bible_passage_urdu, location_id, date_delivered, original_language_id, title_english, title_urdu, summary_english, summary_urdu, spurgeon_gems_number
) VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name_english = 'Charles' AND last_name_english = 'Spurgeon'),
  'Hosea 10:2',
  NULL,
  (SELECT id FROM PreachingLocations WHERE location_name_english = 'Metropolitan Tabernacle'),
  '1872-04-14',
  (SELECT id FROM Languages WHERE language_name_english = 'English'),
  'The Divided Heart',
  NULL,
  NULL,
  NULL,
  3527
);
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage_english, bible_passage_urdu, location_id, date_delivered, original_language_id, title_english, title_urdu, summary_english, summary_urdu, spurgeon_gems_number
) VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name_english = 'Charles' AND last_name_english = 'Spurgeon'),
  'Ezekiel 34:15',
  NULL,
  (SELECT id FROM PreachingLocations WHERE location_name_english = 'Metropolitan Tabernacle'),
  '1916-09-07',
  (SELECT id FROM Languages WHERE language_name_english = 'English'),
  'A Promise And A Providence',
  NULL,
  NULL,
  NULL,
  3528
);
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage_english, bible_passage_urdu, location_id, date_delivered, original_language_id, title_english, title_urdu, summary_english, summary_urdu, spurgeon_gems_number
) VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name_english = 'Charles' AND last_name_english = 'Spurgeon'),
  'Luke 14:22',
  NULL,
  (SELECT id FROM PreachingLocations WHERE location_name_english = 'Metropolitan Tabernacle'),
  '1916-09-14',
  (SELECT id FROM Languages WHERE language_name_english = 'English'),
  'More Room For More People',
  NULL,
  NULL,
  NULL,
  3529
);
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage_english, bible_passage_urdu, location_id, date_delivered, original_language_id, title_english, title_urdu, summary_english, summary_urdu, spurgeon_gems_number
) VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name_english = 'Charles' AND last_name_english = 'Spurgeon'),
  'Isaiah 53:3',
  NULL,
  (SELECT id FROM PreachingLocations WHERE location_name_english = 'Metropolitan Tabernacle'),
  '1916-09-21',
  (SELECT id FROM Languages WHERE language_name_english = 'English'),
  'A Sad Confession',
  NULL,
  NULL,
  NULL,
  3530
);
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage_english, bible_passage_urdu, location_id, date_delivered, original_language_id, title_english, title_urdu, summary_english, summary_urdu, spurgeon_gems_number
) VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name_english = 'Charles' AND last_name_english = 'Spurgeon'),
  '2 Timothy 1:18',
  NULL,
  (SELECT id FROM PreachingLocations WHERE location_name_english = 'Metropolitan Tabernacle'),
  '1872-02-18',
  (SELECT id FROM Languages WHERE language_name_english = 'English'),
  '“The Day” And Its Disclosures',
  NULL,
  NULL,
  NULL,
  3531
);
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage_english, bible_passage_urdu, location_id, date_delivered, original_language_id, title_english, title_urdu, summary_english, summary_urdu, spurgeon_gems_number
) VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name_english = 'Charles' AND last_name_english = 'Spurgeon'),
  'Matthew 20:28',
  NULL,
  (SELECT id FROM PreachingLocations WHERE location_name_english = 'Metropolitan Tabernacle'),
  '1916-10-05',
  (SELECT id FROM Languages WHERE language_name_english = 'English'),
  'Christ’s Great Mission',
  NULL,
  NULL,
  NULL,
  3532
);
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage_english, bible_passage_urdu, location_id, date_delivered, original_language_id, title_english, title_urdu, summary_english, summary_urdu, spurgeon_gems_number
) VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name_english = 'Charles' AND last_name_english = 'Spurgeon'),
  '1 Samuel 22:1-2',
  NULL,
  (SELECT id FROM PreachingLocations WHERE location_name_english = 'Metropolitan Tabernacle'),
  '1916-10-12',
  (SELECT id FROM Languages WHERE language_name_english = 'English'),
  'Recruits For The King',
  NULL,
  NULL,
  NULL,
  3533
);
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage_english, bible_passage_urdu, location_id, date_delivered, original_language_id, title_english, title_urdu, summary_english, summary_urdu, spurgeon_gems_number
) VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name_english = 'Charles' AND last_name_english = 'Spurgeon'),
  'John 8:12',
  NULL,
  (SELECT id FROM PreachingLocations WHERE location_name_english = 'Metropolitan Tabernacle'),
  '1916-10-19',
  (SELECT id FROM Languages WHERE language_name_english = 'English'),
  'The Light Of The World',
  NULL,
  NULL,
  NULL,
  3534
);
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage_english, bible_passage_urdu, location_id, date_delivered, original_language_id, title_english, title_urdu, summary_english, summary_urdu, spurgeon_gems_number
) VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name_english = 'Charles' AND last_name_english = 'Spurgeon'),
  'Psalm 28:1',
  NULL,
  (SELECT id FROM PreachingLocations WHERE location_name_english = 'Metropolitan Tabernacle'),
  '1869-08-08',
  (SELECT id FROM Languages WHERE language_name_english = 'English'),
  'Safe, Though Sin-Surrounded',
  NULL,
  NULL,
  NULL,
  3535
);
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage_english, bible_passage_urdu, location_id, date_delivered, original_language_id, title_english, title_urdu, summary_english, summary_urdu, spurgeon_gems_number
) VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name_english = 'Charles' AND last_name_english = 'Spurgeon'),
  'Luke 10:42; John 9:25; Philippians 3:13',
  NULL,
  (SELECT id FROM PreachingLocations WHERE location_name_english = 'Metropolitan Tabernacle'),
  '1916-11-02',
  (SELECT id FROM Languages WHERE language_name_english = 'English'),
  'A Threefold Motto',
  NULL,
  NULL,
  NULL,
  3536
);
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage_english, bible_passage_urdu, location_id, date_delivered, original_language_id, title_english, title_urdu, summary_english, summary_urdu, spurgeon_gems_number
) VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name_english = 'Charles' AND last_name_english = 'Spurgeon'),
  'Mark 10:51',
  NULL,
  (SELECT id FROM PreachingLocations WHERE location_name_english = 'Metropolitan Tabernacle'),
  '1916-11-09',
  (SELECT id FROM Languages WHERE language_name_english = 'English'),
  'A Definite Challenge For Definite Prayer',
  NULL,
  NULL,
  NULL,
  3537
);
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage_english, bible_passage_urdu, location_id, date_delivered, original_language_id, title_english, title_urdu, summary_english, summary_urdu, spurgeon_gems_number
) VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name_english = 'Charles' AND last_name_english = 'Spurgeon'),
  '2 Corinthians 5:5',
  NULL,
  (SELECT id FROM PreachingLocations WHERE location_name_english = 'Metropolitan Tabernacle'),
  '1916-11-16',
  (SELECT id FROM Languages WHERE language_name_english = 'English'),
  'Preparation For Heaven',
  NULL,
  NULL,
  NULL,
  3538
);
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage_english, bible_passage_urdu, location_id, date_delivered, original_language_id, title_english, title_urdu, summary_english, summary_urdu, spurgeon_gems_number
) VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name_english = 'Charles' AND last_name_english = 'Spurgeon'),
  'Psalm 106:4',
  NULL,
  (SELECT id FROM PreachingLocations WHERE location_name_english = 'Metropolitan Tabernacle'),
  '1871-09-24',
  (SELECT id FROM Languages WHERE language_name_english = 'English'),
  'Fine Pleasing',
  NULL,
  NULL,
  NULL,
  3539
);
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage_english, bible_passage_urdu, location_id, date_delivered, original_language_id, title_english, title_urdu, summary_english, summary_urdu, spurgeon_gems_number
) VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name_english = 'Charles' AND last_name_english = 'Spurgeon'),
  'Deuteronomy 33:16',
  NULL,
  (SELECT id FROM PreachingLocations WHERE location_name_english = 'Metropolitan Tabernacle'),
  '1872-04-21',
  (SELECT id FROM Languages WHERE language_name_english = 'English'),
  'A Remarkable Benediction',
  NULL,
  NULL,
  NULL,
  3540
);
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage_english, bible_passage_urdu, location_id, date_delivered, original_language_id, title_english, title_urdu, summary_english, summary_urdu, spurgeon_gems_number
) VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name_english = 'Charles' AND last_name_english = 'Spurgeon'),
  'John 20:27–28',
  NULL,
  (SELECT id FROM PreachingLocations WHERE location_name_english = 'Metropolitan Tabernacle'),
  '1916-12-07',
  (SELECT id FROM Languages WHERE language_name_english = 'English'),
  'A Memorable Interview',
  NULL,
  NULL,
  NULL,
  3541
);
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage_english, bible_passage_urdu, location_id, date_delivered, original_language_id, title_english, title_urdu, summary_english, summary_urdu, spurgeon_gems_number
) VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name_english = 'Charles' AND last_name_english = 'Spurgeon'),
  'Isaiah 33:17',
  NULL,
  (SELECT id FROM PreachingLocations WHERE location_name_english = 'Metropolitan Tabernacle'),
  '1916-12-14',
  (SELECT id FROM Languages WHERE language_name_english = 'English'),
  'A Precious Promise For A Pure People',
  NULL,
  NULL,
  NULL,
  3542
);
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage_english, bible_passage_urdu, location_id, date_delivered, original_language_id, title_english, title_urdu, summary_english, summary_urdu, spurgeon_gems_number
) VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name_english = 'Charles' AND last_name_english = 'Spurgeon'),
  'Job 36:2',
  NULL,
  (SELECT id FROM PreachingLocations WHERE location_name_english = 'Metropolitan Tabernacle'),
  '1916-12-21',
  (SELECT id FROM Languages WHERE language_name_english = 'English'),
  'Speaking On God’s Behalf',
  NULL,
  NULL,
  NULL,
  3543
);
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage_english, bible_passage_urdu, location_id, date_delivered, original_language_id, title_english, title_urdu, summary_english, summary_urdu, spurgeon_gems_number
) VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name_english = 'Charles' AND last_name_english = 'Spurgeon'),
  'John 14:6',
  NULL,
  (SELECT id FROM PreachingLocations WHERE location_name_english = 'Metropolitan Tabernacle'),
  '1872-03-31',
  (SELECT id FROM Languages WHERE language_name_english = 'English'),
  'The Only Road',
  NULL,
  NULL,
  NULL,
  3544
);
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage_english, bible_passage_urdu, location_id, date_delivered, original_language_id, title_english, title_urdu, summary_english, summary_urdu, spurgeon_gems_number
) VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name_english = 'Charles' AND last_name_english = 'Spurgeon'),
  'Luke 19:28',
  NULL,
  (SELECT id FROM PreachingLocations WHERE location_name_english = 'Metropolitan Tabernacle'),
  '1872-01-04',
  (SELECT id FROM Languages WHERE language_name_english = 'English'),
  'Our Glorious Leader',
  NULL,
  NULL,
  NULL,
  3545
);
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage_english, bible_passage_urdu, location_id, date_delivered, original_language_id, title_english, title_urdu, summary_english, summary_urdu, spurgeon_gems_number
) VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name_english = 'Charles' AND last_name_english = 'Spurgeon'),
  'Psalm 35:3',
  NULL,
  (SELECT id FROM PreachingLocations WHERE location_name_english = 'Metropolitan Tabernacle'),
  '1917-01-11',
  (SELECT id FROM Languages WHERE language_name_english = 'English'),
  'Assurance Sought',
  NULL,
  NULL,
  NULL,
  3546
);
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage_english, bible_passage_urdu, location_id, date_delivered, original_language_id, title_english, title_urdu, summary_english, summary_urdu, spurgeon_gems_number
) VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name_english = 'Charles' AND last_name_english = 'Spurgeon'),
  'Acts 13:38-39',
  NULL,
  (SELECT id FROM PreachingLocations WHERE location_name_english = 'Metropolitan Tabernacle'),
  '1917-01-18',
  (SELECT id FROM Languages WHERE language_name_english = 'English'),
  'Simple Fact And Simple Faith',
  NULL,
  NULL,
  NULL,
  3547
);
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage_english, bible_passage_urdu, location_id, date_delivered, original_language_id, title_english, title_urdu, summary_english, summary_urdu, spurgeon_gems_number
) VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name_english = 'Charles' AND last_name_english = 'Spurgeon'),
  'Psalm 77:1,20',
  NULL,
  (SELECT id FROM PreachingLocations WHERE location_name_english = 'Metropolitan Tabernacle'),
  '1872-01-11',
  (SELECT id FROM Languages WHERE language_name_english = 'English'),
  'The Saint’s Trials And The Divine Deliverances',
  NULL,
  NULL,
  NULL,
  3548
);
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage_english, bible_passage_urdu, location_id, date_delivered, original_language_id, title_english, title_urdu, summary_english, summary_urdu, spurgeon_gems_number
) VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name_english = 'Charles' AND last_name_english = 'Spurgeon'),
  'Luke 12:32',
  NULL,
  (SELECT id FROM PreachingLocations WHERE location_name_english = 'Metropolitan Tabernacle'),
  '1917-02-01',
  (SELECT id FROM Languages WHERE language_name_english = 'English'),
  'Little, But Lovely',
  NULL,
  NULL,
  NULL,
  3549
);
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage_english, bible_passage_urdu, location_id, date_delivered, original_language_id, title_english, title_urdu, summary_english, summary_urdu, spurgeon_gems_number
) VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name_english = 'Charles' AND last_name_english = 'Spurgeon'),
  'Psalm 2:12',
  NULL,
  (SELECT id FROM PreachingLocations WHERE location_name_english = 'Metropolitan Tabernacle'),
  '1917-02-08',
  (SELECT id FROM Languages WHERE language_name_english = 'English'),
  'An Earnest Entreaty',
  NULL,
  NULL,
  NULL,
  3550
);
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage_english, bible_passage_urdu, location_id, date_delivered, original_language_id, title_english, title_urdu, summary_english, summary_urdu, spurgeon_gems_number
) VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name_english = 'Charles' AND last_name_english = 'Spurgeon'),
  '1 Thessalonians 1:5-10',
  NULL,
  (SELECT id FROM PreachingLocations WHERE location_name_english = 'Metropolitan Tabernacle'),
  '1872-04-28',
  (SELECT id FROM Languages WHERE language_name_english = 'English'),
  'The Gospel In Power',
  NULL,
  NULL,
  NULL,
  3551
);
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage_english, bible_passage_urdu, location_id, date_delivered, original_language_id, title_english, title_urdu, summary_english, summary_urdu, spurgeon_gems_number
) VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name_english = 'Charles' AND last_name_english = 'Spurgeon'),
  'Song of Solomon 5:6',
  NULL,
  (SELECT id FROM PreachingLocations WHERE location_name_english = 'Metropolitan Tabernacle'),
  '1917-02-22',
  (SELECT id FROM Languages WHERE language_name_english = 'English'),
  'The Soul’s Desertion',
  NULL,
  NULL,
  NULL,
  3552
);
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage_english, bible_passage_urdu, location_id, date_delivered, original_language_id, title_english, title_urdu, summary_english, summary_urdu, spurgeon_gems_number
) VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name_english = 'Charles' AND last_name_english = 'Spurgeon'),
  'John 1:16',
  NULL,
  (SELECT id FROM PreachingLocations WHERE location_name_english = 'Metropolitan Tabernacle'),
  '1917-03-01',
  (SELECT id FROM Languages WHERE language_name_english = 'English'),
  'The Fullness And The Filling',
  NULL,
  NULL,
  NULL,
  3553
);
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage_english, bible_passage_urdu, location_id, date_delivered, original_language_id, title_english, title_urdu, summary_english, summary_urdu, spurgeon_gems_number
) VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name_english = 'Charles' AND last_name_english = 'Spurgeon'),
  'Isaiah 53:11',
  NULL,
  (SELECT id FROM PreachingLocations WHERE location_name_english = 'Metropolitan Tabernacle'),
  '1872-01-28',
  (SELECT id FROM Languages WHERE language_name_english = 'English'),
  'Our Magnificent Savior',
  NULL,
  NULL,
  NULL,
  3554
);
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage_english, bible_passage_urdu, location_id, date_delivered, original_language_id, title_english, title_urdu, summary_english, summary_urdu, spurgeon_gems_number
) VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name_english = 'Charles' AND last_name_english = 'Spurgeon'),
  'Revelation 1:13',
  NULL,
  (SELECT id FROM PreachingLocations WHERE location_name_english = 'Metropolitan Tabernacle'),
  '1917-03-15',
  (SELECT id FROM Languages WHERE language_name_english = 'English'),
  'With Golden Girdle Girt',
  NULL,
  NULL,
  NULL,
  3555
);
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage_english, bible_passage_urdu, location_id, date_delivered, original_language_id, title_english, title_urdu, summary_english, summary_urdu, spurgeon_gems_number
) VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name_english = 'Charles' AND last_name_english = 'Spurgeon'),
  'John 6:67',
  NULL,
  (SELECT id FROM PreachingLocations WHERE location_name_english = 'Metropolitan Tabernacle'),
  '1917-03-22',
  (SELECT id FROM Languages WHERE language_name_english = 'English'),
  'Absconding And Apostasy',
  NULL,
  NULL,
  NULL,
  3556
);
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage_english, bible_passage_urdu, location_id, date_delivered, original_language_id, title_english, title_urdu, summary_english, summary_urdu, spurgeon_gems_number
) VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name_english = 'Charles' AND last_name_english = 'Spurgeon'),
  'Hosea 10:12',
  NULL,
  (SELECT id FROM PreachingLocations WHERE location_name_english = 'Metropolitan Tabernacle'),
  '1870-07-31',
  (SELECT id FROM Languages WHERE language_name_english = 'English'),
  'An Urgent Necessity',
  NULL,
  NULL,
  NULL,
  3557
);
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage_english, bible_passage_urdu, location_id, date_delivered, original_language_id, title_english, title_urdu, summary_english, summary_urdu, spurgeon_gems_number
) VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name_english = 'Charles' AND last_name_english = 'Spurgeon'),
  'Luke 23:34',
  NULL,
  (SELECT id FROM PreachingLocations WHERE location_name_english = 'Metropolitan Tabernacle'),
  '1871-01-29',
  (SELECT id FROM Languages WHERE language_name_english = 'English'),
  'A Plea From The Cross',
  NULL,
  NULL,
  NULL,
  3558
);
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage_english, bible_passage_urdu, location_id, date_delivered, original_language_id, title_english, title_urdu, summary_english, summary_urdu, spurgeon_gems_number
) VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name_english = 'Charles' AND last_name_english = 'Spurgeon'),
  'John 19:32-37',
  NULL,
  (SELECT id FROM PreachingLocations WHERE location_name_english = 'Metropolitan Tabernacle'),
  '1917-04-12',
  (SELECT id FROM Languages WHERE language_name_english = 'English'),
  'The Pierced Heart Of Jesus',
  NULL,
  NULL,
  NULL,
  3559
);
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage_english, bible_passage_urdu, location_id, date_delivered, original_language_id, title_english, title_urdu, summary_english, summary_urdu, spurgeon_gems_number
) VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name_english = 'Charles' AND last_name_english = 'Spurgeon'),
  'Luke 13:24',
  NULL,
  (SELECT id FROM PreachingLocations WHERE location_name_english = 'Metropolitan Tabernacle'),
  '1917-04-19',
  (SELECT id FROM Languages WHERE language_name_english = 'English'),
  'The Strait Gate',
  NULL,
  NULL,
  NULL,
  3560
);
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage_english, bible_passage_urdu, location_id, date_delivered, original_language_id, title_english, title_urdu, summary_english, summary_urdu, spurgeon_gems_number
) VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name_english = 'Charles' AND last_name_english = 'Spurgeon'),
  'Jeremiah 31:3',
  NULL,
  (SELECT id FROM PreachingLocations WHERE location_name_english = 'Metropolitan Tabernacle'),
  '1917-04-26',
  (SELECT id FROM Languages WHERE language_name_english = 'English'),
  'The Drawings Of Love',
  NULL,
  NULL,
  NULL,
  3561
);
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage_english, bible_passage_urdu, location_id, date_delivered, original_language_id, title_english, title_urdu, summary_english, summary_urdu, spurgeon_gems_number
) VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name_english = 'Charles' AND last_name_english = 'Spurgeon'),
  'Matthew 14:28-31',
  NULL,
  (SELECT id FROM PreachingLocations WHERE location_name_english = 'Metropolitan Tabernacle'),
  '1917-05-03',
  (SELECT id FROM Languages WHERE language_name_english = 'English'),
  'Peter Walking On The Sea',
  NULL,
  NULL,
  NULL,
  3562
);
INSERT OR IGNORE INTO Sermons (
  preacher_id, bible_passage_english, bible_passage_urdu, location_id, date_delivered, original_language_id, title_english, title_urdu, summary_english, summary_urdu, spurgeon_gems_number
) VALUES (
  (SELECT id FROM ProjectContributors WHERE first_name_english = 'Charles' AND last_name_english = 'Spurgeon'),
  'Psalm 32:1',
  NULL,
  (SELECT id FROM PreachingLocations WHERE location_name_english = 'Metropolitan Tabernacle'),
  '2025-10-01',
  (SELECT id FROM Languages WHERE language_name_english = 'English'),
  'A Cheering Congratulation',
  NULL,
  NULL,
  NULL,
  3563
);

