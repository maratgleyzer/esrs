<?php //_autoload.php

//define some global static values
define('CLASS_DIR',"class/");
define('CLASS_EXT',".php");

//initiate an _esrs object
$_esrs = new _esrs();
//$_esrs->_get_config();

//initiate a configuration object
$o_config = new o_config();
//parse the configuration file _esrs.config
$o_config->m_parse_file();
//set any configuration values for the php engine
$o_config->m_set_phpini();

$o_db = new o_db();
$o_db->m_connect($o_config->p_config);

$_esrs->p_db = $o_db;

$o_config->m_get_config();

//set parent config array to config object _config var
$_esrs->p_config =
$o_config->m_get_value();

$o_query = new o_query();
$_esrs->p_query = $o_query;

$o_session = new o_session();

if (!$o_session->m_get_value('user_id') && !$o_session->m_get_value('role_id'))
{
$o_session->m_add_value('user_id',($o_query->m_post('user_id') ? $o_query->m_post('user_id') : $_SESSION['user_id']));
$o_session->m_add_value('role_id',($o_query->m_post('role_id') ? $o_query->m_post('role_id') : $_SESSION['role_id']));
$o_session->m_add_value('username',($o_query->m_post('username') ? $o_query->m_post('username') : $_SESSION['username']));
$o_session->m_add_value('password',($o_query->m_post('password') ? $o_query->m_post('password') : $_SESSION['password']));
$o_session->m_add_value('user2role_id',($o_query->m_post('user2role_id') ? $o_query->m_post('user2role_id') : $_SESSION['user2role_id']));
}

$_esrs->p_session = $o_session;

//var_dump($_db);
//var_dump($_config);
//var_dump($_esrs);

//SMARTY template engine import //update after upgrade
//v. Smarty-2.6.20 ///////////////////////////////////
//////////////////////////////////////////////////////
//define the smarty template engine class directory
define('SMARTY_DIR',
$o_config->p_config['system']['root_path'] ."/".
$o_config->p_config['display']['smarty_version'] ."/libs/");

//import Smarty class libraries
require_once(SMARTY_DIR."Smarty.class.php");

//test if the class has been imported
class_exists('Smarty')
or die("Fatal Error: Failed to load Smarty Template Engine");

//initiate the Smarty template engine object
$_smarty = new Smarty();

//set smarty template directory paths
$_smarty->template_dir = $o_config->p_config['system']['root_path']."/templates/";
$_smarty->compile_dir  = $o_config->p_config['system']['root_path']."/templates_c/";
$_smarty->config_dir   = $o_config->p_config['system']['root_path']."/configs/";
$_smarty->cache_dir    = $o_config->p_config['system']['root_path']."/cache/";


//this function runs automatically when a new object instance is created
function __autoload($class_name)
{
	if (class_exists($class_name) ||
	   (preg_match("/(smarty)/",$class_name) &&
	   !preg_match("/(esrs)/",$class_name)))
		return 0;

	$class_path = CLASS_DIR.$class_name.CLASS_EXT;

	file_exists($class_path)
	or die("Fatal Error: Missing file $class_path");

	require_once($class_path);

	class_exists($class_name)
	or die("Fatal Error: Failed to load class $class_name");

} //end __autoload