<?php //o_campus.php

class o_campus
{

	public function m_test_input($input=array(),$type="")
	{

		$campus       = $input['campus'];
		$domain       = $input['email_domain'];
		$alias        = $input['email_alias'];

		if (!$campus)
			return "You have not entered a 'Campus' name.";

		if (!$domain)
			return "You have not entered a 'Host Domain'.";

		if (!eregi("^[A-Z0-9_\.\-]+\.[A-Z]{2,3}$",$domain))
			return "'Host Domain' is in the wrong format. The correct format is &quot;[host_domain].(suffix)&quot;.";

		if (!$alias)
			return "You have not entered an 'Admin Alias'.";

		return 0;

	} //end m_test_input


	public function m_format_input($input=array(),$type="")
	{

		$input['campus']         = o_db::m_db_escape($input['campus']);

		$input['email_domain']   = o_db::m_db_escape(strtolower($input['email_domain']));

		$input['email_alias']    = o_db::m_db_escape(strtolower($input['email_alias']));

		return $input;

	} //end m_format_input


	public function m_save_record($input=array())
	{

		$campus       = $input['campus'];
		$domain       = $input['email_domain'];
		$alias        = $input['email_alias'];

		$sql =
		"
		insert into
		campuses (`campus`,`email_domain`,`email_alias`)
		 values (\"$campus\",\"$domain\",\"$alias\");
		";
		$result = o_db::m_insert($sql);

		//echo $result;

		return $result;

	} //end m_save_record


	public function m_edit_record($input=array())
	{

		$edit_id       = $input['edit_id'];

		$campus        = $input['campus'];
		$domain        = $input['email_domain'];
		$alias         = $input['email_alias'];

		$sql =
		"
		update campuses
		set campus = \"$campus\",
		    email_domain = \"$domain\",
		    email_alias = \"$alias\"
		where camp_id = $edit_id
		";
		$result = o_db::m_update($sql);

		if ($result == 0) 
			return 0;

		return $edit_id;

	} //end m_edit_record


	public function m_filter_records()
	{

		$sort = $input['sortorder'];

		$sql =
		"
		select
		campus,
		camp_id,
		email_domain,
		email_alias,
		default_c
		from campuses
		order by campus
		";

		//echo $sql;

		$result = o_db::m_select($sql);

		if (is_array($result))
			return $result;

		return 0;

	} //end m_filter_records


	public function m_parse_records($records=array(),$insert=0,$update=0)
	{

		if (is_array($records))
		{
			foreach ($records as $record)
			{
				$camp_id   = $record['camp_id'];
				$campus    = $record['campus'];
				$domain    = $record['email_domain'];
				$alias     = $record['email_alias'];
				$default_c = $record['default_c'];

				++$i;
				$row =
				($insert==$camp_id
				 ? "esrs_row_add"
				 : ($update==$camp_id
				    ? "esrs_row_edit"
				    : (($i % 2) > 0
				       ? "esrs_row_1"
				       : "esrs_row_2")));


				$toggle_default =
				(ord($default_c) > 0 ? "<b>default</b>" :
				"<a href=\"javascript:\" onClick=\"esrs_set('esrs_find','default_c','".$camp_id."')\">default</a>");

				$record_list .=
				"
				<tr>
				<td id=\"$row\" class=\"$row\" width=40><a href=\"javascript:\" onClick=\"esrs_set('esrs_find','edit_id','".$camp_id."')\">edit</a></td>
				<td id=\"$row\" class=\"$row\"><b>$camp_id</b></td>
				<td id=\"$row\" class=\"$row\">$campus</td>
				<td id=\"$row\" class=\"$row\">$domain</td>
				<td id=\"$row\" class=\"$row\">$alias</td>
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


	public function m_default_campus($camp_id=0)
	{

		$sql = "update campuses set default_c = 0 where default_c = 1";
		$result = o_db::m_update($sql);

		$sql = "update campuses set default_c = 1 where camp_id = $camp_id";

		if ($result = o_db::m_update($sql))
			return 1;

		return 0;

	} //end m_default_campus


	public function m_get_one_record($camp_id=0)
	{

		$sql = "select * from campuses where camp_id = $camp_id";
		$result = o_db::m_select($sql);

		if (is_array($result))
			return $result[0];

		return 0;

	} //end m_get_one_record

} //end o_campus.php