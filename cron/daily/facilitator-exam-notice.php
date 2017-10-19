<?php

//initiate the system with global vars and object starts
require_once("../_autoload.php");

$sql =
"

select
e.exam_id,
e.facilitator_start,
e.facilitator_stop,
e.student_start,
e.student_stop,
t.term_year,
p.period,
s.section,
d.department,
c.crse_number,
c.course,
u2r.user2role_id,
u.email_address,
u.first_name,
u.last_name

from
users2exams `u2e`,
users2roles `u2r`,
users `u`,
exams `e`,
departments `d`,
courses `c`,
terms `t`,
periods `p`,
sections `s`

where u2e.created_u2e <= NOW()
  and u2e.created_u2e >= NOW() - INTERVAL 2 DAY
  and u2e.user2role_id = u2r.user2role_id
  and u2r.user_id = u.user_id
  and u2e.exam_id = e.exam_id
  and e.crse_id = c.crse_id
  and e.term_id = t.term_id
  and t.peri_id = p.peri_id
  and t.sect_id = s.sect_id
  and c.dept_id = d.dept_id
  and c.disable_c = 0
  and d.disable_d = 0
  and t.disable_t = 0
  and e.disable_e = 0

  and u2e.notice = 0
  and u2r.disable_u2r = 0
  and u.disable_u = 0

order by e.facilitator_start,u2e.created_u2e

";

$records = $o_db->m_select($sql);

//echo $sql;
//echo $records;

if (is_array($records))
    foreach ($records as $record)
    {

    //set local configuration params
        $record['host_url']           = $_esrs->p_config['system']['host_url'];
        $record['email_domain']       = $_esrs->p_config['display']['email_domain'];

        $u2r_id                       = $record['user2role_id'];
        $exam_id                      = $record['exam_id'];

        $record['facilitator_start']  = strftime("%a., %D",strtotime($record['facilitator_start']));
        $record['facilitator_stop']   = strftime(" - %a., %D",strtotime($record['facilitator_stop']));

        $record['student_start']      = strftime("%a., %D",strtotime($record['student_start']));
        $record['student_stop']       = strftime(" - %a., %D",strtotime($record['student_stop']));

        /*email*/   $error = $_esrs->sendemail(128,$record,1) ;

        if (!$error)
        {

            $upd_sql =
            "

            update users2exams set notice = 1
            where exam_id = $exam_id and user2role_id = $u2r_id

            ";

            $result = $o_db->m_update($upd_sql);

        }

    }