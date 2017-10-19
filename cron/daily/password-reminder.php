<?php

//initiate the system with global vars and object starts
require_once("../_autoload.php");

$sql =
"

select
distinct(user_id),
last_name,
first_name,
email_address,
username,
password,
encoding

from
users

where created_u >= CURDATE() - INTERVAL 1 WEEK
  and verified < 1

order by user_id

";

$records = $o_db->m_select($sql);

//echo $sql;
//echo $records;

if (is_array($records))
	foreach ($records as $record)
	{

		//set local configuration params
		$record['host_url']       = $_esrs->p_config['system']['host_url'];
		$record['email_domain']   = $_esrs->p_config['display']['email_domain'];

		$user_id                  = $record['user_id'];
		$username                 = $record['username'];

		$password                 = $o_query->m_decode_q($record['encoding']);
		$record['password']       = $password;

		$record['email_query']    = $o_query->m_encode_q("verify=$user_id&username=$username&password=$password");

		//var_dump($record);

		/*email*/   $error = $_esrs->sendemail(125,$record,1) ;

	}