<?php //o_term.php

class o_term
{

	public function m_test_input($input=array())
	{

		$peri_id     = $input['peri_id'];
		$sect_id     = $input['sect_id'];
		$term_year   = $input['term_year'];

		if (!$peri_id)
			return "You have not made a 'Period' selection.";

		if (!$sect_id)
			return "You have not made a 'Section' selection.";

		if (!$term_year)
			return "You have not made a 'Year' selection.";

	} //end m_test_input


	public function m_format_input($input=array(),$type="")
	{
		return $input;
	} //end m_format_input


	public function m_save_record($input=array())
	{

		$peri_id    = $input['peri_id'];
		$sect_id    = $input['sect_id'];
		$term_year  = $input['term_year'];
		$term_id    = $term_year.$peri_id.$sect_id;

		$sql =
		"
		insert into
		 terms (`term_id`,`peri_id`,`sect_id`,`term_year`)
		values ($term_id,$peri_id,$sect_id,\"$term_year\")
		";

		$result = o_db::m_insert($sql);

		if (!$result || !is_int($result))
			return $result;

		return $term_id;

	} //end m_save_record


	public function m_edit_record($input=array())
	{

		$edit_id     = $input['edit_id'];

		$peri_id     = $input['peri_id'];
		$sect_id     = $input['sect_id'];
		$term_year   = $input['term_year'];

		$term_id     = $term_year.$peri_id.$sect_id;

		$sql =
		"
		update terms
		set term_id = $term_id,
		    peri_id = $peri_id,
		    sect_id = $sect_id,
		    term_year = $term_year
		where term_id = $edit_id
		";

		$result = o_db::m_update($sql);

		if ($result == 0) 
			return 0;

		return $term_id;

	} //end m_edit_record


	public function m_get_periods()
	{

		$sql = "select peri_id,period from periods order by period";
		$result = o_db::m_select($sql);

		if (is_array($result))
			return $result;

		return 0;

	} //end m_get_periods


	public function m_menu_periods($peri_id=0,$type="")
	{

		$periods = self::m_get_periods();

		if (is_array($periods))
		{
			foreach ($periods as $period)
			{
				$xperi_id = $period['peri_id'];
				$periname = $period['period'];
				$menu .= "<option value=\"$xperi_id\""
				.($xperi_id == $peri_id ? " selected" : "")
				.">$periname</option>";
			} //end foreach
		} //end if

		else
		{
			$menu .= "<option value=\"\">-- none available --</option>";
		} //end else

		$menu =
		"
		<select id=\"esrs_menu\" class=\"esrs_menu\" name=\"esrs_$type"."[peri_id]\">
		<option value=0>select a period</option>
		$menu
		</select>
		";

		return $menu;

	} //end m_menu_periods


	public function m_get_sections()
	{

		$sql = "select sect_id,section from sections order by section";
		$result = o_db::m_select($sql);

		if (is_array($result))
			return $result;

		return 0;

	} //end m_get_sections


	public function m_menu_sections($sect_id=0,$type="")
	{

		$sections = self::m_get_sections();

		if (is_array($sections))
		{
			foreach ($sections as $section)
			{
				$xsect_id = $section['sect_id'];
				$sectname = $section['section'];
				$menu .= "<option value=\"$xsect_id\""
				.($xsect_id == $sect_id ? " selected" : "")
				.">$sectname</option>";
			} //end foreach
		} //end if

		else
		{
			$menu .= "<option value=\"\">-- none available --</option>";
		} //end else

		$menu =
		"
		<select id=\"esrs_menu\" class=\"esrs_menu\" name=\"esrs_$type"."[sect_id]\">
		<option value=0>select a section</option>
		$menu
		</select>
		";

		return $menu;

	} //end m_menu_sections


	public function m_get_years()
	{

		$min = date("Y");
		$max = date("Y")+4;

		for ($i=$min;$i<$max;$i++)
			$years[]=$i;

		return $years;

	} //end m_get_vars


	public function m_menu_years($term_year=0,$type="")
	{

		if ($term_year < 1)
			$term_year = date("Y");

		$years = self::m_get_years();

		if (is_array($years))
		{
			while (list($key,$year) = each($years))
			{
				$menu .= "<option value=\"$year\""
				.($year == $term_year ? " selected" : "")
				.">$year</option>";
			} //end while
		} //end if

		else
		{
			$menu .= "<option value=\"\">-- none --</option>";
		} //end else

		$menu =
		"
		<select id=\"esrs_menu\" class=\"esrs_menu\" name=\"esrs_$type"."[term_year]\">
		$menu
		</select>
		";

		return $menu;

	} //end m_menu_years


	public function m_filter_records()
	{

		$year = date("Y");

		$sql =
		"
		select
		t.term_id,
		t.term_year,
		t.disable_t,
		t.default_t,
		p.period,
		s.section
		from terms `t`,periods `p`,sections `s`
		where t.peri_id = p.peri_id
		  and t.sect_id = s.sect_id
		  and t.term_year >= $year
		order by t.term_id desc";

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
				$term_id = $record['term_id'];
				$term_year = $record['term_year'];
				$period = $record['period'];
				$section = $record['section'];
				$disable = $record['disable_t'];
				$default = $record['default_t'];

				$toggle_default =
				(ord($default) > 0 ? "<b>default</b>" :
				"<a href=\"javascript:\" onClick=\"esrs_set('esrs_find','default_t','".$term_id."')\">default</a>");

				$toggle_disable =
				(ord($disable) > 0
				 ? "(<a id=\"esrs_toggle_on\" class=\"esrs_toggle_on\" href=\"javascript:\" onClick=\"esrs_set('esrs_find','enable_t','".$term_id."');\">enable</a>)"
				 : "(<a id=\"esrs_toggle_off\" class=\"esrs_toggle_off\" href=\"javascript:\" onClick=\"esrs_set('esrs_find','disable_t','".$term_id."');\">disable</a>)");

				++$i;
				$row =
				($insert==$term_id
				 ? "esrs_row_add"
				 : ($update==$term_id
				    ? "esrs_row_edit"
				    : (($i % 2) > 0
				       ? "esrs_row_1"
				       : "esrs_row_2")));

				$term_list .=
				"
				<tr>
				<td id=\"$row\" class=\"$row\" width=40><a href=\"javascript:\" onClick=\"esrs_set('esrs_find','edit_id','".$term_id."');\">edit</a></td>
				<td id=\"$row\" class=\"$row\">$toggle_disable $section, $period $term_year</td>
				<td id=\"$row\" class=\"$row\">$section</td>
				<td id=\"$row\" class=\"$row\">$period</td>
				<td id=\"$row\" class=\"$row\">$term_year</td>
				<td id=\"$row\" class=\"$row\" width=1>$toggle_default</td>
				</tr>
				";
			} //end foreach
		} //end if

		else
		{
			$term_list .=
			"
			<tr>
			<td id=\"esrs_row_1\" class=\"esrs_row_1\" colspan=10 align=center>-- none available --</td>
			</tr>
			";
		} //end else

		return $term_list;

	} //end m_parse_records


	public function m_disable_term($term_id=0)
	{

		$sql = "update terms set disable_t = 1 where term_id = $term_id";

		if ($result = o_db::m_update($sql))
			return 1;

		return 0;

	} //end m_disable_term


	public function m_enable_term($term_id=0)
	{

		$sql = "update terms set disable_t = 0 where term_id = $term_id";

		if ($result = o_db::m_update($sql))
			return 1;

		return 0;

	} //end m_enable_term


	public function m_default_term($term_id=0)
	{

		$sql = "update terms set default_t = 0 where default_t = 1";
		$result = o_db::m_update($sql);

		$sql = "update terms set default_t = 1 where term_id = $term_id";

		if ($result = o_db::m_update($sql))
			return 1;

		return 0;

	} //end m_default_term


	public function m_get_one_record($term_id=0)
	{

		$sql = "select * from terms where term_id = $term_id";
		$result = o_db::m_select($sql);

		if (is_array($result))
			return $result[0];

		return 0;

	} //end m_get_one_record

} //end o_term.php