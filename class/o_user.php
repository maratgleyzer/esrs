<?php

class o_user
{

public $p_user_id = 0;

public $p_role_id = 0;

public $p_status = 0;

public $p_login_fail = "";

public $p_login_pass = "";

public $p_register_fail = "";

public $p_register_pass = "";

public $p_fields = array();

public $p_email = array();


public function m_default_password($input=array())
{

return $input['campus_id'];

}


public function m_crypt_password($input=array())
{

if ($crypted = crypt($input['password'],$input['crypt_seed']))
return $crypted;

return 0;

}


public function m_encoding($value)
{
return base64_encode(urlencode(convert_uuencode($value)));
}


public function m_test_input($input=array(),$type="")
{

$role_id   = $input['role_id'];
$fname     = $input['first_name'];
$lname     = $input['last_name'];
$uname     = $input['username'];
$camid     = $input['campus_id'];
$domain    = $input['email_domain'];

if (!$role_id)
return "You have not made a 'User Role' selection.";

if (!$fname)
return "You have not entered a 'First Name'.";

if (!$lname)
return "You have not entered a 'Last Name'.";

if (!$uname)
return "You have not entered a 'Campus eMail Address'.";

if (!$camid)
return "You have not entered a 'Campus ID'.";

if (!$domain)
return "You have not selected a 'Host Domain'.";

}


public function m_format_input($input=array(),$type="")
{

$result = array();

$result['edit_id']         = $input['edit_id'];

$result['role_id']         = o_db::m_db_escape($input['role_id']);
$result['first_name']      = o_db::m_db_escape(ucfirst(strtolower($input['first_name'])));
$result['last_name']       = o_db::m_db_escape(ucfirst(strtolower($input['last_name'])));
$result['campus_id']       = o_db::m_db_escape(eregi_replace("[^A-Z0-9]","",strtoupper($input['campus_id'])));
$result['email_address']   = o_db::m_db_escape(strtolower($input['username']."@".$input['email_domain']));
$result['username']        = o_db::m_db_escape(strtolower($input['username']));

$result['role']            = self::m_get_one_role($result['role_id']);

if (eregi("add",$type))
{
$input['password']         = self::m_default_password($input);
$input['crypt_password']   = self::m_crypt_password($input);
$result['password']        = $input['password'];
$result['crypt_password']  = $input['crypt_password'];
$result['encoding']        = self::m_encoding($input['password']);
}

return $result;

}


public function m_save_record($input=array())
{

$roled = $input['role_id'];
$fname = $input['first_name'];
$lname = $input['last_name'];
$uname = $input['username'];
$camid = $input['campus_id'];
$email = $input['email_address'];
$cpass = $input['crypt_password'];
$encod = $input['encoding'];

$sql =
"
insert into
 users (`campus_id`,`first_name`,`last_name`,`email_address`,`username`,`password`,`encoding`)
values (\"$camid\",\"$fname\",\"$lname\",\"$email\",\"$uname\",\"$cpass\",\"$encod\")
";
$result = o_db::m_insert($sql);

//echo $result;

if (!$result || !is_int($result))
return $result;

$u2r_id = $result.$roled;

$sql =
"
insert into
users2roles (`user2role_id`,`user_id`,`role_id`)
     values ( $u2r_id,$result,$roled );
";

$result = o_db::m_insert($sql);

if (!$result || !is_int($result))
return $result;

//echo $result;

return $u2r_id;

}


public function m_edit_record($input=array())
{

$edit_id       = $input['edit_id'];

$role_id       = substr($edit_id,-1);
$user_id       = substr($edit_id,0,6);

$roled = $input['role_id'];
$fname = $input['first_name'];
$lname = $input['last_name'];
$camid = $input['campus_id'];
$usern = $input['username'];
$email = $input['email_address'];

$sql =
"
update users
set first_name = \"$fname\",
    last_name = \"$lname\",
    campus_id = \"$camid\",
    username = \"$usern\",
    email_address = \"$email\"
where user_id = $user_id
";
$result = o_db::m_update($sql);

if ($result == 0) return 0;

//echo $result;

$u2r = $user_id.$roled;
//echo $u2c;

$sql =
"
insert into
users2roles (`user2role_id`,`user_id`,`role_id`)
     values ( $u2r,$user_id,$roled )
";
$result = o_db::m_insert($sql);

if (!$result) return 0;

//echo $result;

return $u2r;

}


public function m_get_domains($campus=0,$depart=0)
{

if (!$campus && !$depart)
$sql = "select distinct(email_domain),default_c from campuses order by email_domain";

if ($campus > 0)
$sql = "select distinct(email_domain),default_c from campuses where camp_id = $campus limit 1";

if ($depart > 0)
$sql =
"
select
distinct(c.email_domain),
c.default_c,
d.camp_id

from campuses `c`
left join departments `d` on (c.camp_id = d.camp_id and $depart = d.dept_id)

order by c.email_domain
";

$result = o_db::m_select($sql);

if (is_array($result))
return $result;

return 0;

}


public function m_menu_domains($email_domain="",$type="")
{

$C = o_session::m_get_value('campus');
$D = o_session::m_get_value('department');

$domains = self::m_get_domains($C,$D);

if (is_array($domains))
{
foreach ($domains as $domain)
{
$camp_id = $domain['camp_id'];
$default_c = $domain['default_c'];
$xemail_domain = $domain['email_domain'];
if (!eregi("^[A-Z0-9_\.\-]+\.[A-Z]{2,3}$",$xemail_domain))
continue;
$menu .= "<option value=\"$xemail_domain\""
.($xemail_domain == $email_domain ? " selected" :
 ($camp_id > 0 ? " selected" :
 (ord($default_c) > 0 ? " selected" : "")))
.">$xemail_domain</option>";
}
}

else
{
$menu .= "<option value=\"\">-- none available --</option>";
}

$menu =
"
<select id=\"esrs_menu\" class=\"esrs_menu\" name=\"esrs_$type"."[email_domain]\">
$menu
</select>
";

return $menu;

}


public function m_register($p_post=array(),$seed="MG",$domain="domain.com",$host="host.com")
{

$role_id = 5;

$this->p_fields = $p_post;

if (isset($this->p_fields['role_id']) && !empty($this->p_fields['role_id']))
$role_id = $this->p_fields['role_id'];

if (is_array($this->p_fields))
{

while (list($key,$val) = each($this->p_fields))
{
if (eregi("[^A-Z0-9\._ -]+",$val))
{
$this->p_register_fail =
"You have submitted restricted characters in one or more form fields. Permitted characters are A through Z, 0 through 9, dot (.), underscore (_), hyphen (-), and space.";
return 0;
}
}

}

if ((!isset($this->p_fields['first_name'])    || empty($this->p_fields['first_name']))    ||
    (!isset($this->p_fields['last_name'])     || empty($this->p_fields['last_name']))     ||
    (!isset($this->p_fields['email_address']) || empty($this->p_fields['email_address'])) ||
    (!isset($this->p_fields['confirm_email']) || empty($this->p_fields['confirm_email'])) ||
    (!isset($this->p_fields['campus_id'])     || empty($this->p_fields['campus_id']))     ||
    (!isset($this->p_fields['confirm_id'])    || empty($this->p_fields['confirm_id'])))
{
$this->p_register_fail =
"You have not filled-in one or more fields. Please complete the form entirely and resubmit your registration.";
return 0;
}

if ($this->p_fields['email_address'] != $this->p_fields['confirm_email'])
{
$this->p_register_fail =
"Your campus email address does not match the email confirmation. Please verify you have entered your email address correctly in both fields and try again.";
return 0;
}

if ($this->p_fields['campus_id'] != $this->p_fields['confirm_id'])
{
$this->p_register_fail =
"Your campus id does not match the id confirmation. Please verify you have entered your campus id correctly in both fields and try again.";
return 0;
}

if ((strlen($this->p_fields['campus_id']) < 8) || (strlen($this->p_fields['confirm_id']) < 8) ||
    (strlen($this->p_fields['campus_id']) > 20) || (strlen($this->p_fields['confirm_id']) > 20))
{
$this->p_register_fail =
"Your campus id and id confirmation MUST be at least (8) alpha-numeric characters long. Please verify you have entered your campus id correctly and try again.";
return 0;
}

$this->p_fields['crypt_seed'] = $seed;

$first_name        = o_db::m_db_escape(ucfirst(strtolower($this->p_fields['first_name'])));
$last_name         = o_db::m_db_escape(ucfirst(strtolower($this->p_fields['last_name'])));
$email_address     = o_db::m_db_escape(strtolower($this->p_fields['email_address']."@".$domain));
$campus_id         = o_db::m_db_escape(eregi_replace("[^A-Z0-9]","",strtoupper($this->p_fields['campus_id'])));

$username          = strtolower($this->p_fields['email_address']);
$this->p_fields['password']       = self::m_default_password($this->p_fields);
$this->p_fields['crypt_password'] = self::m_crypt_password($this->p_fields);
$password          = $this->p_fields['password'];
$crypt_password    = $this->p_fields['crypt_password'];
$username          = o_db::m_db_escape($username);

$encoding          = self::m_encoding($password);

$sql = "insert into `users` (`campus_id`,`first_name`,`last_name`,`email_address`,`username`,`password`,`encoding`) values (\"$campus_id\",\"$first_name\",\"$last_name\",\"$email_address\",\"$username\",\"$crypt_password\",\"$encoding\")";
$user_id = o_db::m_insert($sql);

if (is_int($user_id))
{
$sql = "insert into `users2roles` (`user2role_id`,`user_id`,`role_id`) values ($user_id$role_id,$user_id,$role_id)";
$user2role_id = o_db::m_insert($sql);
}

else if (eregi("duplicate",$user_id))
{
$this->p_register_fail =
"You have already registered your information and are attempting to create a dupliate record.";
return 0;
}

if ($user2role_id > 0)
{
$this->p_register_pass =
"You have successfully registered to use the exam scheduling system. An email containing your 'username' and 'password' has been sent to your registered email address.";
}

else
{
$this->p_register_fail =
"An error has occurred and your registration could not be processed. Please verify you've entered correct information and try again.";
return 0;
}

$this->p_email['host_url']       = $host;
$this->p_email['first_name']     = $first_name;
$this->p_email['last_name']      = $last_name;
$this->p_email['email_address']  = $email_address;
$this->p_email['username']       = $username;
$this->p_email['password']       = $password;
$this->p_email['email_domain']   = $domain;

$this->p_email['email_query'] = o_query::m_encode_q("verify=$user_id&username=$username&password=$password");

/*email*/   $error = _esrs::sendemail(123,$this->p_email,1) ;

if ($error)
{
$this->p_register_fail =
"An error has occurred and your registration confirmation email was not sent. Please contact the Master Administrator at madmin@$domain.";
return 0;
}

unset($this->p_fields);

}


public function m_verify($p_post=array(),$seed="MG",$domain="domain.com")
{

$username = $p_post['username'];
$user_id  = substr($p_post['verify'],0,6);

$p_post['crypt_seed'] = $seed;

$password = self::m_crypt_password($p_post);

$sql =
"
select user_id
from users
where user_id = $user_id
  and username = \"$username\"
  and password = \"$password\"
  and verified = 0
";
$result = o_db::m_select($sql);

if (is_array($result))
{

$sql =
"
update users
set verified = 1,
    lastlog_u = NOW()
where user_id = $user_id
  and username = \"$username\"
  and password = \"$password\"
";
$result = o_db::m_update($sql);

if (is_numeric($result) && ($result > 0))
{
$this->p_login_pass =
"Your email address and login information has successfully been verified.";
return 1;
}

else
{
$this->p_login_fail =
"An error has occurred and your email address could not be verified. Please contact the Master Administrator at madmin@$domain.";
return 0;
}

}

else
{
$this->p_login_fail =
"Your identity as a recent registrant could not be verified. Please contact the Master Administrator at madmin@$domain.";
return 0;
}

}


public function m_login($p_post=array(),$seed="MG")
{

$this->p_fields['username']    = $p_post['username'];
$this->p_fields['password']    = $p_post['password'];
$this->p_fields['crypt_seed']  = $seed;


if ((!isset($this->p_fields['username']) || empty($this->p_fields['username'])) ||
    (!isset($this->p_fields['password']) || empty($this->p_fields['password'])))
{
$this->p_login_fail =
"You have not filled-in one or more fields. Please complete the form entirely and resubmit your login.";
return 0;
}

$username = strtolower($this->p_fields['username']);
$password = $this->p_fields['password'];

if (eregi("[^A-Z0-9\._-]+",$username))
{
$this->p_login_fail =
"You have submitted restricted characters in the 'Username' field. Permitted characters are A through Z, 0 through 9, dot (.), underscore (_), and hyphen (-).";
return 0;
}

if (eregi("[^A-Z0-9\._\/\\#@\$%-]+",$password))
{
$this->p_login_fail =
"You have submitted restricted characters in the 'Password' field. Permitted characters are A through Z, 0 through 9, dot (.), underscore (_), hyphen (-), forward-slash (/), back-slash (\), pound (#), at (@), dollar ($), and percent (%).";
return 0;
}

$password = self::m_crypt_password($this->p_fields);

//u.user_id,
//u.campus_id,
//u.first_name,
//u.last_name,
//u2r.user2role_id,
//u2r.created_u2r,
//u2r.disable_u2r,
//r.role_id,
//r.role

//u.*,u2r.*,r.*

$sql =
"
select
u.*,u2r.*,r.*
from users `u`,users2roles `u2r`,sys_roles `r`
where u.password = \"$password\"
  and u.username = \"$username\"
  and u.disable_u = 0
  and u.user_id = u2r.user_id
  and u2r.disable_u2r = 0
  and u2r.role_id = r.role_id
order by u2r.created_u2r desc
";
$result = o_db::m_select($sql);

if (is_array($result))
{

$this->p_user_id = $result[0]['user_id'];
$this->p_role_id = $result[0]['role_id'];

$sql =
"
update users
   set lastlog_u = NOW()
where user_id = "
.$this->p_user_id;

o_db::m_update($sql);

$sql =
"
update users2roles
   set lastlog_u2r = NOW()
where user_id = "
.$this->p_user_id
." and role_id = "
.$this->p_role_id;

o_db::m_update($sql);

if (count($result) > 1)
{

for ($i = 0; $i < count($result) ; ++$i)
{
$result[$i]['row'] = (($i % 2) > 0 ? "esrs_row_1" : "esrs_row_2");
$result[$i]['query_string'] = o_query::m_encode_q("use_role=".$result[$i]['role_id']."&user_id=".$result[$i]['user_id']);
}

$this->p_result = $result;
$this->p_status = 2;

}

else
{
$this->p_status = 1;
}

}

else
{

$this->p_login_fail =
"An error has occurred and your login could not be processed. Please verify you've entered your correct Username and Password, and try again.";
$this->p_status = 0;

}

}


function m_get_one_role($id)
{

$sql = "select role from sys_roles where role_id = $id";
$result = o_db::m_select($sql);

if (is_array($result))
return $result[0]['role'];

return 0;

}


function m_get_all_roles()
{

$sql = "select * from sys_roles order by role_id";
$result = o_db::m_select($sql);

if (is_array($result))
return $result;

return 0;

}


function m_get_user_roles($role_id=1)
{

$sql =
"
select * from sys_roles
where role_id
"
.($role_id > 1 ? " > " : " >= ").
"
$role_id
order by role_id
";
$result = o_db::m_select($sql);

if (is_array($result))
return $result;

return 0;

}


function m_menu_roles($role_id=1,$input_role=0,$type='find')
{

$roles = self::m_get_user_roles($role_id);

if (is_array($roles))
{
foreach ($roles as $role)
{
$verbose = $role['role'];
$menu .= "<option value=\"$role[role_id]\""
.($role['role_id'] == $input_role ? " selected" : "")
.">$verbose</option>";
}
}

else
{
$menu .= "<option value=\"\">-- none available --</option>";
}

$menu =
"
<select id=\"esrs_menu\" class=\"esrs_menu\" name=\"esrs_$type"."[role_id]\">
<option value=0>select a user role</option>
$menu
</select>
";

return $menu;

}


public function m_parse_records($records=array(),$insert=0,$update=0)
{

if (is_array($records))
{

foreach ($records as $record)
{

++$num_rows;

$role = $record['role'];
$fname = $record['first_name'];
$lname = $record['last_name'];
$campid = $record['campus_id'];
$created = $record['created_u2r'];
$disable_u = $record['disable_u'];
$disable_u2r = $record['disable_u2r'];
$user_id = $record['user_id'];
$u2r_id = $record['user2role_id'];

++$i;
$row =
($insert==$u2r_id
 ? "esrs_row_add"
 : ($update==$u2r_id
    ? "esrs_row_edit"
    : (($i % 2) > 0
       ? "esrs_row_1"
       : "esrs_row_2")));

// enable base64 = manage_users=1&enable=1; disable base64 = manage_users=1&disable=1
$toggle_user =
(ord($disable_u) > 0
 ? "(<a id=\"esrs_toggle_on\" class=\"esrs_toggle_on\" href=\"javascript:\" onClick=\"esrs_set('esrs_find','enable_u','".$user_id."');\">enable</a>)"
 : "(<a id=\"esrs_toggle_off\" class=\"esrs_toggle_off\" href=\"javascript:\" onClick=\"esrs_set('esrs_find','disable_u','".$user_id."');\">disable</a>)"
);

// enable base64 = manage_users=1&enable=1; disable base64 = manage_users=1&disable=1
$toggle_role =
(ord($disable_u) > 0
 ? "disabled"
 : (ord($disable_u2r) > 0
    ? "(<a id=\"esrs_toggle_on\" class=\"esrs_toggle_on\" href=\"javascript:\" onClick=\"esrs_set('esrs_find','enable_u2r','".$u2r_id."');\">enable</a>)"
    : "(<a id=\"esrs_toggle_off\" class=\"esrs_toggle_off\" href=\"javascript:\" onClick=\"esrs_set('esrs_find','disable_u2r','".$u2r_id."');\">disable</a>)"
));

$record_list .=
"
<tr>
<td id=\"$row\" class=\"$row\" width=40><a href=\"javascript:\" onClick=\"esrs_set('esrs_find','edit_id','".$u2r_id."')\">edit</a></td>
<td id=\"$row\" class=\"$row\">$toggle_user $lname, $fname</td>
<td id=\"$row\" class=\"$row\">$campid</td>
<td id=\"$row\" class=\"$row\">$toggle_role $role</td>
<td id=\"$row\" class=\"$row\">$created</td>
<td id=\"$row\" class=\"$row\" width=1><a href=\"javascript:\" onClick=\"esrs_set('esrs_find','default','".$u2r_id."')\">default</a></td>
</tr>
";
}

}

else
{
$record_list .=
"
<tr>
<td id=\"esrs_row_1\" class=\"esrs_row_1\" colspan=10 align=center>-- none available --</td>
</tr>
";
}

return $record_list;

}


public function m_filter_records($role_id=1,$input=array(),$start=0,$limit=0)
{

$this->page_start = $start;
$this->page_limit = $limit;

$user = $input['user_id'];
$role = $input['role_id'];
$fname = $input['first_name'];
$lname = $input['last_name'];
$campus_id = $input['campus_id'];
$disable = $input['disable'];
$edit_id = $input['edit_id'];

$sort = $input['sortorder'];

$where =
($user > 0 ? "and u.user_id = $user " : "").
($role > 0 ? "and u2r.role_id = $role " : "").
($fname != "" ? "and u.first_name like \"$fname%\" " : "").
($lname != "" ? "and u.last_name like \"$lname%\" " : "").
($campus_id != "" ? "and u.campus_id like \"$campus_id%\" " : "").
($disable > 0 ? "and (u.disable_u = 1 or u2r.disable_u2r = 1)" : "and u.disable_u = 0 and u2r.disable_u2r = 0");

switch ($sort)
{
case "n_u":
$order = "u.last_name,u.first_name,u.username,u2r.created_u2r desc,u2r.role_id";
break;
case "n_d":
$order = "u.last_name desc,u.first_name desc,u.username desc,u2r.created_u2r desc,u2r.role_id";
break;
case "c_u":
$order = "u.campus_id";
break;
case "c_d":
$order = "u.campus_id desc";
break;
case "r_u":
$order = "u2r.role_id";
break;
case "r_d":
$order = "u2r.role_id desc";
break;
case "d_u":
$order = "u2r.created_u2r";
break;
case "d_d":
$order = "u2r.created_u2r desc";
break;
default:
$order = "u.last_name,u.first_name,u.username,u2r.created_u2r desc,u2r.role_id";
break;
}

$this->sql_base =
"
from users `u`,users2roles `u2r`,sys_roles `r`
where (u.lastlog_u >= CURDATE() - INTERVAL 2 YEAR
    or u.lastlog_u = '0000-00-00 00:00:00')
  and u.user_id = u2r.user_id
  and u2r.role_id = r.role_id
"
.($role_id > 1 ? "and r.role_id > $role_id" : "").
"
$where
order by
$order
";


$sql =
"
select
u.user_id,
u.first_name,
u.last_name,
u.campus_id,
u.disable_u,
u2r.user2role_id,
u2r.created_u2r,
u2r.disable_u2r,
r.role
$this->sql_base
limit $start, $limit
";
$result = o_db::m_select($sql);

if (is_array($result))
return $result;

return 0;

}


public function m_disable_role($u2r_id=0)
{

$sql = "update users2roles set disable_u2r = 1 where user2role_id = $u2r_id";
if ($result = o_db::m_update($sql))
return 1;

return 0;

}


public function m_enable_role($u2r_id=0)
{

$sql = "update users2roles set disable_u2r = 0 where user2role_id = $u2r_id";
if ($result = o_db::m_update($sql))
return 1;

return 0;

}


public function m_disable_user($user_id=0)
{

$sql = "update users set disable_u = 1 where user_id = $user_id";
if ($result = o_db::m_update($sql))
return 1;

return 0;

}


public function m_enable_user($user_id=0)
{

$sql = "update users set disable_u = 0 where user_id = $user_id";
if ($result = o_db::m_update($sql))
return 1;

return 0;

}


public function m_get_one_record($u2r_id=0)
{

$sql =
"
select u.*,u2r.*,r.*
from users `u`,users2roles `u2r`,sys_roles `r`
where u2r.user2role_id = $u2r_id
  and u2r.user_id = u.user_id
  and u2r.role_id = r.role_id
";
$result = o_db::m_select($sql);

if (is_array($result))
return $result[0];

return 0;

}

}