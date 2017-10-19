<?php //_esrs.php

class _esrs
{
//create array objects and public constants
	public $p_db = array();

	public $p_config = array();

	public $p_query = array();

	public $p_session = array();

	public $p_console = array();

	public $p_user = array();

	public $p_department = array();

	public $p_course = array();

	public $p_exam = array();

	public $page_start = 0;

	public $page_limit = 0;


	function __construct()
	{
//no need for construct function body
	}


//trims stings to default length for html table display
	public function trim_value($string)
	{

	//get the default maximum character width configuration parameter
		$max_column_width = $this->_config['display']['max_column_width'];
	//chop the string to max length and add a '...'
		$short_string = ((strlen($string) > $max_column_width) ? substr($string,0,$max_column_width)."..." : $string);

		return $short_string;

	} //end trim_value


	public function sendemail($mail_id=0,$fields=array(),$cc_admin=0)
	{

		$sql = "select * from sys_emails where mail_id = $mail_id" ;
		$result = o_db::m_select($sql) ;

		if (!is_array($result))
			return 1 ;

		$email = $result[0] ;

		$mail_from   = $email['mail_from'] ;
		$mail_to     = $email['mail_to'] ;
		$mail_title  = $email['mail_title'] ;
		$mail_body   = $email['mail_body'] ;

		$mail_from   = eregi_replace("<email_domain>",$fields['email_domain'],$mail_from);
		$mail_to     = eregi_replace("<email_address>",$fields['email_address'],$mail_to);

		while (list($key,$val) = each($fields))
		{
			$mail_body = eregi_replace("<$key>",$val,$mail_body) ;
			$mail_title = eregi_replace("<$key>",$val,$mail_title) ;
		} //end while

		$mail_head  .= ($cc_admin ? "BCC: <$mail_from> \n" : "");
		$mail_head  .= "Reply-To: ESRS Notice <$mail_from> \n";
		$mail_head  .= "From: ESRS Notice <$mail_from> \n";
		$mail_head  .= "MIME-Version: 1.0 \n";
		$mail_head  .= "Content-Type: text/plain; charset=us-ascii \n";
		$mail_head  .= "Content-Transfer-Encoding: 8bit \n";
		$mail_head  .= "X-Priority: 1 (Highest) \n";
		$mail_head  .= "X-Mailer: ESRS Mail \n";

		if (!mail( $mail_to, $mail_title, $mail_body, $mail_head ))
			return 1;

		return 0;

	} //end sendemail


	public function console($role_id=1,$console=0)
	{

		$sql =
		"
		select t.*
		from users2tools `u2t`,sys_tools `t`
		where u2t.role_id = $role_id
		  and u2t.disable_u2t = 0
		  and u2t.tool_id = t.tool_id
		  and t.disable_t = 0
		";

		$result = o_db::m_select($sql);

		if (is_array($result))
		{
			foreach ($result as $row)
			{
				$row['on'] = ($console == $row['tool_id'] ? 1 : 0);
				$row['url'] = o_query::m_encode_q("console=".$row['tool_id']);
				$this->_tools[$row['tool_id']] = $row;
			} //end foreach
		} //end if

	} //end console


	public function m_default_layout()
	{
		$this->_header = "default/header.tpl";
		$this->_footer = "default/footer.tpl";
	} //end m_default_layout


	public function m_set_layout()
	{

		if (($this->campus > 0) &&
		    file_exists($this->p_config['system']['root_path']."/templates/campus/".$this->campus."/header.tpl"))
		{
			$this->_header = "campus/".$this->campus."/header.tpl";
			$this->_footer = "campus/".$this->campus."/footer.tpl";
			return 0;
		} //end if

		if ($this->department > 0 &&
		    file_exists($this->p_config['system']['root_path']."/templates/department/".$this->department."/header.tpl"))
		{
			$this->_header = "department/".$this->department."/header.tpl";
			$this->_footer = "department/".$this->department."/footer.tpl";
			return 0;
		} //end if

		$sql =
		"
		select
		camp_id
		from campuses
		where default_c = 1
		";

		$result = o_db::m_select($sql);

		if (is_array($result))
		{
			$this->campus = $result[0]['camp_id'];

			if (file_exists($this->p_config['system']['root_path']."/templates/campus/".$this->campus."/header.tpl"))
			{
				$this->_header = "campus/".$this->campus."/header.tpl";
				$this->_footer = "campus/".$this->campus."/footer.tpl";
				return 0;
			} //end if
		} //end if

		self::m_default_layout();

	} //end m_set_layout


	public function m_get_campus_domain($campus=0,$depart=0)
	{

		if (!$campus && !$depart)
		{
			$sql = "select email_domain from campuses where default_c = 1";
			$result = o_db::m_select($sql);

			if (is_array($result)) return $result[0]['email_domain'];
		} //end if

		if ($campus > 0)
		{
			$sql = "select email_domain from campuses where camp_id = $campus";
			$result = o_db::m_select($sql);

			if (is_array($result)) return $result[0]['email_domain'];
		} //end if

		if ($depart > 0)
		{
			$sql =
			"
			select c.email_domain

			from campuses `c`,
			departments `d`

			where d.dept_id = $depart
			  and d.camp_id = c.camp_id
			";
			$result = o_db::m_select($sql);

			if (is_array($result)) return $result[0]['email_domain'];
		} //end if

		return 0;

	} //end m_get_campus_domain


//gets the campus and department email aliases, defaults to campus email
	public function m_get_campus_alias($campus=0,$depart=0)
	{

		if (!$campus && !$depart)
		{
			$sql = "select email_alias from campuses where default_c = 1";
			$result = o_db::m_select($sql);

			if (is_array($result)) return $result[0]['email_alias'];
		} //end if

		if ($campus > 0)
		{
			$sql = "select email_alias from campuses where camp_id = $campus";
			$result = o_db::m_select($sql);

			if (is_array($result)) return $result[0]['email_alias'];
		} //end if

		if ($depart > 0)
		{
			$sql =
			"
			select c.email_alias

			from campuses `c`,
			departments `d`

			where d.dept_id = $depart
			  and d.camp_id = c.camp_id
			";

			$result = o_db::m_select($sql);

			if (is_array($result))
				return $result[0]['email_alias'];
		} //end if

		return 0;

	} //end m_get_campus_alias


//return a select menu of result per page options
	public function m_menu_page_limits($form)
	{

		$this->paging_options =
		"
		<select id=\"esrs_menu\" class=\"esrs_menu\" name='esrs_select_limit' onchange=\"javascript:esrs_display_per_page($form,this.value);\">
		<option value='25'".(($this->page_limit == 25) ? " selected" : "").">25 / page</option>
		<option value='50'".(($this->page_limit == 50) ? " selected" : "").">50 / page</option>
		<option value='75'".(($this->page_limit == 75) ? " selected" : "").">75 / page</option>
		<option value='100'".(($this->page_limit == 100) ? " selected" : "").">100 / page</option>
		<option value='150'".(($this->page_limit == 150) ? " selected" : "").">150 / page</option>
		<option value='200'".(($this->page_limit == 200) ? " selected" : "").">200 / page</option>
		<option value='250'".(($this->page_limit == 250) ? " selected" : "").">250 / page</option>
		</select>
		";

	} //end m_menu_page_limits


//return a select menu of page to display options
	public function m_menu_display_page($form,$start,$total,$limit)
	{

		$max_pages = ceil($total / $limit);
		$page_options = '';

		$current_page = floor($max_pages * ($start / $total));

		$page_diff = $max_pages - $current_page;

		$i_start = ($current_page > 15 ? $current_page - 15 : 0);
		$i_limit = ($page_diff > 15 ? $i_start + 30 : $max_pages);

		for ($i = $i_start; $i < $i_limit; ++$i)
		{
			$page_options .= "<option value=\"".($i * $limit)."\"".(($i == $current_page) ? " selected" : "").">page ".($i + 1)."</option>";
		} //end for

		$this->page_select =
		"
		<select id=\"esrs_menu\" class=\"esrs_menu\" name='esrs_select_start' onchange=\"javascript:esrs_go_to_page($form,this.value);\">
		$page_options
		</select>
		";

	} //end m_menu_display_page


//paging routine
	public function m_paging($form,$count,$start,$limit,$sql) {

	//count the rows of the query
		$sql = "select count(*) as 'total' $sql limit 1";

		$result = o_db::m_select($sql);
		$total = $result[0]['total'];

	//echo "$total <br> $count";

		if ($total == 0 || $count == 0)
			return 0;
		if ($start > $total)
			return 0;

	//the page requested is the current page plus the number of rows passed for the current page
	//this way, if there are less than the limit of results for the requested page
	//(eg. a limit range could be 1-50, but only 32 rows were retrieved, so we would show 1-32)
		$place = $start + $count;

	//if the whole result set for the sql query is the same amount as the current page passed
	//then paging is NOT needed because there is only 1 page of results available for the query
		if ($total >= $place)
		{
		//displayed in the colored box on the left of the paging block
			$range = ($start + 1)." - ".$place." / $total";
			$this->page_range = $range;
		} //end if

		if ($total > $count)
		{

		//get the results per page select menu
			_esrs::m_menu_page_limits($form);
		//get the page to display select menu
			_esrs::m_menu_display_page($form,$start,$total,$limit);

		} //end if

	//determin which buttons should appear on the requested page
	//the first page has only a next button, no previous
	//the last page has only a previous button, no next

	//if the total number of rows available in the dataset equals where we're at
	//then do NOT paint a next button
		$this->next_butt = (($total > $place) ? "<input id=\"esrs_submit\" class=\"esrs_submit\" type=submit name=\"esrs_page_next\" value=\"Next $limit\">" : "&nbsp;");

	//if we're on the first page of the result
	//then do NOT paint a previous button
		$this->prev_butt = (($start > 0) ? "<input id=\"esrs_submit\" class=\"esrs_submit\" type=submit name=\"esrs_page_prev\" value=\"Prev $limit\">" : "&nbsp;") ;

		$this->do_paging = 1;

	} //end m_paging


	public function m_get_value($key="")
	{
		return $this->$key;
	} //end m_get_value


	public function m_set_value($key="",$value="")
	{
		$this->$key = $value;
	} //end m_set_value

} //end _esrs.php