<?php

//define some global static values
define('CRON_DIR',"cron/");
define('CLASS_DIR',"class/");
define('CLASS_EXT',".php");

//initiate an _esrs object
$_esrs = new _esrs();
//$_esrs->_get_config();

//initiate a configuration object
$o_config = new o_config();
//parse the configuration file _esrs.config
$o_config->m_parse_file_for_cron();
//set any configuration values for the php engine
$o_config->m_set_phpini();

$o_db = new o_db();
$o_db->m_connect($o_config->p_config);

$_esrs->p_db = $o_db;

$o_config->m_get_config();

//set parent config array to config object _config var
$_esrs->p_config =
$o_config->m_get_value();


//this function runs automatically when a new object instance is created
function __autoload($class_name)
{

if (class_exists($class_name) ||
   (eregi("smarty",$class_name) &&
   !eregi("esrs",$class_name)))
return 0;

$class_path = "../../".CLASS_DIR.$class_name.CLASS_EXT;

file_exists($class_path)
or die("Fatal Error: Missing file $class_path");

require_once($class_path);

class_exists($class_name)
or die("Fatal Error: Failed to load class $class_name");

}

?>