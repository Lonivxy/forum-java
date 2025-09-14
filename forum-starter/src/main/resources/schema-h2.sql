-- ----------------------------
-- Table structure for forum_article_type
-- ----------------------------
DROP TABLE IF EXISTS forum_article_type;
CREATE TABLE forum_article_type (
  id BIGINT NOT NULL AUTO_INCREMENT,
  audit_state VARCHAR(64) NOT NULL,
  name VARCHAR(64) NOT NULL,
  description VARCHAR(1024) NOT NULL,
  ref_count BIGINT NOT NULL DEFAULT 0,
  scope VARCHAR(32) NOT NULL,
  creator_id BIGINT NOT NULL,
  is_delete TINYINT NOT NULL DEFAULT 0,
  create_at TIMESTAMP NOT NULL,
  update_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  UNIQUE KEY uniq_name_state (name, audit_state)
);

-- ----------------------------
-- Table structure for forum_cache
-- ----------------------------
DROP TABLE IF EXISTS forum_cache;
CREATE TABLE forum_cache (
  id BIGINT NOT NULL AUTO_INCREMENT,
  key VARCHAR(100) NOT NULL,
  value LONGTEXT NOT NULL,
  type VARCHAR(64) NOT NULL,
  is_delete TINYINT NOT NULL DEFAULT 0,
  create_at TIMESTAMP NOT NULL,
  update_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  UNIQUE KEY uniq_key (key)
);

-- ----------------------------
-- Table structure for forum_comment
-- ----------------------------
DROP TABLE IF EXISTS forum_comment;
CREATE TABLE forum_comment (
  id INT NOT NULL AUTO_INCREMENT,
  user_id BIGINT NOT NULL,
  reply_id BIGINT DEFAULT NULL,
  reply_reply_id BIGINT DEFAULT NULL,
  posts_id BIGINT NOT NULL,
  content LONGTEXT NOT NULL,
  is_delete TINYINT NOT NULL DEFAULT 0,
  create_at TIMESTAMP NOT NULL,
  update_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  KEY idx_uid_pid (user_id, posts_id),
  KEY idx_postsid (posts_id)
);

-- ----------------------------
-- Table structure for forum_message
-- ----------------------------
DROP TABLE IF EXISTS forum_message;
CREATE TABLE forum_message (
  id BIGINT NOT NULL AUTO_INCREMENT,
  channel VARCHAR(64) NOT NULL,
  type VARCHAR(64) NOT NULL,
  read VARCHAR(64) NOT NULL,
  sender_type VARCHAR(64) NOT NULL,
  sender VARCHAR(64) NOT NULL,
  receiver_type VARCHAR(64) NOT NULL,
  receiver VARCHAR(64) NOT NULL,
  title VARCHAR(256) NOT NULL,
  content_type VARCHAR(64) NOT NULL,
  content LONGTEXT NOT NULL,
  is_delete TINYINT NOT NULL DEFAULT 0,
  create_at TIMESTAMP NOT NULL,
  update_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  KEY idx_sender (sender),
  KEY idx_receiver_type (receiver, type)
);

-- ----------------------------
-- Table structure for forum_opt_log
-- ----------------------------
DROP TABLE IF EXISTS forum_opt_log;
CREATE TABLE forum_opt_log (
  id BIGINT NOT NULL AUTO_INCREMENT,
  type VARCHAR(64) NOT NULL,
  operator_id BIGINT NOT NULL,
  content LONGTEXT NOT NULL,
  is_delete TINYINT NOT NULL DEFAULT 0,
  create_at TIMESTAMP NOT NULL,
  update_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  KEY idx_operator_id (operator_id)
);

-- ----------------------------
-- Table structure for forum_posts
-- ----------------------------
DROP TABLE IF EXISTS forum_posts;
CREATE TABLE forum_posts (
  id BIGINT NOT NULL AUTO_INCREMENT,
  audit_state VARCHAR(64) NOT NULL,
  category VARCHAR(64) NOT NULL,
  author_id BIGINT NOT NULL,
  title VARCHAR(256) NOT NULL,
  content_type VARCHAR(64) NOT NULL,
  markdown_content LONGTEXT NOT NULL,
  html_content LONGTEXT NOT NULL,
  views BIGINT NOT NULL DEFAULT 0,
  approvals BIGINT NOT NULL DEFAULT 0,
  comments BIGINT NOT NULL DEFAULT 0,
  type_id BIGINT NOT NULL DEFAULT 0,
  head_img VARCHAR(8192) NOT NULL DEFAULT '',
  official TINYINT NOT NULL DEFAULT 0,
  top TINYINT NOT NULL DEFAULT 0,
  sort INT NOT NULL DEFAULT 1000,
  marrow TINYINT NOT NULL DEFAULT 0,
  comment_id BIGINT NOT NULL,
  is_delete TINYINT NOT NULL DEFAULT 0,
  create_at TIMESTAMP NOT NULL,
  update_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  KEY idx_author (author_id),
  KEY idx_category_state_views (category, audit_state, views)
);

-- ----------------------------
-- Table structure for forum_search
-- ----------------------------
DROP TABLE IF EXISTS forum_search;
CREATE TABLE forum_search (
  id BIGINT NOT NULL AUTO_INCREMENT,
  type VARCHAR(64) NOT NULL,
  entity_id BIGINT NOT NULL,
  title VARCHAR(256) NOT NULL,
  content LONGTEXT NOT NULL,
  is_delete TINYINT NOT NULL DEFAULT 0,
  create_at TIMESTAMP NOT NULL,
  update_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  KEY idx_type_title (type, title),
  KEY idx_type_create (type, create_at)
);

-- ----------------------------
-- Table structure for forum_tag
-- ----------------------------
DROP TABLE IF EXISTS forum_tag;
CREATE TABLE forum_tag (
  id BIGINT NOT NULL AUTO_INCREMENT,
  audit_state VARCHAR(64) NOT NULL,
  group_name VARCHAR(255) NOT NULL,
  name VARCHAR(64) NOT NULL,
  description VARCHAR(1024) NOT NULL,
  ref_count BIGINT NOT NULL DEFAULT 0,
  creator_id BIGINT NOT NULL,
  is_delete TINYINT NOT NULL DEFAULT 0,
  create_at TIMESTAMP NOT NULL,
  update_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  UNIQUE KEY uniq_name_state (name, audit_state)
);

-- ----------------------------
-- Table structure for forum_tag_posts_mapping
-- ----------------------------
DROP TABLE IF EXISTS forum_tag_posts_mapping;
CREATE TABLE forum_tag_posts_mapping (
  id BIGINT NOT NULL AUTO_INCREMENT,
  tag_id BIGINT NOT NULL,
  posts_id BIGINT NOT NULL,
  is_delete TINYINT NOT NULL DEFAULT 0,
  create_at TIMESTAMP NOT NULL,
  update_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  UNIQUE KEY uniq_posts_tag (posts_id, tag_id)
);

-- ----------------------------
-- Table structure for forum_user
-- ----------------------------
DROP TABLE IF EXISTS forum_user;
CREATE TABLE forum_user (
  id BIGINT NOT NULL AUTO_INCREMENT,
  email VARCHAR(64) NOT NULL,
  nickname VARCHAR(64) NOT NULL,
  password VARCHAR(128) NOT NULL,
  role VARCHAR(32) NOT NULL,
  state VARCHAR(64) NOT NULL,
  sex VARCHAR(32) NOT NULL,
  avatar VARCHAR(256) NOT NULL DEFAULT '',
  signature VARCHAR(1024) NOT NULL DEFAULT '',
  last_login_time TIMESTAMP NOT NULL,
  is_delete TINYINT NOT NULL DEFAULT 0,
  create_at TIMESTAMP NOT NULL,
  update_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  source VARCHAR(64) DEFAULT 'REGISTER',
  ext BLOB,
  PRIMARY KEY (id),
  UNIQUE KEY uniq_email (email)
);

-- ----------------------------
-- Table structure for forum_user_follow
-- ----------------------------
DROP TABLE IF EXISTS forum_user_follow;
CREATE TABLE forum_user_follow (
  id INT NOT NULL AUTO_INCREMENT,
  followed BIGINT NOT NULL,
  followed_type VARCHAR(64) NOT NULL,
  follower BIGINT NOT NULL,
  is_delete TINYINT NOT NULL DEFAULT 0,
  create_at TIMESTAMP NOT NULL,
  update_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  UNIQUE KEY uniq_followed_follower (followed, followed_type, follower),
  KEY idx_follower (follower)
);

-- ----------------------------
-- Table structure for forum_user_food
-- ----------------------------
DROP TABLE IF EXISTS forum_user_food;
CREATE TABLE forum_user_food (
  id BIGINT NOT NULL AUTO_INCREMENT,
  user_id BIGINT NOT NULL,
  posts_id BIGINT NOT NULL,
  is_delete TINYINT NOT NULL DEFAULT 0,
  create_at TIMESTAMP NOT NULL,
  update_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  UNIQUE KEY uniq_uid_pid (user_id, posts_id)
);

-- ----------------------------
-- Table structure for forum_config
-- ----------------------------
DROP TABLE IF EXISTS forum_config;
CREATE TABLE forum_config (
  id BIGINT NOT NULL AUTO_INCREMENT,
  state VARCHAR(64) NOT NULL,
  type VARCHAR(64) NOT NULL,
  name VARCHAR(1024) NOT NULL,
  content LONGTEXT NOT NULL,
  start_at TIMESTAMP NOT NULL,
  end_at TIMESTAMP NOT NULL,
  creator BIGINT NOT NULL,
  is_delete TINYINT NOT NULL DEFAULT 0,
  create_at TIMESTAMP NOT NULL,
  update_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (id)
);