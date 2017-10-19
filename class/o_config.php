<?php //o_config.php

class o_config
{

	public $config = array();

	function __construct()
	{
//no need for construct function body
 	}

//parse the _esrs.config file
	public function m_parse_file()
	{
	//import fsnep config file from the fsnep document root
		$_config_file = file("./_esrs.config",FILE_IGNORE_NEW_LINES | FILE_SKIP_EMPTY_LINES)
		or die("Failed to open fsnep configuration file");

    //iterate over every line the config file
		foreach ($_config_file as $config_file_line)
		{
   //skip lines starting with ##
			if (preg_match("/(##)/",$config_file_line))
				continue;

	   //find and format configuration headers
			if (preg_match("/^(\[[A-Z0-9]+\])$/",$config_file_line))
			{
				$config_header = strtolower(substr($config_file_line,1,-1));
			} //end if
	   //if its a key:value line parse the pair
			elseif (preg_match("/(:)/",$config_file_line))
			{
				$config_param = explode(":",$config_file_line);
				$this->p_config[$config_header][trim($config_param[0])] = trim($config_param[1]);
			} //end elseif
  		} //end foreach

 	} //end m_parse_file


	public function m_parse_file_for_cron()
	{
	//import fsnep config file from the fsnep document root
		$_config_file = file("../../_esrs.config",FILE_IGNORE_NEW_LINES | FILE_SKIP_EMPTY_LINES)
		or die("Failed to open fsnep configuration file");

	//iterate over every line the config file
		foreach ($_config_file as $config_file_line)
		{
		//skip lines starting with ##
			if (eregi("##",$config_file_line))
				continue;
		//find and format configuration headers
			if (eregi("^\[[A-Z0-9]+\]$",$config_file_line))
			{
				$config_header = strtolower(substr($config_file_line,1,-1));
			} //end if
		//if its a key:value line parse the pair
			elseif (eregi(":",$config_file_line))
			{
				$config_param = explode(":",$config_file_line);
				$this->p_config[$config_header][trim($config_param[0])] = trim($config_param[1]);
			} //end elseif
		} //end foreach

	} //end m_parse_file_for_cron


//set config file php engine parameters
	public function m_set_phpini()
	{

		if (is_array($this->p_config['phpini']))
		{
			while (list($key,$val) = each($this->p_config['phpini']))
			{
				ini_set($key,$val)
				or die("Failed to set $key php ini parameter");
			} //end while
		} //end if

	} //end m_set_phpini


	public function m_get_config()
	{

		$o_db = new o_db();

		$sql = "select * from sys_config";
		$result = $o_db->m_select($sql);

		if (is_array($result))
			while (list($key,$val) = each($result))
				$this->p_config[$key] = $val;

	} //end m_get_config


	public function m_get_value($key='p_config')
	{
		return $this->$key;
	} //end m_get_value

} //end o_config.php