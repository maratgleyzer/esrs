<?php //o_room.php

class o_room
{

    public function m_test_input($input=array())
    {

        $buil_id   = $input['buil_id'];
        $roomnumb  = $input['room_number'];
        $roomname  = $input['room_name'];

        if (!$buil_id)
            return "You have not made a 'Building' selection.";

        if (!$roomnumb && !$roomname)
            return "You have not entered a 'Room Number' and/or 'Room Name'.";

    } //end m_test_input


    public function m_format_input($input=array(),$type="")
    {

        $input['buil_id']         = o_db::m_db_escape($input['buil_id']);
        $input['room_name']       = o_db::m_db_escape($input['room_name']);
        $input['room_number']     = o_db::m_db_escape(strtoupper($input['room_number']));

        return $input;

    } //end m_format_input


    public function m_save_record($input=array())
    {

        $buil_id     = $input['buil_id'];
        $roomnumb    = $input['room_number'];
        $roomname    = $input['room_name'];

        $sql =
        "
        insert into
         rooms (`buil_id`,`room_number`,`room_name`)
        values ($buil_id,\"$roomnumb\",\"$roomname\")
        ";

        $result = o_db::m_insert($sql);

        return $result;

    } //end m_save_record


    public function m_edit_record($input=array())
    {

        $edit_id     = $input['edit_id'];

        $buil_id     = $input['buil_id'];
        $roomnumb    = $input['room_number'];
        $roomname    = $input['room_name'];

        $sql =
        "
        update rooms
        set buil_id = $buil_id,
            room_number = \"$roomnumb\",
            room_name = \"$roomname\"
        where room_id = $edit_id
        ";

        $result = o_db::m_update($sql);

        if ($result == 0) 
            return 0;

        return $edit_id;

    } //end m_edit_record


    public function m_filter_records($input=array(),$start,$limit)
    {

        $room_id  = $input['room_id'];
        $building = $input['buil_id'];
        $roomname = $input['room_name'];
        $roomnumb = $input['room_number'];
        $campus   = $input['camp_id'];
        $disable  = $input['disable'];

        $where =
        ($room_id > 0 ? "and r.room_id = $room_id " : "").
        ($building > 0 ? "and r.buil_id = $building " : "").
        ($roomname != "" ? "and r.room_name like \"%$roomname%\" " : "").
        ($roomnumb != "" ? "and r.room_number like \"%$roomnumb%\" " : "").
        ($campus > 0 ? "and c.camp_id = $campus " : "").

        ($disable > 0
         ? "and (r.disable_r = 1 or b.disable_b = 1)"
         : "and r.disable_r = 0 and b.disable_b = 0");

        $sort = $input['sortorder'];

        switch ($sort)
        {
            case "r_u":
            $order = "r.room_number,r.room_name";
            break;
            case "r_d":
            $order = "r.room_number desc,r.room_name";
            break;
            case "n_u":
            $order = "r.room_name,r.room_number";
            break;
            case "n_d":
            $order = "r.room_name desc,r.room_number";
            break;
            case "b_u":
            $order = "b.building,r.room_number,r.room_name";
            break;
            case "b_d":
            $order = "b.building desc,r.room_number,r.room_name";
            break;
            case "c_u":
            $order = "c.campus,b.building,r.room_number,r.room_name";
            break;
            case "c_d":
            $order = "c.campus desc,b.building,r.room_number,r.room_name";
            break;
            default:
            $order = "c.campus,b.building,r.room_number,r.room_name";
            break;
        } //end switch

        $this->sql_base =
        "
        from rooms `r`,buildings `b`,campuses `c`
        where r.buil_id = b.buil_id
          and b.camp_id = c.camp_id
        $where
        order by
        $order
        ";

        $sql =
        "
        select
        c.campus,
        b.building,
        b.disable_b,
        r.room_number,
        r.room_name,
        r.disable_r,
        r.default_r,
        r.room_id
        $this->sql_base
        limit $start, $limit
        ";
        $result = o_db::m_select($sql);

        if (is_array($result))
            return $result;

        return 0;

    } //end m_filter_records


    public function m_get_buildings($camp_id=0)
    {

        $sql =
        "
        select
        buil_id,
        building
        from buildings
        where disable_b = 0
          and camp_id = $camp_id
        order by building
        ";

        $result = o_db::m_select($sql);

        if (is_array($result))
            return $result;

        return 0;

    } //end m_get_buildings


    public function m_menu_buildings($camp_id=0,$buil_id=0,$type="")
    {

        $buildings = self::m_get_buildings($camp_id);

        if (is_array($buildings))
        {
            foreach ($buildings as $building)
            {
                $xbuil_id = $building['buil_id'];
                $builname = $building['building'];
                $builname = (strlen($builname) > 20 ? substr($builname,0,20)."..." : $builname);
                $menu .= "<option value=\"$xbuil_id\""
                .($xbuil_id == $buil_id ? " selected" : "")
                .">$builname</option>";
            } //end foreach
        } //end if

        else
        {
            $menu .= "<option value=0>-- choose a campus --</option>";
        } //end else

        $menu =
        "
        <select id=\"esrs_menu\" class=\"esrs_menu\" name=\"esrs_$type"."[buil_id]\">
        <option value=\"0\">select a building</option>
        $menu
        </select>
        ";

        return $menu;

    } //end m_menu_fuildings


    public function m_parse_records($records=array(),$insert=0,$update=0)
    {

        if (is_array($records))
        {
            foreach ($records as $record)
            {
                $campus = $record['campus'];
                $building = $record['building'];
                $room_number = $record['room_number'];
                $room_name = $record['room_name'];
                $disable_b = $record['disable_b'];
                $disable_r = $record['disable_r'];
                $default_r = $record['default_r'];
                $room_id = $record['room_id'];

                ++$i;
                $row =
                ($insert==$room_id
                 ? "esrs_row_add"
                 : ($update==$room_id
                    ? "esrs_row_edit"
                    : (($i % 2) > 0
                       ? "esrs_row_1"
                       : "esrs_row_2")));

                // enable base64 = manage_depts=1&enable=1; disable base64 = manage_users=1&disable=1
                $toggle_disable =
                (ord($disable_b) > 0
                 ? "disabled"
                 : (ord($disable_r) > 0
                    ? "(<a id=\"esrs_toggle_on\" class=\"esrs_toggle_on\" href=\"javascript:\" onClick=\"esrs_set('esrs_find','enable_r','".$room_id."');\">enable</a>)"
                    : "(<a id=\"esrs_toggle_off\" class=\"esrs_toggle_off\" href=\"javascript:\" onClick=\"esrs_set('esrs_find','disable_r','".$room_id."');\">disable</a>)"
                ));

                $toggle_default =
                (ord($default_r) > 0
                 ? "<b>default</b>"
                 : "<a href=\"javascript:\" onClick=\"esrs_set('esrs_find','default_r','".$room_id."')\">default</a>");

                $record_list .=
                "
                <tr>
                <td id=\"$row\" class=\"$row\" width=40><a href=\"javascript:\" onClick=\"esrs_set('esrs_find','edit_id','".$room_id."')\">edit</a></td>
                <td id=\"$row\" class=\"$row\">$campus</td>
                <td id=\"$row\" class=\"$row\">$building</td>
                <td id=\"$row\" class=\"$row\">$toggle_disable $room_number
                <td id=\"$row\" class=\"$row\">$room_name &nbsp;</td>
                <td id=\"$row\" class=\"$row\" width=1>$toggle_default</td>
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


    public function m_default_room($room_id=0)
    {

        $sql = "select buil_id from rooms where room_id = $room_id";
        $result = o_db::m_select($sql);

        if (!is_array($result))
            return 0;

        $building = $result[0]['buil_id'];

        $sql = "update rooms set default_r = 0 where buil_id = $building";
        $result = o_db::m_update($sql);

        $sql = "update rooms set default_r = 1 where room_id = $room_id";

        if ($result = o_db::m_update($sql))
            return 1;

        return 0;

    } //end m_efault_room


    public function m_disable_room($room_id=0)
    {

        $sql = "update rooms set disable_r = 1 where room_id = $room_id";

        if ($result = o_db::m_update($sql))
            return 1;

        return 0;

    } //end m_disable_room


    public function m_enable_room($room_id=0)
    {

        $sql = "update rooms set disable_r = 0 where room_id = $room_id";

        if ($result = o_db::m_update($sql))
            return 1;

        return 0;

    } //end m_enable_room


    public function m_get_one_record($room_id=0)
    {

        $sql =
        "
        select r.*,b.*
        from rooms `r`,buildings `b`
        where r.room_id = $room_id
          and r.buil_id = b.buil_id
        ";

        $result = o_db::m_select($sql);

        if (is_array($result))
            return $result[0];

        return 0;

    } //end m_get_one_record


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
                $campname = (strlen($campname) > 30 ? substr($campname,0,30)."..." : $campname);
                $menu .= "<option value=\"$xcamp_id\""
                .($xcamp_id == $camp_id ? " selected" : "")
                .">$campname</option>";
            } //end foreach
        } //end if

        else
        {
            $menu .= "<option value=\"\">-- none available --</option>";
        } //end else

        $menu =
        "
        <select id=\"esrs_menu\" class=\"esrs_menu\" name=\"esrs_$type"."[camp_id]\" onChange=\"esrs_set('esrs_".$type."','jump_menu',1);\">
        <option value=\"0\">select a campus</option>
        $menu
        </select>
        ";

        return $menu;

    } //end m_menu_campuses

} //end o_room.php