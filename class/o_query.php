<?php //o_query.php

class o_query
{

	public $p_get = array();

	public $p_post = array();

	public $p_cookie = array();

	public $p_method = "";

	public $p_query = "";


	function __construct()
	{

		$this->p_cookie = $_COOKIE;
		$this->p_method = $_SERVER['REQUEST_METHOD'];
		$this->p_query = $_SERVER['QUERY_STRING'];

		switch ($this->p_method)
		{
			case 'GET':
			$get_pairs = explode("&",self::m_decode_q($this->p_query));
			foreach ($get_pairs as $get_pair)
			{
			$pair = explode("=",$get_pair);
			$this->p_get[$pair[0]] = $pair[1];
			}
			$this->p_post = $this->p_get;
			break;

			case 'POST':
			if (is_array($_POST) && (count($_POST) > 0))
			$this->p_post = array_merge($_POST,$this->p_cookie);
			break;
		} //end switch

	} //end __construct


	public function m_get($key=null)
	{
		return $this->p_get[$key];
	} //end m_get


	public function m_post($key=null)
	{
		return $this->p_post[$key];
	} //end m_post


	public function m_decode_q($query=null)
	{
		return convert_uudecode(urldecode(base64_decode($query)));
	} //end m_decode_q


	public function m_encode_q($query=null)
	{
		$session_query = $_COOKIE['PHPSESSID']."&".$query;
		return base64_encode(urlencode(convert_uuencode($session_query)));
	} //end m_encode_q

} //end o_query.php