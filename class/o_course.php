<?php //o_course.php

class o_course
{

    public function m_test_input($input=array(),$type="")
    {

        $u2r_id       = $input['user2role_id'];
        $dept_id      = $input['dept_id'];
        $crse_number  = $input['crse_number'];
        $course       = $input['course'];

        if (!$u2r_id)
            return "You have not made an 'Administrator' selection.";

        if (!$dept_id)
            return "You have not made a 'Department' selection.";

        if (!$crse_number)
            return "You have not entered a 'Course ID'.";

        if (!$course)
            return "You have not entered a 'Course Name'.";

        return 0;

    } //end m_test_input


    public function m_format_input($input=array(),$type="")
    {

        $input['dept_id']       = o_db::m_db_escape($input['dept_id']);
        $input['crse_number']   = o_db::m_db_escape(strtoupper($input['crse_number']));
        $input['course']        = o_db::m_db_escape($input['course']);
        $input['user2role_id']  = o_db::m_db_escape($input['user2role_id']);

        return $input;

    } //end m_format_input


    public function m_save_record($input=array())
    {

        $u2r_id        = $input['user2role_id'];
        $dept_id       = $input['dept_id'];
        $crse_number   = $input['crse_number'];
        $course        = $input['course'];

        $sql =
        "
        insert into
        courses (`dept_id`,`crse_number`,`course`)
         values ($dept_id,\"$crse_number\",\"$course\");
        ";

        $crse_id = o_db::m_insert($sql);

        //echo $result;

        if (!$crse_id || !is_int($crse_id))
            return $crse_id;

        $u2c = $u2r_id.$crse_id;

        $sql =
        "
        insert into
        users2courses (`user2crse_id`,`user2role_id`,`crse_id`)
               values ($u2c_id,$u2r_id,$crse_id);
        ";

        $result = o_db::m_insert($sql);

        //echo $result;

        if ($result == 0) 
            return 0;

        return $u2c;

    } //end m_save_record


    public function m_edit_record($input=array())
    {

        $edit_id       = $input['edit_id'];

        $crse_id       = substr($edit_id,-4);

        $u2r_id        = $input['user2role_id'];
        $dept_id       = $input['dept_id'];
        $crse_number   = $input['crse_number'];
        $course        = $input['course'];

        $sql =
        "
        update courses
        set dept_id = $dept_id,
            crse_number = \"$crse_number\",
            course = \"$course\"
        where crse_id = $crse_id
        ";
        $result = o_db::m_update($sql);

        if ($result == 0) 
            return 0;

        $u2c = $u2r_id.$crse_id;

        $sql =
        "
        insert into
        users2courses (`user2crse_id`,`user2role_id`,`crse_id`)
               values ($u2c,$u2r_id,$crse_id)
        ";
        $result = o_db::m_insert($sql);

        if (!$result) 
            return 0;

        return $u2c;

    } //end m_edit_record


    public function m_filter_records($user_id=0,$role_id=0,$input=array(),$start,$limit)
    {

        $u2r = $user_id.$role_id;

        $admin       = $input['user2role_id'];
        $crse_id     = substr($input['crse_id'],-4);
        $department  = $input['dept_id'];
        $crsenumber  = $input['crse_number'];
        $course      = $input['course'];
        $disable     = $input['disable'];

        $sort = $input['sortorder'];

        $where =
        ($admin > 0 ? "and u2c.user2role_id = $admin " : "").
        ($crse_id > 0 ? "and c.crse_id = $crse_id " : "").
        ($department > 0 ? "and c.dept_id = $department " : "").
        ($crsenumber != "" ? "and c.crse_number like \"$crsenumber%\" " : "").
        ($course != "" ? "and c.course like \"$course%\" " : "").

        ($disable > 0
         ? "and (d.disable_d = 1 or c.disable_c = 1)"
         : "and d.disable_d = 0 and c.disable_c = 0");

        $sql =
        "
        select
        c.crse_id,
        c.dept_id,
        c.crse_number,
        c.course,
        c.disable_c,
        c.default_c,
        d.department,
        d.disable_d,
        u2c.user2crse_id,
        u2c.created_u2c,
        u2c.disable_u2c,
        u2r.user2role_id,
        u2r.disable_u2r,
        u2r.user_id,
        u2r.role_id,
        u.first_name,
        u.last_name,
        r.role
        ";

        switch ($role_id)
        {

            case  1:

            $this->sql_base .=
            "
            from
            courses `c`,
            departments `d`,
            users2courses `u2c`,
            users2roles `u2r`,
            users `u`,
            sys_roles `r`

            where c.dept_id = d.dept_id
              and c.crse_id = u2c.crse_id
              and u2c.user2role_id = u2r.user2role_id
              and u2r.user_id = u.user_id
              and u2r.role_id = r.role_id
            ";

            break;

            case  2:

            $this->sql_base .=
            "
            from
            courses `c`,
            departments `d`,
            users2courses `u2c`,
            users2departments `u2d`,
            users2roles `u2r`,
            users `u`,
            sys_roles `r`

            where c.dept_id = d.dept_id
              and u2d.dept_id = d.dept_id
              and u2d.user2role_id = $u2r
              and u2c.crse_id = c.crse_id
              and u2c.user2role_id = u2r.user2role_id
              and u2r.user_id = u.user_id
              and u2r.role_id = r.role_id
            ";

            break;

            case  3:

            $this->sql_base .=
            "
            from
            courses `c`,
            departments `d`,
            users2courses `u2c`,
            users2roles `u2r`,
            users `u`,
            sys_roles `r`

            where c.dept_id = d.dept_id
              and u2c.crse_id = c.crse_id
              and u2c.user2role_id = $u2r
              and u2c.user2role_id = u2r.user2role_id
              and u2r.user_id = u.user_id
              and u2r.role_id = r.role_id
            ";

            break;

            case  4:

            $this->sql_base .=
            "
            from
            courses `c`,
            departments `d`,
            users2courses `u2c`,
            users2exams `u2e`,
            users2roles `u2r`,
            exams `e`,
            users `u`,
            sys_roles `r`

            where c.dept_id = d.dept_id
              and c.crse_id = u2c.crse_id
              and c.crse_id = e.crse_id
              and e.disable_e = 0
              and e.exam_id = u2e.exam_id
              and u2e.user2role_id = $u2r
              and u2e.disable_u2e = 0
              and u2c.user2role_id = u2r.user2role_id
              and u2r.user_id = u.user_id
              and u2r.role_id = r.role_id
            ";

            break;

        } //end switch

        switch ($sort)
        {
            case "d_u":
            $order_by = "d.department,c.crse_number";
            break;
            case "d_d":
            $order_by = "d.department desc,c.crse_number";
            break;
            case "c_u":
            $order_by = "c.course";
            break;
            case "c_d":
            $order_by = "c.course desc";
            break;
            case "n_u":
            $order_by = "c.crse_number";
            break;
            case "n_d":
            $order_by = "c.crse_number desc";
            break;
            case "r_u":
            $order_by = "u.last_name,u.first_name,u.username,u2c.created_u2c";
            break;
            case "r_d":
            $order_by = "u.last_name desc,u.first_name desc,u2c.created_u2c desc";
            break;
            default:
            $order_by = "d.department,c.crse_number";
            break;
        } //end switch

        $this->sql_base .= "$where order by $order_by";

        $compound .=
        "
        $sql

        $this->sql_base

        limit $start, $limit
        ";

        $this->sql_base = "from ( select c.crse_id $this->sql_base ) `course_total`";

        $result = o_db::m_select($compound);

        if (is_array($result))
            return $result;

        return 0;

    } //end m_filter_records

    //course admin role id = (3)
    function m_get_course_admins($u2r_id=0,$role_id=0,$crse_id=0)
    {

        $sql =
        ($crse_id > 0
         ?
        "
        select
        distinct(u2c.user2crse_id),
        u.first_name,
        u.last_name,
        r.role
        from users2courses `u2c`,users2roles `u2r`,sys_roles `r`,users `u`
        where (u2c.crse_id = $crse_id
          and u2c.user2role_id = u2r.user2role_id
          and u2r.role_id = r.role_id
          and u2r.user_id = u.user_id
          and u2r.disable_u2r = 0
          and u.disable_u = 0)
        "
        .($u2r_id > 0
        ? "or
           (u2r.user2role_id = $u2r_id
        and u2r.user_id = u.user_id
        and u2r.role_id = r.role_id)"
        : "").
        "
        order by u2c.created_u2c
        "
         :
        "
        select
        distinct(u2r.user2role_id),
        u.first_name,
        u.last_name,
        r.role
        from users2roles `u2r`,users `u`,sys_roles `r`
        where
        "
        .($u2r_id > 0
        ? "(u2r.user2role_id = $u2r_id
        and u2r.user_id = u.user_id
        and u2r.role_id = r.role_id
        and u2r.role_id = 3)
        or"
        : "").
        "
        (u2r.role_id = 3
        "
        .($role_id > 2 ? "and u2r.user2role_id = $u2r_id" : "").
        "
          and u2r.role_id = r.role_id
          and u2r.user_id = u.user_id
          and u2r.disable_u2r = 0
          and u.disable_u = 0)
        order by u.last_name
        ");
        $result = o_db::m_select($sql);

        if (is_array($result))
            return $result;

        return 0;

    } //end m_get_course_admins


    function m_menu_admins($user_id=0,$role_id=1,$crse_id=0,$u2r_id=0,$type="")
    {

        $u2r_id = substr($u2r_id,0,7);
        if (!$u2r_id) $u2r_id = $user_id.$role_id;

        //$u2r_id = ($u2r_id > 0 ? substr($u2r_id,0,7) : $user_id.$role_id);

        $admins = self::m_get_course_admins($u2r_id,$role_id,$crse_id);

        if (is_array($admins))
        {
            foreach ($admins as $admin)
            {
                $xu2r_id = $admin['user2role_id'];
                $fname = $admin['first_name'];
                $lname = $admin['last_name'];
                $role = $admin['role'];
                $menu .= "<option value=\"$xu2r_id\""
                .($xu2r_id == $u2r_id ? " selected" : "").
                "> $fname $lname</option>";
            } //end foreach
        } //end if

        else
        {
            $menu .= "<option value=\"\">-- none available --</option>";
        } //end else

        $menu =
        "
        <select id=\"esrs_menu\" class=\"esrs_menu\" name=\"esrs_$type"."[user2role_id]\">
        <option value=0>select an administrator</option>
        $menu
        </select>
        ";

        return $menu;

    } //end m_menu_admins


    function m_parse_records($records=array(),$insert=0,$update=0,$role=1)
    {

        if (is_array($records))
        {
            foreach ($records as $record)
            {
                $crse_id = $record['crse_id'];
                $dept_id = $record['dept_id'];

                $coursename = $record['course'];
                $coursename = (strlen($coursename) > 20 ? substr($coursename,0,20)."..." : $coursename);

                $department = $record['department'];
                $department = (strlen($department) > 20 ? substr($department,0,20)."..." : $department);

                $crse_number = $record['crse_number'];
                $disable_u2c = $record['disable_u2c'];
                $disable_u2r = $record['disable_u2r'];
                $disable_d = $record['disable_d'];
                $disable_c = $record['disable_c'];
                $default_c = $record['default_c'];
                $u2c_id = $record['user2crse_id'];
                $u2r_id = $record['user2role_id'];
                $user_id = $record['user_id'];
                $fname = $record['first_name'];
                $lname = $record['last_name'];
                $role_id = $record['role_id'];

                ++$i;
                $row =
                ($insert==$u2c_id
                 ? "esrs_row_add"
                 : ($update==$u2c_id
                    ? "esrs_row_edit"
                    : (($i % 2) > 0
                       ? "esrs_row_1"
                       : "esrs_row_2")));

                $verbose_role = $record['role'];
                $verbose_role = (strlen($verbose_role) > 10 ? substr($verbose_role,0,10).".." : $verbose_role);

                // enable base64 = manage_depts=1&enable=1; disable base64 = manage_users=1&disable=1
                $toggle_course =
                (ord($disable_d) > 0
                 ? "disabled"
                 : (ord($disable_c) > 0
                    ? "(<a id=\"esrs_toggle_on\" class=\"esrs_toggle_on\" href=\"javascript:\" onClick=\"esrs_set('esrs_find','enable_c','".$crse_id."');\">enable</a>)"
                    : "(<a id=\"esrs_toggle_off\" class=\"esrs_toggle_off\" href=\"javascript:\" onClick=\"esrs_set('esrs_find','disable_c','".$crse_id."');\">disable</a>)"
                ));

                // enable base64 = manage_depts=1&enable=1; disable base64 = manage_users=1&disable=1
                $toggle_admin =
                (ord($disable_d) > 0
                 ? "disabled"
                 : (ord($disable_c) > 0
                    ? "disabled"
                    : (ord($disable_u2r) > 0
                       ? "disabled"
                       : (ord($disable_u2c) > 0
                          ? "<a id=\"esrs_toggle_on\" class=\"esrs_toggle_on\" href=\"javascript:\" onClick=\"esrs_set('esrs_find','enable_u2c','".$u2c_id."');\">(enable)</a>"
                          : "<a id=\"esrs_toggle_off\" class=\"esrs_toggle_off\" href=\"javascript:\" onClick=\"esrs_set('esrs_find','disable_u2c','".$u2c_id."');\">(disable)</a>"
                ))));

                $toggle_default =
                (ord($default_c) > 0 ? "<b>default</b>" :
                "<a href=\"javascript:\" onClick=\"esrs_set('esrs_find','default_c','".$crse_id."')\">default</a>");

                $record_list .=
                "
                <tr>
                <td id=\"$row\" class=\"$row\" width=40>
                "
                .($role < 3 ? "<a href=\"javascript:\" onClick=\"esrs_set('esrs_find','edit_id','".$u2c_id."')\">edit</a>" : "&nbsp;").
                "
                </td>
                <td id=\"$row\" class=\"$row\">$department</td>
                <td id=\"$row\" class=\"$row\">$crse_number</td>
                <td id=\"$row\" class=\"$row\">$toggle_course $coursename</td>
                "
                .($role < 3 ?
                "
                <td id=\"$row\" class=\"$row\">$toggle_admin $verbose_role: $fname $lname</td>
                <td id=\"$row\" class=\"$row\" width=1>$toggle_default</td>
                "
                : "");
                "
                </tr>
                ";
            } //end foreach
        } //end if

        else
        {
            $record_list .=
            "
            <tr>
            <td id=\"esrs_row_1\" class=\"esrs_row_1\" colspan=10 align=center>-- none available --</td>
            </tr>
            ";
        } //end else

        return $record_list;

    } //end m_parse_records


    function m_get_departments($user=0,$role=1,$dept_id=0,$type="")
    {

        $u2r = $user.$role;

        switch ($type)
        {

            case 'find':
            $type_from  = "courses `c`,";
            $type_where = "where c.dept_id = d.dept_id and";
            break;

            default    :
            $type_from  = "";
            $type_where = "where";
            break;

        } //end switch

        switch ($role)
        {

            case  1:

            $sql =
            "
            select
            distinct(d.dept_id),
            d.department

            from

            $type_from

            departments `d`

            "
            .($dept_id > 0 ? "where d.dept_id = $dept_id" : ($type == 'find' ? "where c.dept_id = d.dept_id" : "")).
            "

            order by d.department
            ";

            break;

            case  2:

            $sql =
            "
            select
            distinct(d.dept_id),
            d.department

            from

            $type_from

            departments `d`,
            users2departments `u2d`,
            users2roles `u2r`

            $type_where

            "
            .($dept_id > 0 ? "d.dept_id = $dept_id and" : "").
            "

                  d.dept_id = u2d.dept_id
              and u2d.user2role_id = u2r.user2role_id
              and u2r.user2role_id = $u2r
              and u2d.disable_u2d = 0
              and u2r.disable_u2r = 0

            order by d.department
            ";

            break;

            case  3:

            $sql =
            "
            select
            distinct(d.dept_id),
            d.department

            from
            courses `c`,
            departments `d`,
            users2courses `u2c`,
            users2roles `u2r`

            where d.disable_d = 0
            "
            .($dept_id > 0 ? "and d.dept_id = $dept_id" : "").
            "
              and d.dept_id = c.dept_id
              and c.crse_id = u2c.crse_id
              and u2c.user2role_id = u2r.user2role_id
              and u2r.user2role_id = $u2r
              and u2c.disable_u2c = 0
              and u2r.disable_u2r = 0

            order by d.department
            ";

            break;

            default:

            $sql =
            "
            select
            distinct(d.dept_id),
            d.department

            from
            exams `e`,
            courses `c`,
            departments `d`,
            users2exams `u2e`,
            users2roles `u2r`

            where d.disable_d = 0
            "
            .($dept_id > 0 ? "and d.dept_id = $dept_id" : "").
            "
              and d.dept_id = c.dept_id
              and c.crse_id = e.crse_id
              and e.exam_id = u2e.exam_id
              and u2e.user2role_id = u2r.user2role_id
              and u2r.user2role_id = $u2r
              and u2r.disable_u2r = 0
              and u2e.disable_u2e = 0

            order by d.department
            ";

            break;

        } //end switch

        $result = o_db::m_select($sql);

        if (is_array($result))
            return $result;

        return 0;

    } //end m_get_departments


    function m_menu_departments($user=0,$role=1,$dept_id=0,$type="")
    {

        $departments = self::m_get_departments($user,$role,$dept_id,$type);

        if (is_array($departments))
        {
            foreach ($departments as $department)
            {
                $xdept_id = $department['dept_id'];
                $deptname = $department['department'];
                $menu .= "<option value=\"$xdept_id\""
                .($xdept_id == $dept_id ? " selected" : "").">"
                .(strlen($deptname) > 25
                  ? substr($deptname,0,25)."..."
                  : $deptname)
                ."</option>";
            } //end foreach
        } //end if

        else
        {
            $menu .= "<option value=\"\">-- none available --</option>";
        } //end else

        $menu =
        "
        <select id=\"esrs_menu\" class=\"esrs_menu\" name=\"esrs_$type"."[dept_id]\">
        <option value=0>select a department</option>
        $menu
        </select>
        ";

        return $menu;

    } //end m_menu_departments


    public function m_default_course($crse_id=0)
    {

        $sql = "select dept_id from courses where crse_id = $crse_id";
        $result = o_db::m_select($sql);

        if (!is_array($result))
            return 0;

        $depart = $result[0]['dept_id'];

        $sql = "update courses set default_c = 0 where dept_id = $depart";
        $result = o_db::m_update($sql);

        $sql = "update courses set default_c = 1 where crse_id = $crse_id";

        if ($result = o_db::m_update($sql))
            return 1;

        return 0;

    } //end _m_default_course


    public function m_disable_course($crse_id=0)
    {

    $sql = "update courses set disable_c = 1 where crse_id = $crse_id";

      if ($result = o_db::m_update($sql))
          return 1;

      return 0;

    } //end m_disable_course


    public function m_enable_course($crse_id=0)
    {

        $sql = "update courses set disable_c = 0 where crse_id = $crse_id";

        if ($result = o_db::m_update($sql))
            return 1;

        return 0;

    } //end m_enable_course


    public function m_disable_admin($u2c_id=0)
    {

        $sql = "update users2courses set disable_u2c = 1 where user2crse_id = $u2c_id";

        if ($result = o_db::m_update($sql))
            return 1;

        return 0;

    } //end m_disable_admin


    public function m_enable_admin($u2c_id=0)
    {

        $sql = "update users2courses set disable_u2c = 0 where user2crse_id = $u2c_id";

        if ($result = o_db::m_update($sql))
            return 1;

        return 0;

    } //end m_enable_admin


    public function m_get_one_record($u2c_id=0)
    {

        $sql =
        "
        select c.*,u2c.*
        from users2courses `u2c`,courses `c`
        where u2c.user2crse_id = $u2c_id
          and u2c.crse_id = c.crse_id
        ";

        $result = o_db::m_select($sql);

        if (is_array($result))
            return $result[0];

        return 0;

    } //end m_get_one_record

} //end o_course.php