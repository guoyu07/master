INSERT INTO `[#DB_PREFIX#]system_setting` (`varname`, `value`) VALUES ('new_user_email_setting', 'a:2:{s:9:"FOLLOW_ME";s:1:"N";s:10:"NEW_ANSWER";s:1:"N";}');
INSERT INTO `[#DB_PREFIX#]system_setting` (`varname`, `value`) VALUES ('new_user_notification_setting', 'a:0:{}');

ALTER TABLE `[#DB_PREFIX#]user_action_history` ADD KEY `associate_with_uid` (  `uid`, `associate_type`, `associate_action` );

CREATE TABLE `[#DB_PREFIX#]user_action_history_fresh` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `history_id` int(11) NOT NULL,
  `associate_id` tinyint(11) NOT NULL,
  `associate_type` tinyint(1) NOT NULL,
  `associate_action` smallint(3) NOT NULL,
  `add_time` int(10) NOT NULL DEFAULT '0',
  `uid` int(10) NOT NULL DEFAULT '0',
  `anonymous` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `associate` (`associate_type`,`associate_action`),
  KEY `add_time` (`add_time`),
  KEY `uid` (`uid`),
  KEY `history_id` (`history_id`),
  KEY `associate_with_id` (`id`,`associate_type`,`associate_action`),
  KEY `associate_with_uid` (`uid`,`associate_type`,`associate_action`),
  KEY `anonymous` (`anonymous`)
) ENGINE=[#DB_ENGINE#]  DEFAULT CHARSET=utf8;