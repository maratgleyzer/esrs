<?php //o_building.php

class o_building
{

	public $p_buil_id = 0;


	public function m_test_input($input=array())
	{

		$camp_id     = $input['camp_id'];
		$building    = $input['building'];

		if (!$camp_id)
			return "You have not made a 'Campus' selection.";

		if (!$building)
			return "You have not completed the 'Building Name' field.";

	} //end m_test_input


	public function m_format_input($input=array(),$type="")
	{

		$input['camp_id']   = o_db::m_db_escape($input['camp_id']);
		$input['building']  = o_db::m_db_escape($input['building']);

		return $input;

	} //end m_format_input


	public function m_save_record($input=array())
	{

		$camp_id     = $input['camp_id'];
		$building    = $input['building'];

		$sql =
		"
		insert into
		buildings (`camp_id`,`building`)
		   values ($camp_id,\"$building\")
		";

		$result = o_db::m_insert($sql);

		return $result;

	} //end m_save_record


	public function m_edit_record($input=array())
	{

		$edit_id     = $input['edit_id'];
		$camp_id     = $input['camp_id'];
		$building    = $input['building'];

		$sql =
		"
		update buildings
		set camp_id = $camp_id,
		    building = \"$building\"
		where buil_id = $edit_id
		";

		$result = o_db::m_insert($sql);

		if ($result == 0) 
			return 0;

		return $edit_id;

	} //end m_edit_record


	public function m_filter_records($input=array(),$start,$limit)
	{

		$buil_id   = $input['buil_id'];
		$campus    = $input['camp_id'];
		$disable   = $input['disable'];

		$where =
		($buil_id > 0 ? "and b.buil_id = $buil_id " : "").
		($campus > 0 ? "and b.camp_id = $campus " : "").
		($disable > 0 ? "and b.disable_b = 1" : "");

		$sort = $input['sortorder'];

		switch ($sort)
		{
			case "b_u":
			$order = "b.building,c.campus";
			break;
			case "b_d":
			$order = "b.building desc,c.campus";
			break;
			case "c_u":
			$order = "c.campus,b.building";
			break;
			case "c_d":
			$order = "c.campus desc,b.building";
			break;
			default:
			$order = "c.campus,b.building";
			break;
		} //end switch

		$this->sql_base =
		"
		from buildings `b`,campuses `c`
		where c.camp_id = b.camp_id
		$where
		order by
		$order
		";

		$sql =
		"
		select
		c.campus,
		b.buil_id,
		b.building,
		b.disable_b,
		b.default_b
		$this->sql_base
		limit $start, $limit
		";

		$result = o_db::m_select($sql);

		if (is_array($result))
			return $result;

		return 0;

	} //end m_filter_records


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
		<select id=\"esrs_menu\" class=\"esrs_menu\" name=\"esrs_$type"."[camp_id]\">
		<option value=\"0\">select a campus</option>
		$menu
		</select>
		";

		return $menu;

	} //end m_menu_campuses


	public function m_parse_records($records=array(),$insert=0,$update=0)
	{

		if (is_array($records))
		{
			foreach ($records as $record)
			{
				$campus = $record['campus'];
				$buil_id = $record['buil_id'];
				$builname = $record['building'];
				$disable_b = $record['disable_b'];
				$default_b = $record['default_b'];

				++$i;
				$row =
				($insert==$buil_id
				 ? "esrs_row_add"
				 : ($update==$buil_id
				    ? "esrs_row_edit"
				    : (($i % 2) > 0
				       ? "esrs_row_1"
				       : "esrs_row_2")));

			// enable base64 = manage_depts=1&enable=1; disable base64 = manage_users=1&disable=1
				$toggle_disable =
				(ord($disable_b) > 0
				 ? "(<a id=\"esrs_toggle_on\" class=\"esrs_toggle_on\" href=\"javascript:\" onClick=\"esrs_set('esrs_find','enable_b','".$buil_id."');\">enable</a>)"
				 : "(<a id=\"esrs_toggle_off\" class=\"esrs_toggle_off\" href=\"javascript:\" onClick=\"esrs_set('esrs_find','disable_b','".$buil_id."');\">disable</a>)"
				);

				$toggle_default =
				(ord($default_b) > 0 ? "<b>default</b>" :
				"<a href=\"javascript:\" onClick=\"esrs_set('esrs_find','default_b','".$buil_id."')\">default</a>");

				$record_list .=
				"
				<tr>
				<td id=\"$row\" class=\"$row\" width=40><a href=\"javascript:\" onClick=\"esrs_set('esrs_find','edit_id','".$buil_id."')\">edit</a></td>
				<td id=\"$row\" class=\"$row\">$toggle_disable $builname</td>
				<td id=\"$row\" class=\"$row\">$campus</td>
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
			<td id=\"$row\" class=\"$row\" colspan=10 align=center>-- none available --</td>
			</tr>
			";
		} //end else

		return $record_list;

	} //end m_parse_records


	public function m_default_building($buil_id=0)
	{

		$sql = "select camp_id from buildings where buil_id = $buil_id";
		$result = o_db::m_select($sql);

		if (!is_array($result))
			return 0;

		$campus = $result[0]['camp_id'];

		$sql = "update buildings set default_b = 0 where camp_id = $campus and default_b = 1";
		$result = o_db::m_update($sql);

		$sql = "update buildings set default_b = 1 where buil_id = $buil_id";

		if ($result = o_db::m_update($sql))
			return 1;

		return 0;

	} //end m_default_building


	public function m_disable_building($buil_id=0)
	{

		$sql = "update buildings set disable_b = 1 where buil_id = $buil_id";

		if ($result = o_db::m_update($sql))
			return 1;

		return 0;

	} //end m_disable_building


	public function m_enable_building($buil_id=0)
	{

		$sql = "update buildings set disable_b = 0 where buil_id = $buil_id";

		if ($result = o_db::m_update($sql))
			return 1;

		return 0;

	} //end m_enable_building


	public function m_get_one_record($buil_id=0)
	{

		$sql = "select * from buildings where buil_id = $buil_id";
		$result = o_db::m_select($sql);

		if (is_array($result))
			return $result[0];

		return 0;

	} //end m_get_one_record

} //end o_building.php