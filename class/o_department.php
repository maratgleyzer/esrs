<?php //o_department.php

class o_department
{

    public function m_test_input($input=array(),$type="")
    {

        $u2r_id        = $input['user2role_id'];
        $dept_number   = $input['dept_number'];
        $department    = $input['department'];

        if (!$u2r_id)
            return "You have not selected an 'Administrator'.";

        if (!$dept_number)
            return "You have not entered a 'Department ID'.";

        if (!$department)
            return "You have not entered a 'Department Name'.";

        return 0;

    } //end m_test_input


    public function m_format_input($input=array(),$type="")
    {

        $input['dept_number']   = o_db::m_db_escape(strtoupper($input['dept_number']));
        $input['department']    = o_db::m_db_escape($input['department']);
        $input['user2role_id']  = o_db::m_db_escape($input['user2role_id']);

        return $input;

    } //end m_format_input


    public function m_save_record($input=array())
    {

        $u2r_id        = $input['user2role_id'];
        $dept_number   = $input['dept_number'];
        $department    = $input['department'];
        $campus        = $input['camp_id'];

        if (!$campus) $campus = "0";

        $sql =
        "
        insert into
        departments (`dept_number`,`department`,`camp_id`)
             values (\"$dept_number\",\"$department\",$campus);
        ";

        $dept_id = o_db::m_insert($sql);

        //echo $result;

        if (!$dept_id || !is_int($dept_id))
            return $dept_id;

        $u2d_id = $u2r_id.$dept_id;

        $sql =
        "
        insert into
        users2departments (`user2dept_id`,`user2role_id`,`dept_id`)
                   values ($u2d_id,$u2r_id,$dept_id);
        ";

        $result = o_db::m_insert($sql);

        //echo $result;

        if (!$result || !is_int($result))
            return $result;

        return $u2d_id;

    } //end m_save_record


    public function m_edit_record($input=array())
    {

        $edit_id       = $input['edit_id'];

        $dept_id       = substr($edit_id,-2);

        $u2r_id        = $input['user2role_id'];
        $dept_number   = $input['dept_number'];
        $department    = $input['department'];
        $campus        = $input['camp_id'];

        $sql =
        "
        update departments
        set dept_number = \"$dept_number\",
            department = \"$department\",
            camp_id = $campus
        where dept_id = $dept_id
        ";

        $result = o_db::m_update($sql);

        if ($result == 0) 
            return 0;

        $u2d = $u2r_id.$dept_id;

        $sql =
        "
        insert into users2departments (`user2dept_id`,`user2role_id`,`dept_id`)
                               values ($u2d,$u2r_id,$dept_id)
        ";

        $result = o_db::m_insert($sql);

        if (!$result) 
            return 0;

        //echo $result;

        return $u2d;

    } //end m_edit_record


    //department admin role id = (2)
    function m_get_dept_admins($dept_id=0,$u2r_id=0)
    {

        //get all currently available department admins
        //who are not user disabled, role disabled
        $sql =
        ($dept_id > 0
         ?
        "
        select
        distinct(u2r.user2role_id),
        u.first_name,
        u.last_name,
        r.role
        from users2departments `u2d`,users2roles `u2r`,sys_roles `r`,users `u`
        where u2d.dept_id = $dept_id
          and u2d.user2role_id = u2r.user2role_id
         and (u2r.role_id = r.role_id
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
        order by u2d.created_u2d
        "
         :
        "
        select
        distinct(u2r.user2role_id),
        u.first_name,
        u.last_name,
        r.role
        from sys_roles `r`,users `u`,users2roles `u2r`
        where
        "
        .($u2r_id > 0
        ? "(u2r.user2role_id = $u2r_id
        and u2r.user_id = u.user_id
        and u2r.role_id = r.role_id
        and r.role_id = 2)
        or"
        : "").
        "
             (r.role_id = 2
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

    } //end m_get_dept_admins


    function m_menu_admins($dept_id=0,$edit_id=0,$u2r_id=0,$type="")
    {

        $xu2r_id = substr($edit_id,0,-2);

        $admins = self::m_get_dept_admins($dept_id,$xu2r_id);

        if (is_array($admins))
        {
            foreach ($admins as $admin)
            {
                $menu .= "<option value=\"$admin[user2role_id]\""
                .(($admin['user2role_id'] == $u2r_id) ||
                  ($admin['user2role_id'] == $xu2r_id) ? " selected" : "")
                .">$admin[first_name] $admin[last_name]</option>";
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

    } //end m_get_dept_admins


    public function m_get_campuses()
    {

        $sql = "select camp_id,campus from campuses order by campus";
        $result = o_db::m_select($sql);

        if (is_array($result))
            return $result;

        return 0;

    } //end m_get_campuses


    public function m_menu_campuses($camp_id=0,$type="")
    {

        $campuses = self::m_get_campuses();

        if (is_array($campuses))
        {
            foreach ($campuses as $campus)
            {
                $xcamp_id = $campus['camp_id'];
                $campname = $campus['campus'];
                $trimed_camp =
                (strlen($campname) > 25 ? substr($campname,0,25)."..." : $campname);
                $menu .= "<option value=\"$xcamp_id\""
                .($xcamp_id == $camp_id ? " selected" : "")
                .">$trimed_camp</option>";
            } //end foreach
        } //end if

        else
        {
            $menu .= "<option value=\"\">-- none available --</option>";
        } //end else

        $menu =
        "
        <select id=\"esrs_menu\" class=\"esrs_menu\" name=\"esrs_$type"."[camp_id]\">
        <option value=\"0\">select a campus</option>
        $menu
        </select>
        ";

        return $menu;

    } //end m_menu_campuses


    function m_filter_records($user_id=0,$role_id=0,$input=array())
    {

        $dept_id = substr($input['dept_id'],-2);

        $sort = $input['sortorder'];

        switch ($sort)
        {
            case "n_u":
            $order = "d.dept_number";
            break;
            case "n_d":
            $order = "d.dept_number desc";
            break;
            case "d_u":
            $order = "d.department";
            break;
            case "d_d":
            $order = "d.department desc";
            break;
            case "r_u":
            $order = "u.last_name,u.first_name,u.username,u2d.created_u2d";
            break;
            case "r_d":
            $order = "u.last_name desc,u.first_name desc,u.username desc,u2d.created_u2d desc";
            break;
            case "c_u":
            $order = "c.campus,d.department";
            break;
            case "c_d":
            $order = "c.campus desc,d.department";
            break;
            default:
            $order = "d.department";
            break;
        } //end switch

        $sql =
        "
        select
        distinct(d.dept_id),
        d.dept_number,
        d.department,
        d.disable_d,
        d.default_d,
        c.campus,
        u2d.user2dept_id,
        u2d.user2role_id,
        u2d.created_u2d,
        u2d.disable_u2d,
        u2r.user2role_id,
        u2r.disable_u2r,
        u.user_id,
        u.first_name,
        u.last_name,
        r.role_id,
        r.role

        from departments `d`
        left join campuses `c` on (d.camp_id = c.camp_id),
        users2departments `u2d`,
        users2roles `u2r`,
        users `u`,
        sys_roles `r`

        where d.dept_id = u2d.dept_id
          and (d.camp_id = c.camp_id or d.camp_id = 0)
          and u2d.user2role_id = u2r.user2role_id
        "
        .($dept_id > 0 ? "and d.dept_id = $dept_id" :
         ($role_id > 1 ? "and u2r.user2role_id = $user_id$role_id" : "")).
        "
          and u2r.user_id = u.user_id
          and u2r.role_id = r.role_id

        order by

        $order
        ";

        $result = o_db::m_select($sql);

        if (is_array($result))
            return $result;

        return 0;

    } //end m_filter_records


    function m_parse_records($records=array(),$insert=0,$update=0,$role=1)
    {

        if (is_array($records))
        {
            foreach ($records as $record)
            {
                $dept_id = $record['dept_id'];
                $dept_number = $record['dept_number'];
                $department = $record['department'];
                $disable_u2d = $record['disable_u2d'];
                $disable_u2r = $record['disable_u2r'];
                $disable_d = $record['disable_d'];
                $default_d = $record['default_d'];
                $u2d_id = $record['user2dept_id'];
                $u2r_id = $record['user2role_id'];
                $user_id = $record['user_id'];
                $fname = $record['first_name'];
                $lname = $record['last_name'];
                $role_id = $record['role_id'];
                $campus = $record['campus'];

                $verbose_role =
                (strlen($record['role']) > 10
                 ? substr($record['role'],0,10).".."
                 : $record['role']);

                ++$i;
                $row =
                ($insert==$u2d_id
                 ? "esrs_row_add"
                 : ($update==$u2d_id
                    ? "esrs_row_edit"
                    : (($i % 2) > 0
                       ? "esrs_row_1"
                       : "esrs_row_2")));

                // enable base64 = manage_depts=1&enable=1; disable base64 = manage_users=1&disable=1
                $toggle_dept =
                (ord($disable_d) > 0
                 ? "(<a id=\"esrs_toggle_on\" class=\"esrs_toggle_on\" href=\"javascript:\" onClick=\"esrs_set('esrs_find','enable_d','".$dept_id."');\">enable</a>)"
                 : "(<a id=\"esrs_toggle_off\" class=\"esrs_toggle_off\" href=\"javascript:\" onClick=\"esrs_set('esrs_find','disable_d','".$dept_id."');\">disable</a>)"
                );

                // enable base64 = manage_depts=1&enable=1; disable base64 = manage_users=1&disable=1
                $toggle_admin =
                (ord($disable_d) > 0
                 ? "disabled"
                 : (ord($disable_u2r) > 0
                    ? "disabled"
                    : (ord($disable_u2d) > 0
                       ? "(<a id=\"esrs_toggle_on\" class=\"esrs_toggle_on\" href=\"javascript:\" onClick=\"esrs_set('esrs_find','enable_u2d','".$u2d_id."');\">enable</a>)"
                       : "(<a id=\"esrs_toggle_off\" class=\"esrs_toggle_off\" href=\"javascript:\" onClick=\"esrs_set('esrs_find','disable_u2d','".$u2d_id."');\">disable</a>)"
                )));

                $toggle_default =
                (ord($default_d) > 0 ? "<b>default</b>" :
                "<a href=\"javascript:\" onClick=\"esrs_set('esrs_find','default_d','".$dept_id."')\">default</a>");

                $record_list .=
                "
                <tr>
                <td id=\"$row\" class=\"$row\" width=40>
                "
                .($role < 2 ? "<a href=\"javascript:\" onClick=\"esrs_set('esrs_find','edit_id','".$u2d_id."')\">edit</a>" : "&nbsp;").
                "
                <td id=\"$row\" class=\"$row\"><b>$dept_id</b></td>
                <td id=\"$row\" class=\"$row\">$dept_number</td>
                <td id=\"$row\" class=\"$row\">$toggle_dept $department</td>
                "
                .($role < 2 ? "<td id=\"$row\" class=\"$row\">$toggle_admin $verbose_role: $fname $lname</td>" : "").
                "
                <td id=\"$row\" class=\"$row\">$campus</td>
                <td id=\"$row\" class=\"$row\" width=1>
                "
                .($role < 2 ? $toggle_default : "&nbsp;").
                "
                </td>
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


    public function m_default_department($dept_id=0)
    {

        $sql = "select camp_id from departments where dept_id = $dept_id";
        $result = o_db::m_select($sql);

        if (!is_array($result))
            return 0;

        $campus = $result[0]['camp_id'];

        $sql = "update departments set default_d = 0 where camp_id = $campus";
        $result = o_db::m_update($sql);

        $sql = "update departments set default_d = 1 where dept_id = $dept_id";

        if ($result = o_db::m_update($sql))
            return 1;

        return 0;

    } //end m_default_department


    public function m_disable_department($dept_id=0)
    {

        $sql = "update departments set disable_d = 1 where dept_id = $dept_id";

        if ($result = o_db::m_update($sql))
            return 1;

        return 0;

    } //end m_disable_department


    public function m_enable_department($dept_id=0)
    {

        $sql = "update departments set disable_d = 0 where dept_id = $dept_id";
        
        if ($result = o_db::m_update($sql))
            return 1;

        return 0;

    } //end m_enable_department


    public function m_disable_admin($u2d_id=0)
    {

        $sql = "update users2departments set disable_u2d = 1 where user2dept_id = $u2d_id";

        if ($result = o_db::m_update($sql))
            return 1;

        return 0;

    } end //m_disable_admin


    public function m_enable_admin($u2d_id=0)
    {

        $sql = "update users2departments set disable_u2d = 0 where user2dept_id = $u2d_id";

        if ($result = o_db::m_update($sql))
            return 1;

        return 0;

    } //end m_enable_admin


    public function m_get_one_record($u2d_id=0)
    {

        $sql =
        "
        select d.*,u2d.*
        from users2departments `u2d`,departments `d`
        where u2d.user2dept_id = $u2d_id
          and u2d.dept_id = d.dept_id
        ";

        $result = o_db::m_select($sql);

        if (is_array($result))
          return $result[0];

        return 0;

    } //end m_get_one_record

} //end o_department.php