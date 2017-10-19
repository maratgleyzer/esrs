<?php

//initiate the system with global vars and object starts
require_once("../_autoload.php");

$sql =
"

select
distinct(ss.sesn_id),
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
u.first_name `student_first_name`,
u.last_name `student_last_name`,
u.email_address,
u4.first_name `faculty_first_name`,
u4.last_name `faculty_last_name`,
u4.email_address `faculty_email`

from
sessions `ss`
left join users2roles `u2r4` on (u2r4.user2role_id = ss.faculty)
left join users `u4` on (u4.user_id = u2r4.user_id),

users2sessions `u2s`,
users2roles `u2r`,
users `u`,

exams `e`,
departments `d`,
courses `c`,
terms `t`,
periods `p`,
sections `s`,
rooms `r`,
buildings `b`,
campuses `ca`

where ss.session_start >= NOW()
  and ss.session_start <= NOW() + INTERVAL 2 DAY
  and ss.exam_id = e.exam_id
  and ss.room_id = r.room_id
  and e.crse_id = c.crse_id
  and e.term_id = t.term_id
  and t.peri_id = p.peri_id
  and t.sect_id = s.sect_id
  and c.dept_id = d.dept_id
  and r.buil_id = b.buil_id
  and b.camp_id = ca.camp_id
  and u2r4.disable_u2r = 0
  and u4.disable_u = 0
  and b.disable_b = 0
  and r.disable_r = 0
  and c.disable_c = 0
  and d.disable_d = 0
  and t.disable_t = 0
  and e.disable_e = 0
  and ss.disable_s = 0
  and ss.hidden = 0

  and ss.sesn_id = u2s.sesn_id
  and u2s.notice = 0
  and u2s.user2role_id = u2r.user2role_id
  and u2r.user_id = u.user_id
  and u2r.disable_u2r = 0
  and u.disable_u = 0

order by ss.session_start,u2s.created_u2s limit 25

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

        $u2r_id                   = $record['user2role_id'];
        $sesn_id                  = $record['sesn_id'];

        $building                 = $record['building'];
        $room_number              = $record['room_number'];
        $room_name                = $record['room_name'];

        $abbr_room_name           = (strlen($room_name) > 15 ? substr($room_name,0,15)."..." : $room_name);
        $abbr_building            = (strlen($building) > 10 ? substr($building,0,10)."..." : $building);

        $record['session_start']  = strftime("%a., %D @ %I:%M %p",strtotime($record['session_start']));
        $record['session_stop']   = strftime(" - %I:%M %p",strtotime($record['session_stop']));

        $record['location']       = "$abbr_building - ".($room_number ? $room_number : $abbr_room_name);

        /*email*/   $error = $_esrs->sendemail(126,$record,1) ;

        if (!$error)
        {

            $upd_sql =
            "

            update users2sessions set notice = 1
            where sesn_id = $sesn_id and user2role_id = $u2r_id

            ";

            $result = $o_db->m_update($upd_sql);

        }

    }

?>
