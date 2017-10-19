<?php

class o_exam
{

////////////
public function m_test_input($input=array(),$type="")
{

$dept_id = $input['dept_id'];
$crse_id = $input['crse_id'];
$term_id = $input['term_id'];

$fa_m = $input['a_month'];
$fa_y = $input['b_year'];
$fa_d = $input['a_day'];

$fb_m = $input['b_month'];
$fb_y = $input['b_year'];
$fb_d = $input['b_day'];

$sy_m = $input['y_month'];
$sy_y = $input['z_year'];
$sy_d = $input['y_day'];

$sz_m = $input['z_month'];
$sz_y = $input['z_year'];
$sz_d = $input['z_day'];

$facilitator_start =
strtotime("$fa_m/$fa_d/$fa_y");

$facilitator_stop =
strtotime("$fb_m/$fb_d/$fb_y");

$student_start =
strtotime("$sy_m/$sy_d/$sy_y");

$student_stop =
strtotime("$sz_m/$sz_d/$sz_y");

$right_now =
strtotime(date("m")."/".date("d")."/".date("Y"));

$facilitators = $input['facilitators'];

if ($type == 'add')
{

if (!$dept_id)
return "You have not made a 'Department' selection.";

if (!$crse_id)
return "You have not made a 'Course' selection.";

if (!$term_id)
return "You have not made a 'Course Term' selection.";

}

if (!$fa_m)
return "The 'Facilitator Signup Period' is missing a START MONTH.";

if (!$fa_y)
return "The 'Facilitator Signup Period' is missing a START YEAR.";

if (!$fa_d)
return "The 'Facilitator Signup Period' is missing a START DAY.";

if (!$fb_m)
return "The 'Facilitator Signup Period' is missing a STOP MONTH.";

if (!$fb_y)
return "The 'Facilitator Signup Period' is missing a STOP YEAR.";

if (!$fb_d)
return "The 'Facilitator Signup Period' is missing a STOP DAY.";

if (!$sy_m)
return "The 'Student Signup Period' is missing a START MONTH.";

if (!$sy_y)
return "The 'Student Signup Period' is missing a START YEAR.";

if (!$sy_d)
return "The 'Student Signup Period' is missing a START DAY.";

if (!$sz_m)
return "The 'Student Signup Period' is missing a STOP MONTH.";

if (!$sz_y)
return "The 'Student Signup Period' is missing a STOP YEAR.";

if (!$sz_d)
return "The 'Student Signup Period' is missing a STOP DAY.";

if (!is_array($facilitators))
return "You have not selected any facilitators for this exam.";

if (count($facilitators) == 0)
return "You have not selected any facilitators for this exam.";

if ($facilitator_start >= $facilitator_stop)
return "The 'Facilitator Signup Period' START DATE is equal to or greater than the STOP DATE!";

if ($student_start >= $student_stop)
return "The 'Student Signup Period' START DATE is equal to or greater than the STOP DATE!";

if ($facilitator_start >= $student_start)
return "The 'Student Signup Period' START DATE must be at least one day greater than the 'Facilitator Signup Period' START DATE!";

if ($facilitator_stop > $student_stop)
return "The 'Student Signup Period' STOP DATE must be greater than or equal to the 'Facilitator Signup Period' STOP DATE!";

if ($type=='add')
{

if ($right_now > $facilitator_stop ||
    $right_now > $student_stop)
return "You are attempting to add a 'Facilitator Signup Period' and/or 'Student Signup Period' that is earlier than RIGHT NOW!";

}

}


/////////////////////
public function m_format_input($input=array(),$type="")
{

switch ($type)
{

default:

$input['exam_type'] = ($input['exam_type'] > 0 ? "1" : "0");

$input['facilitator_start'] =
$input['b_year']."-".$input['a_month']."-".$input['a_day'];

$input['facilitator_stop'] =
$input['b_year']."-".$input['b_month']."-".$input['b_day'];

$input['student_start'] =
$input['z_year']."-".$input['y_month']."-".$input['y_day'];

$input['student_stop'] =
$input['z_year']."-".$input['z_month']."-".$input['z_day'];

break;

}

return $input;

}


//////////////////
public function m_save_record($input=array())
{

$dept_id = $input['dept_id'];
$crse_id = $input['crse_id'];
$term_id = $input['term_id'];

$exam_type = $input['exam_type'];

$facilitator_start = $input['facilitator_start'];
$facilitator_stop = $input['facilitator_stop'];
$student_start = $input['student_start'];
$student_stop = $input['student_stop'];

$facilitators = $input['facilitators'];

$exam_id = "$term_id$crse_id";

$sql =
"
insert into exams (`exam_id`,`term_id`,`crse_id`,`facilitator_start`,`facilitator_stop`,`student_start`,`student_stop`,`exam_type`)
           values ($exam_id,$term_id,$crse_id,\"$facilitator_start\",\"$facilitator_stop\",\"$student_start\",\"$student_stop\",\"$exam_type\")
";

$result = o_db::m_insert($sql);

if (!$result || !is_int($result))
return $result;

foreach ($facilitators as $facilitator)
{

$u2e_id = "$facilitator$exam_id";

$sql =
"
insert into users2exams (`user2exam_id`,`user2role_id`,`exam_id`)
                 values ($u2e_id,$facilitator,$exam_id)
";

$result = o_db::m_insert($sql);

if (!$result || !is_int($result))
return $result;

}

return $exam_id;

}


//////////////////
public function m_edit_record($input=array())
{

$edit_id = $input['edit_id'];

$exam_type = $input['exam_type'];

$facilitator_start = $input['facilitator_start'];
$facilitator_stop = $input['facilitator_stop'];
$student_start = $input['student_start'];
$student_stop = $input['student_stop'];

$facilitators = $input['facilitators'];

$sql =
"
update exams
set facilitator_start = \"$facilitator_start\",
    facilitator_stop = \"$facilitator_stop\",
    student_start = \"$student_start\",
    student_stop = \"$student_stop\",
    exam_type = $exam_type
where exam_id = $edit_id
";

$result = o_db::m_update($sql);

if (!$result || !is_int($result))
return $result;

foreach ($facilitators as $facilitator)
{

$u2e_id = "$facilitator$edit_id";

$sql =
"
insert into users2exams (`user2exam_id`,`user2role_id`,`exam_id`)
                 values ($u2e_id,$facilitator,$edit_id)
";

$result = o_db::m_insert($sql);

}

return $edit_id;

}


////////////////////////
public function m_get_departments($u2r=0,$role=1,$type="")
{



switch ($role)
{

case 1:
$role_from  = "departments `d`,courses `c`";
$role_where = "";
break;

case 2:
$role_from  = "departments `d` left join users2departments `u2d` on (u2d.dept_id = d.dept_id),courses `c`";
$role_where = "and u2d.user2role_id = $u2r and u2d.disable_u2d = 0";
break;

case 3:
$role_from  = "departments `d`,courses `c` left join users2courses `u2c` on (u2c.crse_id = c.crse_id)";
$role_where = "and u2c.user2role_id = $u2r and u2c.disable_u2c = 0";
break;

case 4:
$role_from  = "departments `d`,exams `e` left join users2exams `u2e` on (u2e.exam_id = e.exam_id),courses `c`";
$role_where = "and u2e.user2role_id = $u2r and u2e.disable_u2e = 0";
break;

case 5:
$role_from  = "departments `d`,courses `c`";
$role_where = "";
break;

}

switch ($type)
{

case 'find':
$type_from  = "left join exams `e` on (e.crse_id = c.crse_id)";
$type_where = "where e.student_stop >= CURDATE() - interval 2 year and e.crse_id = c.crse_id and";
break;

default    :
$type_from  = "";
$type_where = "where";
break;

}

$sql =
"
select
distinct(d.dept_id),
d.dept_number,
d.department

from

$role_from
$type_from

$type_where

      c.dept_id = d.dept_id
  and d.disable_d = 0
  and c.disable_c = 0

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


public function m_menu_departments($user_id=0,$role_id=1,$dept_id=0,$type="")
{

$u2r_id = $user_id.$role_id;

$departments = self::m_get_departments($u2r_id,$role_id,$type);

if (is_array($departments))
{
foreach ($departments as $department)
{
$xdept_id = $department['dept_id'];
$deptname = $department['department'];
$menu .= "<option value=\"$xdept_id\""
.($xdept_id == $dept_id ? " selected" : "").">"
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


/////////////////
public function m_get_courses($u2r=0,$role=1,$dept=0,$type="")
{


if ($dept)
{


switch ($role)
{

case 1:
$role_from  = "departments `d`,courses `c`";
$role_where = "";
break;

case 2:
$role_from  = "departments `d` left join users2departments `u2d` on (u2d.dept_id = d.dept_id),courses `c`";
$role_where = "and u2d.user2role_id = $u2r and u2d.disable_u2d = 0";
break;

case 3:
$role_from  = "departments `d`,courses `c` left join users2courses `u2c` on (u2c.crse_id = c.crse_id)";
$role_where = "and u2c.user2role_id = $u2r and u2c.disable_u2c = 0";
break;

case 4:
$role_from  = "departments `d`,exams `e` left join users2exams `u2e` on (u2e.exam_id = e.exam_id),courses `c`";
$role_where = "and u2e.user2role_id = $u2r and u2e.disable_u2e = 0";
break;

case 5:
$role_from  = "departments `d`,courses `c`";
$role_where = "";
break;

}

switch ($type)
{

case 'find':
$type_from  = "left join exams `e` on (e.crse_id = c.crse_id)";
$type_where = "where e.student_stop >= CURDATE() - interval 2 year and e.crse_id = c.crse_id and";
break;

default    :
$type_from  = "";
$type_where = "where";
break;

}

$sql =
"
select
distinct(c.crse_id),
c.crse_number,
c.course

from

$role_from
$type_from

$type_where

      c.dept_id = d.dept_id
  and d.dept_id = $dept
  and d.disable_d = 0
  and c.disable_c = 0

$role_where

order by c.course
";

//echo $sql;

$result = o_db::m_select($sql);

//echo $result;

if (is_array($result))
return $result;

}

return 0;

}


public function m_menu_courses($user_id=0,$role_id=1,$dept_id=0,$crse_id=0,$type="")
{

$u2r_id = $user_id.$role_id;

$courses = self::m_get_courses($u2r_id,$role_id,$dept_id,$type);

if (is_array($courses))
{
foreach ($courses as $course)
{
$xcrse_id = $course['crse_id'];
$crsenumb = $course['crse_number'];
$crsename = $course['course'];
$menu .= "<option value=\"$xcrse_id\""
.($xcrse_id == $crse_id ? " selected" : "").">"
.(strlen($crsename) > 50
  ? "$crsenumb: ".substr($crsename,0,50)."..."
  : "$crsenumb: $crsename")
."</option>";
}
}

else
{
$menu .= "<option value=0>-- choose a department --</option>";
}

$menu =
"
<select id=\"esrs_menu\" class=\"esrs_menu\" name=\"esrs_$type"."[crse_id]\"".($type=='edit' ? " disabled" : "").">
<option value=0>select a course</option>
$menu
</select>
";

return $menu;

}


public function m_get_terms($term="0")
{

$year = date("Y");

$sql =
"
select
t.term_id,
t.peri_id,
t.sect_id,
t.term_year,
t.default_t,
p.period,
s.section
from terms `t`,periods `p`,sections `s`
where (t.term_year >= $year
"
.($term > 0 ? "or t.term_id = $term)" : ")").
"
  and t.peri_id = p.peri_id
  and t.sect_id = s.sect_id
  and t.disable_t = 0
order by t.term_year desc,p.peri_id desc,s.sect_id desc";
$result = o_db::m_select($sql);

if (is_array($result))
return $result;

return 0;

}


public function m_menu_terms($term_id=0,$type="")
{

$terms = self::m_get_terms($term_id);

if (is_array($terms))
{
foreach ($terms as $term)
{
$xterm_id = $term['term_id'];
$period = $term['period'];
$section = $term['section'];
$term_year = $term['term_year'];
$default = $term['default_t'];

$menu .= "<option value=\"$xterm_id\""
.($xterm_id == $term_id ? " selected" : "")
.">$section, $period $term_year</option>";
}
}

else
{
$menu .= "<option value=\"\">-- none available --</option>";
}

$menu =
"
<select id=\"esrs_menu\" class=\"esrs_menu\" name=\"esrs_$type"."[term_id]\"".($type=='edit' ? " disabled" : "").">
<option value=0>select a term</option>
$menu
</select>
";

return $menu;

}


////////////////////
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

for ($i=date("Y");$i<($this_year+4);$i++)
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


//////////////////////
public function m_get_facilitators($dept_id=0)
{

$sql =
"
select
distinct(u2r.user2role_id),
u.first_name,
u.last_name

from
departments `d`,
courses `c`,
exams `e`,
users2exams `u2e`,
users2roles `u2r`,
users `u`

where d.dept_id = $dept_id
  and d.dept_id = c.dept_id
  and c.crse_id = e.crse_id
  and e.exam_id = u2e.exam_id
  and u2e.user2role_id = u2r.user2role_id
  and u2r.role_id = 4
  and u2r.disable_u2r = 0
  and u2r.user_id = u.user_id
  and u.disable_u = 0
order by u.last_name,u.first_name
";
$result = o_db::m_select($sql);

if (!is_array($result) ||
   (count($result) < 50))
{

$sql =
"
select
distinct(u2r.user2role_id),
u.first_name,
u.last_name

from
users2roles `u2r`,
users `u`

where u2r.role_id = 4
  and u2r.disable_u2r = 0
  and u2r.user_id = u.user_id
  and u.disable_u = 0
order by u.last_name,u.first_name
";

$result = o_db::m_select($sql);

}

if (is_array($result))
return $result;

return 0;

}


public function m_menu_facilitators($dept_id=0,$facilitators=array(),$type="")
{

$users = self::m_get_facilitators($dept_id);

if (is_array($users))
{
foreach ($users as $user)
{

$lname = $user['last_name'];
$fname = $user['first_name'];
$u2r_id = $user['user2role_id'];
$username = "$lname, $fname";
$menu .= "<option value=\"$u2r_id\"";

if (is_array($facilitators))
foreach ($facilitators as $facilitator)
$menu .= ($facilitator == $u2r_id ? " selected" : "");

$menu .= ">$username</option>";

}
}

else
{
$menu .= "<option value=\"\">-- none available --</option>";
}

$menu =
"
<select id=\"esrs_menu\" class=\"esrs_menu\" name=\"esrs_$type"."[facilitators][]\" size=6 style=\"width:130px;\" multiple>
$menu
</select>
";

return $menu;

}


public function m_filter_records($input=array(),$user=0,$role=1,$start,$limit)
{

$u2r = "$user$role";

$dept_id = $input['dept_id'];
$crse_id = $input['crse_id'];
$term_id = $input['term_id'];
$disable = $input['disable'];

$exam_id = $input['exam_id'];

$sort = $input['sortorder'];

$where_clause =
($dept_id > 0 ? "and d.dept_id = $dept_id " : "").
($crse_id > 0 ? "and e.crse_id = $crse_id " : "").
($term_id > 0 ? "and e.term_id = $term_id " : "").
($exam_id > 0 ? "and e.exam_id = $exam_id " : "").
($disable > 0 ? "and e.disable_e = 1 " : "and e.disable_e = 0 ");

switch ($sort)
{
case "d_u":
$order_by = "d.department";
break;
case "d_d":
$order_by = "d.department desc";
break;
case "c_u":
$order_by = "c.course";
break;
case "c_d":
$order_by = "c.course desc";
break;
case "t_u":
$order_by = "e.term_id";
break;
case "t_d":
$order_by = "e.term_id desc";
break;
case "a_u":
$order_by = "e.student_stop,e.created_e";
break;
case "a_d":
$order_by = "e.student_stop desc,e.created_e desc";
break;
default:
$order_by = "e.student_stop,e.created_e";
break;
}

$sql =
"

select
distinct(e.exam_id),
e.facilitator_start,
e.student_stop,
e.disable_e,
c.crse_number,
c.course,
d.department,
t.term_year,
p.period,
s.section

";

switch ($role)
{

case  1:

$this->sql_base .=
"

from
exams `e`,
courses `c`,
departments `d`,
terms `t`,
periods `p`,
sections `s`

where e.student_stop >= CURDATE() - interval 2 year
  and e.crse_id = c.crse_id
  and c.dept_id = d.dept_id
  and e.term_id = t.term_id
  and t.peri_id = p.peri_id
  and t.sect_id = s.sect_id
  and c.disable_c = 0
  and d.disable_d = 0

";
break;

case  2:

$this->sql_base .=
"

from
exams `e`,
courses `c`,
departments `d`,
users2departments `u2d`,
users2roles `u2r`,
terms `t`,
periods `p`,
sections `s`

where e.student_stop >= CURDATE() - interval 2 year
  and e.crse_id = c.crse_id
  and c.dept_id = d.dept_id
  and d.dept_id = u2d.dept_id
  and u2d.user2role_id = u2r.user2role_id
  and u2r.user2role_id = $u2r
  and e.term_id = t.term_id
  and t.peri_id = p.peri_id
  and t.sect_id = s.sect_id
  and c.disable_c = 0
  and d.disable_d = 0
  and u2d.disable_u2d = 0

";
break;

case  3:

$this->sql_base .=
"

from
exams `e`,
courses `c`,
users2courses `u2c`,
users2roles `u2r`,
departments `d`,
terms `t`,
periods `p`,
sections `s`

where e.student_stop >= CURDATE() - interval 2 year
  and e.crse_id = c.crse_id
  and c.crse_id = u2c.crse_id
  and u2c.user2role_id = $u2r
  and c.dept_id = d.dept_id
  and e.term_id = t.term_id
  and t.peri_id = p.peri_id
  and t.sect_id = s.sect_id
  and c.disable_c = 0
  and d.disable_d = 0

";
break;

case  4:

$this->sql_base .=
"

from
exams `e`,
users2courses `u2e`,
users2roles `u2r`,
courses `c`,
departments `d`,
terms `t`,
periods `p`,
sections `s`

where e.student_stop >= CURDATE()
  and e.exam_id = u2e.exam_id
  and u2e.user2role_id = u2r.user2role_id
  and u2r.user2role_id = $u2r
  and e.crse_id = c.crse_id
  and c.dept_id = d.dept_id
  and e.term_id = t.term_id
  and t.peri_id = p.peri_id
  and t.sect_id = s.sect_id
  and c.disable_c = 0
  and d.disable_d = 0
  and u2e.disable_u2e = 0

";
break;

}

$this->sql_base .= "$where_clause order by $order_by";

$compound .=
"

$sql

$this->sql_base

limit $start, $limit

";

$this->sql_base = "from ( select distinct(e.exam_id) $this->sql_base ) `exam_total`";

//echo $compound;

$result = o_db::m_select($compound);

//echo $result;

if (is_array($result))
return $result;

return 0;

}


function m_parse_records($records=array(),$insert=0,$update=0)
{


if (is_array($records))
{
foreach ($records as $record)
{
$exam_id     = $record['exam_id'];
$f_start     = $record['facilitator_start'];
$s_stop      = $record['student_stop'];
$crse_number = $record['crse_number'];
$course      = $record['course'];
$term_year   = $record['term_year'];
$period      = $record['period'];
$section     = $record['section'];
$disable_e   = $record['disable_e'];

$department =
(strlen($record['department']) > 30
 ? substr($record['department'],0,30)."..."
 : $record['department']);

$course =
(strlen($record['course']) > 30
 ? substr($record['course'],0,30)."..."
 : $record['course']);

++$i;
$row =
($insert==$exam_id
 ? "esrs_row_add"
 : ($update==$exam_id
    ? "esrs_row_edit"
    : (($i % 2) > 0
       ? "esrs_row_1"
       : "esrs_row_2")));

// enable base64 = manage_depts=1&enable=1; disable base64 = manage_users=1&disable=1
$toggle_disable =
(ord($disable_e) > 0
 ? "(<a id=\"esrs_toggle_on\" class=\"esrs_toggle_on\" href=\"javascript:\" onClick=\"esrs_set('esrs_find','enable_e','".$exam_id."');\">enable</a>)"
 : "(<a id=\"esrs_toggle_off\" class=\"esrs_toggle_off\" href=\"javascript:\" onClick=\"esrs_set('esrs_find','disable_e','".$exam_id."');\">disable</a>)"
);

$record_list .=
"
<tr>
<td id=\"$row\" class=\"$row\" width=40><a href=\"javascript:\" onClick=\"esrs_set('esrs_find','edit_id','".$exam_id."')\">edit</a></td>
<td id=\"$row\" class=\"$row\">$department</td>
<td id=\"$row\" class=\"$row\">$crse_number: $course</td>
<td id=\"$row\" class=\"$row\">$section, $period $term_year</td>
<td id=\"$row\" class=\"$row\">$f_start to $s_stop</td>
<td id=\"$row\" class=\"$row\">$toggle_disable</td>
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


public function m_disable_exam($exam=0)
{

$sql =
"

select faculty
from sessions
where exam_id = $exam
  and faculty > 0
limit 1

";

$result = o_db::m_select($sql);
if (is_array($result))
return 1;

$sql = "update exams set disable_e = 1 where exam_id = $exam";
if ($result = o_db::m_update($sql))
return 0;

return 1;

}


public function m_enable_exam($exam=0)
{

$sql = "update exams set disable_e = 0 where exam_id = $exam";
if ($result = o_db::m_update($sql))
return 0;

return 1;

}


public function m_get_exams($where="")
{




}


public function m_get_session_exams($u2r_id=0,$role_id=0,$dept_id=0)
{

switch ($role_id)
{

case 3:

$sql =
"
select
distinct (e.exam_id),
e.register_stop,
e.exam_type,
c.course,
c.crse_number,
t.term_year,
s.section,
p.period
#,x.quantity
from
departments `d`,
courses `c`,
users2courses `u2c`,
exams `e`,
terms `t`,
sections `s`,
periods `p`
#,(select count(*) from sessions `ss` where ss.exam_id = e.exam_id) `x`
where d.dept_id = $dept_id
  and d.dept_id = c.dept_id
  and e.crse_id = c.crse_id
  and e.register_start >= NOW()
  and e.term_id = t.term_id
  and t.sect_id = s.sect_id
  and t.peri_id = p.peri_id
  and u2c.crse_id = c.crse_id
  and u2c.user2role_id = $u2r_id
  and u2c.disable_u2c = 0
  and e.disable_e = 0
  and c.disable_c = 0
order by c.course
";
break;

case 4:

$sql =
"
select
distinct (e.exam_id),
e.register_stop,
e.exam_type,
c.course,
c.crse_number,
t.term_year,
s.section,
p.period
#,x.quantity
from
departments `d`,
courses `c`,
exams `e`,
users2courses `u2e`,
terms `t`,
sections `s`,
periods `p`
#,(select count(*) from sessions `ss` where ss.exam_id = e.exam_id) `x`
where d.dept_id = $dept_id
  and d.dept_id = c.dept_id
  and e.crse_id = c.crse_id
  and e.register_start >= NOW()
  and e.term_id = t.term_id
  and t.sect_id = s.sect_id
  and t.peri_id = p.peri_id
  and u2e.exam_id = e.exam_id
  and u2e.user2role_id = $u2r_id
  and u2e.disable_u2e = 0
  and e.disable_e = 0
  and c.disable_c = 0
order by c.course
";
break;

default:

$sql =
"
select
distinct (e.exam_id),
e.register_stop,
e.exam_type,
c.course,
c.crse_number,
t.term_year,
s.section,
p.period
#,x.quantity
from
departments `d`,
courses `c`,
exams `e`,
terms `t`,
sections `s`,
periods `p`
#,(select count(*) from sessions `ss` where ss.exam_id = e.exam_id) `x`
where d.dept_id = $dept_id
  and d.dept_id = c.dept_id
  and e.crse_id = c.crse_id
  and e.register_start >= NOW()
  and e.term_id = t.term_id
  and t.sect_id = s.sect_id
  and t.peri_id = p.peri_id
  and e.disable_e = 0
  and c.disable_c = 0
order by c.course
";
break;

}

$result = o_db::m_select($sql);

if (is_array($result))
return $result;

return 0;

}


public function m_menu_session_exams($user_id=0,$role_id=1,$dept_id=0,$exam_id=0,$type="")
{

$u2r_id = $user_id.$role_id;

$exams = self::m_get_session_exams($u2r_id,$role_id,$dept_id);

if (is_array($exams))
{
foreach ($exams as $exam)
{
$xexam_id = $exam['exam_id'];
$crsenumb = $exam['crse_number'];
$crsename = $exam['course'];
if (strlen($crsename) > 15)
$crsename = substr($crsename,0,15)."...";
$termyear = $exam['term_year'];
$section = $exam['section'];
$period = $exam['period'];
$menu .= "<option value=\"$xexam_id\""
.($xexam_id == $exam_id ? " selected" : "").
">$crsenumb: $crsename - $section, $period/$termyear</option>";
}
}

else
{
$menu .= "<option value=0>-- choose a department --</option>";
}

$menu =
"
<select id=\"esrs_menu\" class=\"esrs_menu\" name=\"esrs_$type"."[exam_id]\">
<option value=0>select an exam</option>
$menu
</select>
";

return $menu;

}


public function m_get_one_record($exam_id=0)
{

$sql =
"

select
e.*,
d.*

from
exams `e`,
courses `c`,
departments `d`

where e.exam_id = $exam_id
  and e.crse_id = c.crse_id
  and c.dept_id = d.dept_id

";
$result = o_db::m_select($sql);

if (is_array($result))
{

$result[0]['exam_type'] = ord($result[0]['exam_type']);

$f_start  = $result[0]['facilitator_start'];
$f_stop   = $result[0]['facilitator_stop'];

$s_start  = $result[0]['student_start'];
$s_stop   = $result[0]['student_stop'];

$fa_start = split("[ \-]",$f_start);
$fa_stop  = split("[ \-]",$f_stop);

$sa_start = split("[ \-]",$s_start);
$sa_stop  = split("[ \-]",$s_stop);

$result[0]['a_year']  = $fa_start[0];
$result[0]['a_month'] = $fa_start[1];
$result[0]['a_day']   = $fa_start[2];
$result[0]['a_time']  = $fa_start[3];

$result[0]['b_year']  = $fa_stop[0];
$result[0]['b_month'] = $fa_stop[1];
$result[0]['b_day']   = $fa_stop[2];
$result[0]['b_time']  = $fa_stop[3];

$result[0]['y_year']  = $sa_start[0];
$result[0]['y_month'] = $sa_start[1];
$result[0]['y_day']   = $sa_start[2];
$result[0]['y_time']  = $sa_start[3];

$result[0]['z_year']  = $sa_stop[0];
$result[0]['z_month'] = $sa_stop[1];
$result[0]['z_day']   = $sa_stop[2];
$result[0]['z_time']  = $sa_stop[3];

//var_dump($result[0]);

$sql =
"

select
u2e.user2role_id

from
exams `e`,
users2exams `u2e`,
users2roles `u2r`,
users `u`

where e.exam_id = $exam_id
  and e.exam_id = u2e.exam_id
  and u2e.user2role_id = u2r.user2role_id
  and u2r.user_id = u.user_id
  and e.disable_e = 0
  and u2e.disable_u2e = 0
  and u2r.disable_u2r = 0
  and u.disable_u = 0

order by u2e.user2role_id

";
$facilitators = o_db::m_select($sql);

if (is_array($facilitators))
foreach ($facilitators as $facilitator)
$result[0]['facilitators'][] = $facilitator['user2role_id'];

return $result[0];

}

return 0;

}

}