<?php
/*
+--------------------------------------------------------------------------
|   Anwsion [#RELEASE_VERSION#]
|   ========================================
|   by Anwsion dev team
|   (c) 2011 - 2012 Anwsion Software
|   http://www.anwsion.com
|   ========================================
|   Support: zhengqiang@gmail.com
|   
+---------------------------------------------------------------------------
*/

define('IN_AJAX', TRUE);


if (!defined('IN_ANWSION'))
{
	die;
}

class js extends AWS_CONTROLLER
{
	public function get_access_rule()
	{
		$rule_action['rule_type'] = 'black';
		
		return $rule_action;
	}
	
	public function setup()
	{
		HTTP::no_cache_header();
	}
	
	public function last_questions_action()
	{
		if (!$_GET['limit'] OR $_GET['limit'] > 100)
		{
			$_GET['limit'] = 10;
		}
		
		echo $this->model('k2_external')->format_js_question_output($this->model('question')->get_questions_list(1, intval($_GET['limit']), 'new', $_GET['topic_ids'], $_GET['category_id'], null, $_GET['day']));
	}
	
	public function hot_users_action()
	{
		if (!$_GET['limit'] OR $_GET['limit'] > 100)
		{
			$_GET['limit'] = 10;
		}
		
		echo $this->model('k2_external')->format_js_users_output($this->model('k2_external')->k2_hot_users(0, $_GET['limit']));
	}
}