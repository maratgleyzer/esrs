<?php //o_session.php

class o_session
{

public $p_session = array();


function __construct()
{
$this->p_session = $_SESSION;
}


public function m_session()
{
$_SESSION = $this->p_session;
}


public function m_add_value($key=null,$val=null)
{
$this->p_session[$key] = $val;
self::m_session();
}


public function m_get_value($key=null)
{
return $_SESSION[$key];
}


public function m_unset_value($key=null)
{
unset($this->p_session[$key]);
unset($_SESSION[$key]);
}


public function m_logout()
{
self::m_unset_value('user2role_id');
self::m_unset_value('user_id');
self::m_unset_value('role_id');
self::m_unset_value('console');
}

/////////////////////////////////
//////////// EXAM SESSION SECTION
/////////////////////////////////

public function m_rsvp_session($user=0,$role=5,$sesn=0)
{

$sql =
"

select
distinct(e.exam_id)

from
users2exams `u2e`,
sessions `ss`,
exams `e`

where ss.sesn_id = $sesn
  and ss.exam_id = e.exam_id
  and e.exam_id = u2e.exam_id

";

//echo $sql;

$result = o_db::m_select($sql);

if (is_array($result))
{

$u2r = "$user$role";

$exam = $result[0]['exam_id'];
unset($result);

if ($role < 5)
{

$sql = "update sessions set faculty = $u2r where sesn_id = $sesn and exam_id = $exam";

if ($result = o_db::m_update($sql))
return 0;

}

else
{

$u2s = "$u2r$sesn";

$sql = "insert into users2sessions (`user2sesn_id`,`user2role_id`,`sesn_id`)
                            values ($u2s,$u2r,$sesn)";

$result = o_db::m_insert($sql);

if (!$result || !is_int($result))
return 1;

$sql = "update sessions set registered = registered + 1 where sesn_id = $sesn and exam_id = $exam";

if ($result = o_db::m_update($sql))
return 0;

}

}

return 1;

}


public function m_get_facilitators($exam_id="0")
{

$sql =
"

select
u2e.user2role_id,
u.first_name,
u.last_name

from
users2exams `u2e`,
users2roles `u2r`,
users `u`,
exams `e`

where e.exam_id = $exam_id
  and e.exam_id = u2e.exam_id
  and u2e.user2role_id = u2r.user2role_id
  and u2r.user_id = u.user_id
  and u2e.disable_u2e = 0
  and u2r.disable_u2r = 0
  and u.disable_u = 0
  and u2r.role_id = 4

order by u.last_name

";
$result = o_db::m_select($sql);

if (is_array($result))
return $result;

return 0;

}


public function m_menu_facilitators($exam_id,$u2r_id=0,$type="")
{

$facilitators = self::m_get_facilitators($exam_id);

if (is_array($facilitators))
{
foreach ($facilitators as $facilitator)
{
$xu2r_id  = $facilitator['user2role_id'];
$fname    = $facilitator['first_name'];
$lname    = $facilitator['last_name'];

$menu .= "<option value=\"$xu2r_id\""
.($xu2r_id == $u2r_id ? " selected" : "").
">$lname, $fname</option>";
}
}

else
{
$menu .= "<option value=0>-- choose an exam --</option>";
}

$menu =
"
<select id=\"esrs_menu\" class=\"esrs_menu\" name=\"esrs_$type"."[faculty]\">
<option value=0>select a facilitator</option>
$menu
</select>
";

return $menu;

}


public function m_get_rooms($dept="0",$type="")
{

$C = $this->p_session['campus'];
$D = $this->p_session['department'];

if ($D > 0) $dept = $D;

$sql =
"

select
distinct(r.room_id),
r.room_number,
r.room_name,
b.building,
ca.campus

from
departments `d`,
courses `c`,
exams `e`,
sessions `s`,
rooms `r`,
buildings `b`,
campuses `ca`

where s.room_id = r.room_id
  and s.exam_id = e.exam_id
  and e.crse_id = c.crse_id
  and c.dept_id = d.dept_id
  and r.buil_id = b.buil_id
  and b.camp_id = ca.camp_id
  and d.dept_id = $dept
  and r.disable_r = 0
  and b.disable_b = 0

order by ca.campus,b.building,r.room_number,r.room_name

";

//echo $sql;

$result = o_db::m_select($sql);

//echo $result;

switch ($type)
{

case 'find':
if (is_array($result) && (count($result) > 0))
return $result;
break;

default    :
if (is_array($result) && (count($result) > 20))
return $result;

if ($dept)
{

$sql =
"

select
distinct(r.room_id),
r.room_number,
r.room_name,
b.building,
c.campus

from
rooms `r`,
buildings `b`,
campuses `c`

where r.buil_id = b.buil_id
  and b.camp_id = c.camp_id
  and r.disable_r = 0
  and b.disable_b = 0

order by c.campus,b.building,r.room_number,r.room_name

";

$result = o_db::m_select($sql);

if (is_array($result))
return $result;

}

break;

}

return 0;

}


public function m_menu_rooms($dept_id,$room_id=0,$type="")
{

$rooms = self::m_get_rooms($dept_id,$type);

if (is_array($rooms))
{
foreach ($rooms as $room)
{
$xroom_id = $room['room_id'];
$campus = $room['campus'];
$building = $room['building'];
$roomnumb = $room['room_number'];
$roomname = $room['room_name'];

if (strlen($campus) > 15)
$campus = substr($campus,0,15)."..";

if (strlen($building) > 15)
$building = substr($building,0,15)."..";

if (strlen($roomname) > 15)
$roomname = substr($roomname,0,15)."...";

$menu .= "<option value=\"$xroom_id\""
.($xroom_id == $room_id ? " selected" : "").
">$building, "
.($roomnumb ? $roomnumb : $roomname).
"</option>";
}
}

else
{
$menu .= "<option value=0>-- choose a department --</option>";
}

$menu =
"
<select id=\"esrs_menu\" class=\"esrs_menu\" name=\"esrs_$type"."[room_id]\">
<option value=0>select a location</option>
$menu
</select>
";

return $menu;

}


public function m_get_exams($u2r=0,$role=1,$dept=0,$type="")
{

$C = $this->p_session['campus'];
$D = $this->p_session['department'];

if ($D > 0) $dept = $D;

switch ($role)
{

case 1:
$role_time = "and e.student_stop >= CURDATE()".($type=='find' ? " - INTERVAL 2 YEAR" : "");
$role_from  = "terms `t`,periods `p`,sections `s`,departments `d`,courses `c`,exams `e`,users2exams `u2e`";
$role_where = "";
break;

case 2:
$role_time = "and e.student_stop >= CURDATE()".($type=='find' ? " - INTERVAL 2 YEAR" : "");
$role_from  = "terms `t`,periods `p`,sections `s`,departments `d` left join users2departments `u2d` on (u2d.dept_id = d.dept_id),courses `c`,exams `e`,users2exams `u2e`";
$role_where = "and u2d.user2role_id = $u2r and u2d.disable_u2d = 0";
break;

case 3:
$role_time = "and e.student_stop >= CURDATE()".($type=='find' ? " - INTERVAL 2 YEAR" : "");
$role_from  = "terms `t`,periods `p`,sections `s`,departments `d`,courses `c` left join users2courses `u2c` on (u2c.crse_id = c.crse_id),exams `e`,users2exams `u2e`";
$role_where = "and u2c.user2role_id = $u2r and u2c.disable_u2c = 0";
break;

case 4:
$optional = "ss.disable_s = 0 and ss.hidden = 0 and ss.exam_id = e.exam_id and";
$role_time = "and e.facilitator_start <= CURDATE() and e.facilitator_stop >= CURDATE()";
$role_from  = "terms `t`,periods `p`,sections `s`,departments `d`,courses `c`,exams `e` left join users2exams `u2e` on (u2e.exam_id = e.exam_id)";
$role_where = "and u2e.user2role_id = $u2r and u2e.disable_u2e = 0";
break;

case 5:
$optional = "ss.disable_s = 0 and ss.hidden = 0 and ss.exam_id = e.exam_id and";
$role_time = "and e.student_start <= CURDATE() and e.student_stop >= CURDATE()";
$role_from  = "terms `t`,periods `p`,sections `s`,departments `d`,courses `c`,exams `e`,users2exams `u2e`";
$role_where = "";
break;

}


switch ($type)
{

case 'find':
$type_from  = ",sessions `ss`";
$type_where = "where $optional";
break;

default    :
$type_from  = "";
$type_where = "where";
break;

}

$sql =
"
select
distinct(e.exam_id),
c.crse_number,
c.course,
t.term_year,
p.period,
s.section

from

$role_from
$type_from

$type_where

    u2e.exam_id = e.exam_id

$role_time

  and e.term_id = t.term_id
  and t.peri_id = p.peri_id
  and t.sect_id = s.sect_id
  and e.crse_id = c.crse_id
  and c.dept_id = d.dept_id
  and d.dept_id = $dept
  and c.disable_c = 0
  and d.disable_d = 0
  and e.disable_e = 0

$role_where

order by c.course
";

//echo $sql;

$result = o_db::m_select($sql);

//echo $result;

if (is_array($result))
return $result;

return 0;

}


public function m_menu_exams($user_id=0,$role_id=1,$dept_id=0,$exam_id=0,$type="")
{

$u2r_id = $user_id.$role_id;

$exams = self::m_get_exams($u2r_id,$role_id,$dept_id,$type);

if (is_array($exams))
{
foreach ($exams as $exam)
{
$xexam_id = $exam['exam_id'];
$crsenumb = $exam['crse_number'];
$crsename = $exam['course'];
$section = $exam['section'];
$period = $exam['period'];
$year = $exam['term_year'];

$menu .= "<option value=\"$xexam_id\""
.($xexam_id == $exam_id ? " selected" : "").
">$crsenumb: $section, $period $year";

switch ($type)
{

case 'find':
$menu .=  " - $crsename";
break;

default    :
$menu .= (strlen($crsename) > 40 ? " - ".substr($crsename,0,40)."..." : " - ".$crsename);
break;

}

$menu .= "</option>";

}
}

else
{
$menu .= "<option value=0>-- choose a department --</option>";
}

switch ($type)
{

case 'find':
$select = "<select id=\"esrs_menu\" class=\"esrs_menu\" name=\"esrs_$type"."[exam_id]\">";
break;

default    :
$select = "<select id=\"esrs_menu\" class=\"esrs_menu\" name=\"esrs_$type"."[exam_id]\" onChange=\"esrs_set('esrs_".$type."','jump_menu',1);\"".($type=='edit' ? " disabled" : "").">";
break;

}

$menu =
"
$select
<option value=0>select an exam</option>
$menu
</select>
";

return $menu;

}


public function m_menu_dates($menu="",$month="00",$day="00",$year="0000",$time="00:00:00",$type="")
{

$months = array(
"01"=>array("Jan.","January",31),
"02"=>array("Feb.","February",29),
"03"=>array("Mar.","March",31),
"04"=>array("Apr.","April",30),
"05"=>array("May","May",31),
"06"=>array("Jun.","June",30),
"07"=>array("Jul.","July",31),
"08"=>array("Aug.","August",31),
"09"=>array("Sep.","September",30),
"10"=>array("Oct.","October",31),
"11"=>array("Nov.","November",30),
"12"=>array("Dec.","December",31)
);

$times = array(
1=>array("08:00:00","8:00 am"),
2=>array("08:30:00","8:30 am"),
3=>array("09:00:00","9:00 am"),
4=>array("09:30:00","9:30 am"),
5=>array("10:00:00","10:00 am"),
6=>array("10:30:00","10:30 am"),
7=>array("11:00:00","11:00 am"),
8=>array("11:30:00","11:30 am"),
9=>array("12:00:00","12:00 PM"),
10=>array("12:30:00","12:30 PM"),
11=>array("13:00:00","1:00 PM"),
12=>array("13:30:00","1:30 PM"),
13=>array("14:00:00","2:00 PM"),
14=>array("14:30:00","2:30 PM"),
15=>array("15:00:00","3:00 PM"),
16=>array("15:30:00","3:30 PM"),
17=>array("16:00:00","4:00 PM"),
18=>array("16:30:00","4:30 PM"),
19=>array("17:00:00","5:00 PM"),
20=>array("17:30:00","5:30 PM"),
21=>array("18:00:00","6:00 PM"),
22=>array("18:30:00","6:30 PM"),
23=>array("19:00:00","7:00 PM"),
24=>array("19:30:00","7:30 PM"),
25=>array("20:00:00","8:00 PM")
);

$this_month  = ($month ? $month : date("m"));
$this_day    = ($day ? $day : date("d"));
$this_year   = ($year ? $year : date("Y"));
$this_time   = ($time ? $time : "12:00:00");

for ($i=1;$i<=12;$i++)
{
$j = ($i < 10 ? "0$i" : $i);
$month_menu .=
"<option value=\"$j\""
.($j==$this_month ? " selected" : "")
.">".$months[$j][0]
."</option>";
}

$days_per_month =
$months[$this_month][2];

for ($i=1;$i<=$days_per_month;$i++)
{
$j = ($i < 10 ? "0$i" : $i);
$day_menu .=
"<option value=\"$j\""
.($j==$this_day ? " selected" : "")
.">$j</option>";
}

for ($i=$this_year;$i<($this_year+4);$i++)
{
$year_menu .=
"<option value=\"$i\""
.($i==$this_year ? " selected" : "")
.">$i</option>";
}

for ($i=1;$i<=25;$i++)
{
$time_menu .=
"<option value=\"".$times[$i][0]."\""
.($times[$i][0]==$this_time ? " selected" : "")
.">".$times[$i][1]."</option>";
}

$month_menu =
"
<select id=\"esrs_menu\" class=\"esrs_menu\" name=\"esrs_$type"."[".$menu."_month]\">
$month_menu
</select>
";

$day_menu =
"
<select id=\"esrs_menu\" class=\"esrs_menu\" name=\"esrs_$type"."[".$menu."_day]\">
$day_menu
</select>
";

$year_menu =
"
<select id=\"esrs_menu\" class=\"esrs_menu\" name=\"esrs_$type"."[".$menu."_year]\">
$year_menu
</select>
";

$time_menu =
"
<select id=\"esrs_menu\" class=\"esrs_menu\" name=\"esrs_$type"."[".$menu."_time]\">
$time_menu
</select>
";

$menu_array['m'] = $month_menu;
$menu_array['d'] = $day_menu;
$menu_array['y'] = $year_menu;
$menu_array['t'] = $time_menu;

return $menu_array;

}


public function m_filter_records($input=array(),$user=0,$role=5,$start,$limit)
{

$u2r = "$user$role";

$dept_id = $input['dept_id'];
$exam_id = $input['exam_id'];
$room_id = $input['room_id'];
$disable = $input['disable'];
$sesn_id = $input['sesn_id'];
$hidden = $input['hidden'];
$filled = $input['filled'];
$empty = $input['empty'];

$sort = $input['sortorder'];

$where_clause =
($dept_id > 0 ? "d.dept_id = $dept_id and " : "").
($exam_id > 0 ? "ss.exam_id = $exam_id and " : "").
($room_id > 0 ? "ss.room_id = $room_id and " : "").
($sesn_id > 0 ? "ss.sesn_id = $sesn_id and " : "").
($hidden > 0 ? "ss.hidden = 1 and " : ($role < 4 ? "ss.hidden = 0 and " : "")).
($filled > 0 ? "ss.registered > 0 and " : "").
($empty > 0 ? "ss.registered = 0 and " : "");

switch ($sort)
{
case "t_u":
$order_by = "ss.session_stop,ss.created_s";
break;
case "t_d":
$order_by = "ss.session_stop desc,ss.created_s desc";
break;
case "r_u":
$order_by = "ca.campus,b.building,r.room_number,r.room_name,ss.session_stop,ss.created_s";
break;
case "r_d":
$order_by = "ca.campus desc,b.building desc,r.room_number desc,r.room_name desc,ss.session_stop,ss.created_s";
break;
case "u_u":
$order_by = "(u2r.user2role_id > 0) desc,u.last_name,u.last_name,u.first_name,ss.session_stop,ss.created_s";
break;
case "u_d":
$order_by = "u.last_name desc,u.first_name desc,ss.session_stop,ss.created_s";
break;
default:
$order_by = "(u2r.user2role_id > 0) desc,u.last_name,ss.session_stop,ss.room_id";
break;
}

$sql =
"

select
distinct(ss.sesn_id) `ss_sesn_id`,
ss.session_start,
ss.session_stop,
ss.capacity,
ss.registered,
ss.disable_s,
ss.hidden,
r.room_number,
r.room_name,
b.building,
ca.campus,
t.term_year,
p.period,
s.section,
d.department,
c.crse_number,
c.course,
u2r.user2role_id,
u.first_name,
u.last_name,
sr.role_id,
sr.role

";

switch ($role)
{

case  1:

$this->sql_base .=
"

from
sessions `ss`
left join users2roles `u2r` on (u2r.user2role_id = ss.faculty)
left join users `u` on (u.user_id = u2r.user_id)
left join sys_roles `sr` on (sr.role_id = u2r.role_id),

users2exams `u2e`,

exams `e`,
departments `d`,
courses `c`,
terms `t`,
periods `p`,
sections `s`,
rooms `r`,
buildings `b`,
campuses `ca`

where $where_clause
      ss.session_stop >= CURDATE() - INTERVAL 2 YEAR

  and ss.exam_id = u2e.exam_id
  and ss.exam_id = e.exam_id
  and ss.room_id = r.room_id
  and r.buil_id = b.buil_id
  and b.camp_id = ca.camp_id
  and e.crse_id = c.crse_id
  and e.term_id = t.term_id
  and c.dept_id = d.dept_id
  and t.peri_id = p.peri_id
  and t.sect_id = s.sect_id

group by ss.sesn_id

";
break;

case  2:

$this->sql_base .=
"

from
sessions `ss`
left join users2roles `u2r` on (u2r.user2role_id = ss.faculty)
left join users `u` on (u.user_id = u2r.user_id)
left join sys_roles `sr` on (sr.role_id = u2r.role_id),

users2departments `u2d`,
users2exams `u2e`,

exams `e`,
departments `d`,
courses `c`,
terms `t`,
periods `p`,
sections `s`,
rooms `r`,
buildings `b`,
campuses `ca`

where $where_clause
      ss.session_stop >= CURDATE() - INTERVAL 2 YEAR

  and ss.exam_id = u2e.exam_id
  and ss.exam_id = e.exam_id
  and ss.room_id = r.room_id
  and e.crse_id = c.crse_id
  and e.term_id = t.term_id
  and t.peri_id = p.peri_id
  and t.sect_id = s.sect_id
  and c.dept_id = d.dept_id

  and d.dept_id = u2d.dept_id
  and u2d.user2role_id = $u2r

  and r.buil_id = b.buil_id
  and b.camp_id = ca.camp_id
  and b.disable_b = 0
  and r.disable_r = 0
  and t.disable_t = 0

group by ss.sesn_id

";
break;

case  3:

$this->sql_base .=
"

from
sessions `ss`
left join users2roles `u2r` on (u2r.user2role_id = ss.faculty)
left join users `u` on (u.user_id = u2r.user_id)
left join sys_roles `sr` on (sr.role_id = u2r.role_id),

users2courses `u2c`,
users2exams `u2e`,

exams `e`,
departments `d`,
courses `c`,
terms `t`,
periods `p`,
sections `s`,
rooms `r`,
buildings `b`,
campuses `ca`

where $where_clause
      ss.session_stop >= CURDATE() - INTERVAL 2 YEAR

  and ss.exam_id = u2e.exam_id
  and ss.exam_id = e.exam_id
  and ss.room_id = r.room_id
  and e.crse_id = c.crse_id

  and c.crse_id = u2c.crse_id
  and u2c.user2role_id = $u2r

  and e.term_id = t.term_id
  and t.peri_id = p.peri_id
  and t.sect_id = s.sect_id
  and c.dept_id = d.dept_id
  and r.buil_id = b.buil_id
  and b.camp_id = ca.camp_id
  and b.disable_b = 0
  and r.disable_r = 0
  and d.disable_d = 0
  and t.disable_t = 0

group by ss.sesn_id

";
break;

case  4:

$this->sql_base .=
"

from
sessions `ss`
left join users2roles `u2r` on (u2r.user2role_id = ss.faculty and u2r.disable_u2r = 0)
left join users `u` on (u.user_id = u2r.user_id)
left join sys_roles `sr` on (sr.role_id = u2r.role_id),

users2exams `u2e`,

exams `e`,
departments `d`,
courses `c`,
terms `t`,
periods `p`,
sections `s`,
rooms `r`,
buildings `b`,
campuses `ca`

where $where_clause
      e.facilitator_start <= CURDATE()
  and e.facilitator_stop >= CURDATE()

  and ss.exam_id = u2e.exam_id
  and u2e.user2role_id = $u2r

  and ss.exam_id = e.exam_id
  and ss.room_id = r.room_id

  and (ss.faculty = $u2r
    or ss.faculty = 0)

  and e.crse_id = c.crse_id
  and e.term_id = t.term_id
  and t.peri_id = p.peri_id
  and t.sect_id = s.sect_id
  and c.dept_id = d.dept_id
  and r.buil_id = b.buil_id
  and b.camp_id = ca.camp_id
  and u2e.disable_u2e = 0
  and b.disable_b = 0
  and r.disable_r = 0
  and c.disable_c = 0
  and d.disable_d = 0
  and t.disable_t = 0
  and e.disable_e = 0
  and ss.disable_s = 0

group by ss.sesn_id

";
$order_by = "(ss.faculty = $u2r) desc,".$order_by;
break;

case  5:

$sql .= ",u2s.user2role_id `session_u2r`";

$this->sql_base .=
"

from
sessions `ss`
left join users2sessions `u2s` on (u2s.sesn_id = ss.sesn_id and u2s.user2role_id = $u2r and u2s.disable_u2s = 0),

users2exams `u2e`,
users2roles `u2r`,
users `u`,
sys_roles `sr`,

exams `e`,
departments `d`,
courses `c`,
terms `t`,
periods `p`,
sections `s`,
rooms `r`,
buildings `b`,
campuses `ca`

where $where_clause
      e.student_start <= CURDATE()
  and e.student_stop >= CURDATE()
  and
      ss.exam_id = u2e.exam_id
  and u2e.user2role_id = ss.faculty

  and ss.faculty = u2r.user2role_id
  and u2r.user_id = u.user_id
  and u2r.role_id = sr.role_id

  and ss.exam_id = e.exam_id
  and ss.room_id = r.room_id
  and e.crse_id = c.crse_id
  and e.term_id = t.term_id
  and t.peri_id = p.peri_id
  and t.sect_id = s.sect_id
  and c.dept_id = d.dept_id
  and r.buil_id = b.buil_id
  and b.camp_id = ca.camp_id
  and u2r.disable_u2r = 0
  and u2e.disable_u2e = 0
  and u.disable_u = 0
  and b.disable_b = 0
  and r.disable_r = 0
  and c.disable_c = 0
  and d.disable_d = 0
  and t.disable_t = 0
  and e.disable_e = 0
  and ss.disable_s = 0
  and ss.hidden = 0

";
$order_by = "(u2s.user2role_id = $u2r) desc,".$order_by;
break;

}

$this->sql_base .= "order by $order_by";

$compound .=
"

$sql

$this->sql_base

limit $start, $limit

";

$this->sql_base = "from ( select distinct(ss.sesn_id) $this->sql_base ) `session_total`";

//echo $compound;

$result = o_db::m_select($compound);

//var_dump($result);
//echo $result;

if (is_array($result))
return $result;

return 0;

}


public function m_parse_records($records=array(),$insert=0,$update=0,$user=0,$role=1)
{

if (is_array($records))
{
foreach ($records as $record)
{
$ss_sesn_id      = $record['ss_sesn_id'];
$capacity        = $record['capacity'];
$registered      = $record['registered'];
$disable_s       = $record['disable_s'];
$hidden          = $record['hidden'];
$room_number     = $record['room_number'];
$room_name       = $record['room_name'];
$building        = $record['building'];
$campus          = $record['campus'];
$term_year       = $record['term_year'];
$period          = $record['period'];
$section         = $record['section'];
$department      = $record['department'];
$crse_number     = $record['crse_number'];
$course          = $record['course'];
$u2r             = $record['user2role_id'];
$session_u2r     = $record['session_u2r'];
$first_name      = $record['first_name'];
$last_name       = $record['last_name'];
$user_role       = $record['role'];

$a               = date_parse($record['session_start']);
$z               = date_parse($record['session_stop']);
$session_start   = strftime("%a., %D @ %I:%M %p",strtotime($record['session_start']));
$session_stop    = strftime(" - %I:%M %p",strtotime($record['session_stop']));

$abbr_course     = (strlen($course) > 15 ? substr($course,0,15)."..." : $course);
$abbr_department = (strlen($department) > 40 ? substr($department,0,40).".." : $department);
$abbr_room_name  = (strlen($room_name) > 15 ? substr($room_name,0,15)."..." : $room_name);
$abbr_building   = (strlen($building) > 15 ? substr($building,0,15).".." : $building);
$abbr_role       = (strlen($user_role) > 15 ? substr($user_role,0,15).".." : $user_role);

$location        = "$abbr_building, ".($room_number ? $room_number : $abbr_room_name);

$facilitator     = ($user_role ? "<font color=\"#0000ff\"><b>$first_name $last_name</b></font>" : "<span id=\"esrs_fail\" class=\"esrs_fail\">PENDING</span>");

$registered_text      =
(!$registered
 ? "<span id=\"esrs_pass\" class=\"esrs_pass\">empty</span>"
 : ($registered >= $capacity
    ? "<span id=\"esrs_fail\" class=\"esrs_fail\">FULL</span>"
    : "<b>$registered</b>"
));

++$i;
$row =
($insert==$ss_sesn_id
 ? "esrs_row_add"
 : (($update==$ss_sesn_id) ||
    ("$user$role" == $session_u2r) ||
    ("$user$role" == $u2r)
    ? "esrs_row_edit"
    : (($i % 2) > 0
       ? "esrs_row_1"
       : "esrs_row_2")));

// enable base64 = manage_users=1&enable=1; disable base64 = manage_users=1&disable=1
$toggle_disable =
(ord($disable_s) > 0
 ? "(<a id=\"esrs_toggle_on\" class=\"esrs_toggle_on\" href=\"javascript:\" onClick=\"esrs_set('esrs_find','enable_s','".$ss_sesn_id."');\">enable</a>)"
 : "(<a id=\"esrs_toggle_off\" class=\"esrs_toggle_off\" href=\"javascript:\" onClick=\"esrs_set('esrs_find','disable_s','".$ss_sesn_id."');\">disable</a>)"
);

$toggle_hidden =
(ord($hidden) > 0
 ? "(<a id=\"esrs_toggle_on\" class=\"esrs_toggle_on\" href=\"javascript:\" onClick=\"esrs_set('esrs_find','show','".$ss_sesn_id."');\">show</a>)"
 : "(<a id=\"esrs_toggle_off\" class=\"esrs_toggle_off\" href=\"javascript:\" onClick=\"esrs_set('esrs_find','hide','".$ss_sesn_id."');\">hide</a>)"
);

$ajax_file = "http://".$records[0]['host_url']."/";

$roster_link = ($registered > 0 ? "<b>(<a href=\"javascript:\" onClick=\"esrs_ajax('".$ajax_file."','".o_query::m_encode_q("roster=$ss_sesn_id")."','".$ss_sesn_id."');\">ROSTER</a>)</b>" : "");

//echo "$user$role / $u2r / $sesn_id / $u2e_sesn_id <br>";

$rsvp_link =
(("$user$role" == $session_u2r) || ("$user$role" == $u2r)
 ? "<font color=\"#0000ff\"><b>REGISTERED</b></font>"
 : ($registered >= $capacity
    ? "<span id=\"esrs_fail\" class=\"esrs_fail\">CLOSED</span>"
    : "<b>(<a id=\"esrs_toggle_on\" class=\"esrs_toggle_on\" href=\"javascript:\" onClick=\"if(confirm('Click OK to confirm your registration for session:\\n\\n"."   $crse_number: $section, $period $term_year\\n   located at $location\\n   on $session_start $session_stop\\n\\n"."'))esrs_set('esrs_find','rsvp','".$ss_sesn_id."');\">REGISTER</a>)</b>"
));


switch ($role)
{

case  4:

$record_list .=
"
<tr>
<td id=\"$row\" class=\"$row\">$crse_number</td>
<td id=\"$row\" class=\"$row\">$location</td>
<td id=\"$row\" class=\"$row\">$capacity</td>
<td id=\"$row\" class=\"$row\" width=95>$registered_text &nbsp;$roster_link</td>
<td id=\"$row\" class=\"$row\" width=125>$facilitator</td>
<td id=\"$row\" class=\"$row\" width=225>$session_start $session_stop</td>
<td id=\"$row\" class=\"$row\">$rsvp_link</td>
<td id=\"$row\" class=\"$row\" width=1>$toggle_hidden</td>
</tr>
"
.($registered > 0 ? "<tr><td colspan=10 id=\"$ss_sesn_id\"></td></tr>" : "");
break;

case  5:

$record_list .=
"
<tr>
<td id=\"$row\" class=\"$row\">$crse_number</td>
<td id=\"$row\" class=\"$row\">$location</td>
<td id=\"$row\" class=\"$row\">$capacity</td>
<td id=\"$row\" class=\"$row\" width=95>$registered_text &nbsp;$roster_link</td>
<td id=\"$row\" class=\"$row\" width=125>$facilitator</td>
<td id=\"$row\" class=\"$row\" width=225>$session_start $session_stop</td>
<td id=\"$row\" class=\"$row\">$rsvp_link</td>
<td id=\"$row\" class=\"$row\" width=1>&nbsp;</td>
</tr>
"
.($registered > 0 ? "<tr><td colspan=10 id=\"$ss_sesn_id\"></td></tr>" : "");
break;

default:

$record_list .=
"
<tr>
<td id=\"$row\" class=\"$row\" width=40><a href=\"javascript:\" onClick=\"esrs_set('esrs_find','edit_id','".$ss_sesn_id."')\">edit</a></td>
<td id=\"$row\" class=\"$row\">$crse_number</td>
<td id=\"$row\" class=\"$row\">$location</td>
<td id=\"$row\" class=\"$row\">$capacity</td>
<td id=\"$row\" class=\"$row\" width=95>$registered_text &nbsp;$roster_link</td>
<td id=\"$row\" class=\"$row\" width=124>$facilitator</td>
<td id=\"$row\" class=\"$row\" width=200>$session_start $session_stop</td>
<td id=\"$row\" class=\"$row\" width=1>$toggle_hidden</td>
</tr>
"
.($registered > 0 ? "<tr><td colspan=10 id=\"$ss_sesn_id\"></td></tr>" : "");
break;

}

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


public function m_get_departments($u2r=0,$role=1,$type="")
{

$C = $this->p_session['campus'];
$D = $this->p_session['department'];

switch ($type)
{

case 'find':
$type_from  = ",sessions `s`";
$type_where = "where s.exam_id = e.exam_id and s.disable_s = 0 and s.hidden = 0 and";
break;

default    :
$type_from  = "";
$type_where = "where";
break;

}

switch ($role)
{

case 1:
$role_time = "and e.student_stop >= CURDATE()".($type=='find' ? " - INTERVAL 2 YEAR" : "");
$role_from  = "departments `d`,courses `c`,exams `e`,users2exams `u2e`";
$role_where = "";
break;

case 2:
$role_time = "and e.student_stop >= CURDATE()".($type=='find' ? " - INTERVAL 2 YEAR" : "");
$role_from  = "departments `d` left join users2departments `u2d` on (u2d.dept_id = d.dept_id),courses `c`,exams `e`,users2exams `u2e`";
$role_where = "and u2d.user2role_id = $u2r and u2d.disable_u2d = 0";
break;

case 3:
$role_time = "and e.student_stop >= CURDATE()".($type=='find' ? " - INTERVAL 2 YEAR" : "");
$role_from  = "departments `d`,courses `c` left join users2courses `u2c` on (u2c.crse_id = c.crse_id),exams `e`,users2exams `u2e`";
$role_where = "and u2c.user2role_id = $u2r and u2c.disable_u2c = 0";
break;

case 4:
$role_time = "and e.facilitator_stop >= CURDATE()";
$role_from  = "departments `d`,courses `c`,exams `e` left join users2exams `u2e` on (u2e.exam_id = e.exam_id)";
$role_where = "and u2e.user2role_id = $u2r and u2e.disable_u2e = 0";
$type_where = "where s.disable_s = 0 and";
break;

case 5:
$role_time = "and e.student_start <= CURDATE() and e.student_stop >= CURDATE()";
$role_from  = "departments `d`,courses `c`,exams `e`,users2exams `u2e`";
$role_where = "and u2e.exam_id = s.exam_id and s.faculty > 0";
$type_where = "where s.disable_s = 0 and s.hidden = 0 and";
break;

}

$sql =
"
select
distinct(d.dept_id),
d.department

from

$role_from
$type_from

$type_where

    u2e.exam_id = e.exam_id

$role_time

  and e.crse_id = c.crse_id
  and c.dept_id = d.dept_id
"
.($D > 0 ? "and d.dept_id = $D" : "").
"
  and c.disable_c = 0
  and d.disable_d = 0
  and e.disable_e = 0

$role_where

order by d.department
";

//echo $sql;

$result = o_db::m_select($sql);

//echo $result;

if (is_array($result))
return $result;

return 0;

}


public function m_menu_departments($user_id=0,$role_id=0,$dept_id=0,$type="")
{

$C = $this->p_session['campus'];
$D = $this->p_session['department'];

$u2r_id = $user_id.$role_id;

$departments = self::m_get_departments($u2r_id,$role_id,$type);

if (is_array($departments))
{
foreach ($departments as $department)
{
$xdept_id = $department['dept_id'];
$deptname = $department['department'];
$menu .= "<option value=\"$xdept_id\""
.($xdept_id == $D
  ? " selected"
  : ($xdept_id == $dept_id
     ? " selected"
     : "")).">"
.(strlen($deptname) > 30
  ? substr($deptname,0,30)."..."
  : $deptname)
."</option>";
}
}

else
{
$menu .= "<option value=0>-- none available --</option>";
}

$menu =
"
<select id=\"esrs_menu\" class=\"esrs_menu\" name=\"esrs_$type"."[dept_id]\" onChange=\"esrs_set('esrs_".$type."','jump_menu',1);\"".($type=='edit' ? " disabled" : "").">
<option value=0>select a department</option>
$menu
</select>
";

return $menu;

}


public function m_test_input($input=array(),$type="")
{

$dept_id = $input['dept_id'];
$exam_id = $input['exam_id'];
$room_id = $input['room_id'];
$capacity = $input['capacity'];

$sa_month = $input['a_month'];
$sa_year = $input['a_year'];
$sa_day = $input['a_day'];
$sa_time = $input['a_time'];

$sz_time = $input['z_time'];

$session_start_time =
strtotime($sa_time);

$session_stop_time =
strtotime($sz_time);

$sql = "select student_stop from exams where exam_id = $exam_id";
$result = o_db::m_select($sql);

if (is_array($result))
$student_stop =
strtotime($result[0]['student_stop']);

$session_date =
strtotime("$sa_month/$sa_day/$sa_year");

if ($type == 'add')
{

if (!$dept_id)
return "You have not made a 'Department' selection.";

if (!$exam_id)
return "You have not selected an 'Exam Course/Term'.";

}

if (!$room_id)
return "You have not selected a 'Campus Building/Room'.";

if (!$capacity)
return "You have not entered a 'Room Capacity'.";

if (!$sa_month)
return "You have not selected a 'Session Date' MONTH.";

if (!$sa_year)
return "You have not selected a 'Session Date' YEAR.";

if (!$sa_day)
return "You have not selected a 'Session Date' DAY.";

if (!$sa_time)
return "You have not selected a 'Session Duration' START TIME.";

if (!$sz_time)
return "You have not selected a 'Session Duration' STOP TIME.";

if (($student_stop - 100000) >= $session_date)
return "You cannot schedule a 'Session Date' before the student signup period expires!";

if ($session_stop_time <= $session_start_time)
return "The 'Session Duration' STOP TIME is less than or equal to the START TIME!";

}


public function m_format_input($input=array())
{

$sa_month = $input['a_month'];
$sa_year = $input['a_year'];
$sa_time = $input['a_time'];
$sa_day = $input['a_day'];

$sz_time = $input['z_time'];

$input['session_start'] =
$sa_year."-".$sa_month."-".$sa_day." ".$sa_time;

$input['session_stop'] =
$sa_year."-".$sa_month."-".$sa_day." ".$sz_time;

while (list($key,$value) = each($input))
$input[$key] = o_db::m_db_escape($value);

return $input;

}


public function m_save_record($input=array())
{

$exam_id = $input['exam_id'];
$room_id = $input['room_id'];
$capacity = $input['capacity'];
$s_start = $input['session_start'];
$s_stop = $input['session_stop'];

$sql =
"
insert into sessions (`exam_id`,`room_id`,`capacity`,`session_start`,`session_stop`)
              values ( $exam_id,$room_id,$capacity,\"$s_start\",\"$s_stop\" )
";
$result = o_db::m_insert($sql);

return $result;

}


public function m_edit_record($input=array())
{

$sesn_id   = $input['edit_id'];

$exam_id   = $input['exam_id'];
$room_id   = $input['room_id'];
$capacity  = $input['capacity'];
$s_start   = $input['session_start'];
$s_stop    = $input['session_stop'];
$faculty   = $input['faculty'];

$sql =
"
update sessions
set room_id = $room_id,
    capacity = $capacity,
    session_start = \"$s_start\",
    session_stop = \"$s_stop\",
    faculty = $faculty
where sesn_id = $sesn_id
";
$result = o_db::m_update($sql);

//echo $sql;
//echo $result;

if ($result == 0) return 0;

return $sesn_id;

}


public function m_disable_session($sesn=0)
{

$sql =
"

select u2s.user2role_id,ss.sesn_id
from users2roles `u2r`,users2sessions `u2s`,sessions `ss`
where u2r.role_id = 5
  and u2r.user2role_id = u2s.user2role_id
  and u2s.sesn_id = ss.sesn_id
  and u2s.sesn_id = $sesn
  and u2s.sesn_id > 0

";

$result = o_db::m_select($sql);
if (is_array($result))
return 1;

$sql = "update sessions set disable_s = 1 where sesn_id = $sesn";
if ($result = o_db::m_update($sql))
return 0;

return 1;


}


public function m_enable_session($sesn=0)
{

$sql = "update sessions set disable_s = 0 where sesn_id = $sesn";
if ($result = o_db::m_update($sql))
return 0;

return 1;

}


public function m_hide_session($sesn=0)
{

$sql =
"

select u2s.user2role_id,ss.sesn_id
from users2roles `u2r`,users2sessions `u2s`,sessions `ss`
where u2r.role_id = 5
  and u2r.user2role_id = u2s.user2role_id
  and u2s.sesn_id = ss.sesn_id
  and u2s.sesn_id = $sesn
  and u2s.sesn_id > 0

";

$result = o_db::m_select($sql);
if (is_array($result))
return 1;

$sql = "update sessions set hidden = 1 where sesn_id = $sesn";
if ($result = o_db::m_update($sql))
return 0;

return 1;

}


public function m_show_session($sesn=0)
{

$sql = "update sessions set hidden = 0 where sesn_id = $sesn";
if ($result = o_db::m_update($sql))
return 1;

return 0;

}


public function m_get_one_record($sesn_id=0)
{

$sql =
"
select *
from sessions
where sesn_id = $sesn_id
";
$result = o_db::m_select($sql);

if (is_array($result))
{

$start    = $result[0]['session_start'];
$stop     = $result[0]['session_stop'];

$a_start  = split("[ \-]",$start);
$a_stop   = split("[ \-]",$stop);

$result[0]['a_year']  = $a_start[0];
$result[0]['a_month'] = $a_start[1];
$result[0]['a_day']   = $a_start[2];
$result[0]['a_time']  = $a_start[3];

$result[0]['z_year']  = $a_stop[0];
$result[0]['z_month'] = $a_stop[1];
$result[0]['z_day']   = $a_stop[2];
$result[0]['z_time']  = $a_stop[3];

return $result[0];

}

return 0;

}


public function m_get_roster($role=1,$sesn=0)
{

$sql =
"

select
distinct(u2s.user2sesn_id),
u2s.user2role_id,
u2s.created_u2s,
u2s.disable_u2s,
u.email_address,
u.first_name,
u.last_name,
u.campus_id,
sr.role_id,
sr.role

from
users2sessions `u2s`,
users2roles `u2r`,
sessions `ss`,
users `u`,
sys_roles `sr`

where ss.sesn_id = $sesn
  and ss.sesn_id = u2s.sesn_id
  and u2s.user2role_id = u2r.user2role_id
  and u2r.user_id = u.user_id
  and u2r.role_id = sr.role_id

"
.($role > 4
 ? "and u2s.disable_u2s = 0 and u2r.disable_u2r = 0 and u.disable_u = 0"
 : "and u2r.disable_u2r = 0 and u.disable_u = 0").
"

order by sr.role_id,u.last_name,u.first_name,u.campus_id

";

//echo $sql;

$result = o_db::m_select($sql);

//echo $result;

if (is_array($result))
return $result;

return 0;

}


function m_parse_roster($role=1,$sesn=0)
{

$records = self::m_get_roster($role,$sesn);

if (is_array($records))
{
foreach ($records as $record)
{
$u2r_id = $record['user2role_id'];
$u2s_id = $record['user2sesn_id'];
$email_address = $record['email_address'];
$first_name = $record['first_name'];
$last_name = $record['last_name'];
$campus_id = $record['campus_id'];
$sesn_role = $record['role'];
$sesn_role_id = $record['role_id'];
$created = $record['created_u2s'];
$disable_u2s = $record['disable_u2s'];

++$i;
$row =
(($i % 2) > 0
 ? "esrs_row_1"
 : "esrs_row_2");

$toggle_disable =
(ord($disable_u2s) > 0
 ? "(<a id=\"esrs_toggle_on\" class=\"esrs_toggle_on\" href=\"javascript:\" onClick=\"esrs_set('esrs_find','enable_u2s','".$u2s_id."');\">enable</a>)"
 : "(<a id=\"esrs_toggle_off\" class=\"esrs_toggle_off\" href=\"javascript:\" onClick=\"esrs_set('esrs_find','disable_u2s','".$u2s_id."');\">disable</a>)"
);

if ($role < 5)
$roster .=
"
<tr>
<td id=\"$row\" class=\"$row\">&nbsp;</td>
<td id=\"$row\" class=\"$row\" width=95>$campus_id</td>
<td id=\"$row\" class=\"$row\" width=125>$last_name, $first_name</td>
<td id=\"$row\" class=\"$row\" width=185>$created</td>
<td id=\"$row\" class=\"$row\" width=1>$toggle_disable</td>
</tr>
";

else
$roster .=
"
<tr>
<td id=\"$row\" class=\"$row\">$sesn_role</td>
<td id=\"$row\" class=\"$row\" width=125>$last_name, $first_name</td>
<td id=\"$row\" class=\"$row\" width=225>$created</td>
</tr>
";
}
}

else
{
$roster .= "<tr><td id=\"esrs_row_1\" class=\"esrs_row_1\" colspan=10 align=center>-- no attendees --</td>";
}

$roster =
"
<div id=\"esrs_roster\" class=\"esrs_roster\">

<table width=\"100%\" border=0 cellpadding=3 cellspacing=0>
<tr>
".
($role_id < 5 ?
"
<td id=\"esrs_label\" class=\"esrs_label\">&nbsp;</td>
<td id=\"esrs_label\" class=\"esrs_label\">Campus ID</td>
<td id=\"esrs_label\" class=\"esrs_label\">Last Name, First</td>
<td id=\"esrs_label\" class=\"esrs_label\">Date Created</td>
<td id=\"esrs_label\" class=\"esrs_label\">&nbsp;</td>
" :
"
<td id=\"esrs_label\" class=\"esrs_label\" width=150>User Role</td>
<td id=\"esrs_label\" class=\"esrs_label\" width=150>Last Name, First</td>
<td id=\"esrs_label\" class=\"esrs_label\">&nbsp;</td>
").
"
</tr>

$roster

<tr><td colspan=10>&nbsp;</td></tr>
</table>
";

return $roster;

}


public function m_disable_user($u2s_id=0)
{

$sql = "select sesn_id from users2sessions where user2sesn_id = $u2s_id";
$result = o_db::m_select($sql);

if (!is_array($result))
return 0;

$session = $result[0]['sesn_id'];

$sql = "update users2sessions set disable_u2s = 1 where user2sesn_id = $u2s_id and disable_u2s = 0";
$result = o_db::m_update($sql);

if ($result == 0) return 0;

$sql = "update sessions set registered = registered - 1 where sesn_id = $session";
if ($result = o_db::m_update($sql))
return $session;

return 0;

}


public function m_enable_user($u2s_id=0)
{

$sql = "select sesn_id from users2sessions where user2sesn_id = $u2s_id";
$result = o_db::m_select($sql);

if (!is_array($result))
return 0;

$session = $result[0]['sesn_id'];

$sql = "update users2sessions set disable_u2s = 0 where user2sesn_id = $u2s_id and disable_u2s = 1";
$result = o_db::m_update($sql);

if ($result == 0) return 0;

$sql = "update sessions set registered = registered + 1 where sesn_id = $session";
if ($result = o_db::m_update($sql))
return $session;

return 0;

}

}