<?php //o_db.php

class o_db
{

	public $p_conn = "";

	public $p_insert_id = 0;

	public $p_num_rows = 0;


//connect to the db using configuration defaults
	public function m_connect($config)
	{

	//get db login params from configuration variables
		$db_host       = $config['system']['db_host'];
		$db_name       = $config['system']['db_name'];
		$db_login      = $config['system']['db_login'];
		$db_password   = $config['system']['db_password'];

	//create the connection
		$this->p_conn = new mysqli($db_host,$db_login,$db_password,$db_name)
		or die ("Failed to connect to MySQL server");

		if ($this->p_conn->errno > 0)
			exit("Failed to Connect to MySQL server");

	} //end m_connect


//selects a db resultset
//accepts an sql query string
	public function m_select($db_sql)
	{

	//die with a verbose error
		if (!($result = $this->p_conn->query($db_sql)))
			return $this->p_conn->errno();

	//set the _fsnep object _num_rows variable
		$this->p_num_rows = $this->p_conn->num_rows;

	//no rows then _result won't be populated
		if ($this->p_num_rows == 0) return 0;

		//loop throug the results
		while ($row = mysql_fetch_array($result))
			$r_result[] = $row;

	//destroy the db generated result object
		mysql_free_result($result);

	//return the result set
		return $r_result;

	} //end m_select


//insert a row into the db
	public function m_insert($db_sql)
	{

	//reset the _fsnep object _insert_id variable
		$this->p_insert_id = 0;

		//die with a verbose error
		if (!mysql_query($db_sql))
			return mysql_error();

	//set the db object _insert_id variable
	//from the most recent mysql insert id
		$this->p_insert_id = mysql_insert_id();

	//return 0 if _insert_id is 0
		if ($this->p_insert_id < 1)
		{
			if (mysql_affected_rows() < 1)
				return 0;
			else return 1;
		} //end if

	//otherwise return the _insert_id
		return $this->p_insert_id;

	} //end m_insert


//update or delete a table row
	public function m_update($db_sql)
	{

	//die with a verbose error
		if (!mysql_query($db_sql))
			return mysql_error();

	//return 0 if no rows were updated or deleted
		if (mysql_affected_rows() == 0)
			return 0;

	//otherwise return true
		return 1;

	} //end m_update


	public function m_db_escape($str)
	{
		return mysql_escape_string($str);
	} //end m_db_escape

} //end o_db.php