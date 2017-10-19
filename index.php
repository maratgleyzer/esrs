<?php //index.php

//error_reporting(E_ALL);
//ini_set("display_errors", 1);

if ($_SERVER['HTTP_USER_AGENT'])
{


	session_cache_expire(60);
	session_cache_limiter ('private,must-revalidate');
	session_set_cookie_params(0,'/');
	session_start();


	//initiate the system with global vars and object starts
	require_once("_autoload.php");


	//set the default smarty templates
	$_esrs->_console = "console.tpl";
	$_esrs->_portal  = "portal.tpl";
	$_esrs->_signin  = "signin.tpl";
	$_esrs->_signup  = "signup.tpl";
	$_esrs->_paging  = "paging.tpl";


	//set local configuration params
	$_esrs->host_url     = $_esrs->p_config['system']['host_url'];
	$_esrs->crypt_seed   = base64_decode($_esrs->p_config['admin']['crypt_seed']);

	$_esrs->campus =
	($o_query->m_get('campus') > 0
	 ? $o_query->m_get('campus')
	 : $o_session->m_get_value('campus'));

	$_esrs->department =
	($o_query->m_get('department') > 0
	 ? $o_query->m_get('department')
	 : $o_session->m_get_value('department'));

	///////
	$_esrs->department = 12;
	///////

	if (!($_esrs->email_alias = $_esrs->m_get_campus_alias($_esrs->campus,$_esrs->department)))
		$_esrs->email_alias = $_esrs->p_config['display']['email_alias'];

	if (!($_esrs->email_domain = $_esrs->m_get_campus_domain($_esrs->campus,$_esrs->department)))
		$_esrs->email_domain = $_esrs->p_config['display']['email_domain'];

	$o_session->m_add_value('campus',$_esrs->campus);
	$o_session->m_add_value('department',$_esrs->department);

	$o_query->p_post['host_url'] = $_esrs->host_url;
	$o_query->p_post['email_alias'] = $_esrs->email_alias;
	$o_query->p_post['email_domain'] = $_esrs->email_domain;

	if ($o_query->p_post['roster'])
	{
		$_esrs->m_default_layout();
		$_esrs->_console = "roster.tpl";
	} //end if

	else
	{
		$_esrs->m_set_layout();
	} //end else

	if ($o_query->m_post('use_role'))
	{

		if ($o_query->m_post('user_id'))
		{
			$o_session->m_add_value('user_id',$o_query->m_post('user_id'));
			$o_session->m_add_value('role_id',$o_query->m_post('use_role'));

			$sql =
			"
			update users2roles
			   set lastlog_u2r = NOW()
			where user_id = "
			.$o_query->m_post('user_id')
			." and role_id = "
			.$o_query->m_post('use_role');

			o_db::m_update($sql);

			$_esrs->_role_home = "role_".$o_query->m_post('use_role').".tpl";
		}

		$o_session->m_unset_value('console');

	} //end user_role

	if ($o_query->m_post('login'))
	{

		$o_user = new o_user();
		$o_user->m_login($o_query->p_post,$_esrs->crypt_seed);

		$_esrs->login_pass = $o_user->p_login_pass;
		$_esrs->login_fail = $o_user->p_login_fail;

		$_esrs->_fields = $o_user->p_fields;

		switch ($o_user->p_status)
		{
			case 2:
			$_esrs->_result = $o_user->p_result;
			$_esrs->_role_play = "roles.tpl";
			break;

			case 1:
			$o_session->m_add_value('user_id',$o_user->p_user_id);
			$o_session->m_add_value('role_id',$o_user->p_role_id);
			$_esrs->_role_home = "role_".$o_user->p_role_id.".tpl";
			break;
		}

	} //end login

	if ($o_query->m_post('logout'))
	{
		$o_session->m_logout();
	} //end logout

	if ($o_query->m_post('register'))
	{

		$o_user = new o_user();

		$o_user->m_register($o_query->p_post['esrs_add'],$_esrs->crypt_seed,$_esrs->email_domain,$_esrs->host_url);

		$_esrs->register_pass = $o_user->p_register_pass;
		$_esrs->register_fail = $o_user->p_register_fail;

		$_esrs->_fields = $o_user->p_fields;

	} //end register

	if ($o_query->m_post('verify'))
	{

		$o_user = new o_user();

		if ($o_user->m_verify($o_query->p_post,$_esrs->crypt_seed,$_esrs->email_domain) == true)
		{
			$o_user->m_login($o_query->p_post,$_esrs->crypt_seed);

			$_esrs->login_pass = $o_user->p_login_pass;
			$_esrs->login_fail = $o_user->p_login_fail;

			$_esrs->_fields = $o_user->p_fields;

			switch ($o_user->p_status)
			{
				case 2:
				$_esrs->_result = $o_user->p_result;
				$_esrs->_role_play = "roles.tpl";
				break;
				case 1:
				$o_session->m_add_value('user_id',$o_user->p_user_id);
				$o_session->m_add_value('role_id',$o_user->p_role_id);
				$_esrs->_role_home = "role_".$o_user->p_role_id.".tpl";
				break;
			}
		}

	} //end verify

	$_esrs->user_id = $o_session->m_get_value('user_id');
	$_esrs->role_id = $o_session->m_get_value('role_id');


	if ((isset($_esrs->user_id) && ($_esrs->user_id > 0)) &&
	    (isset($_esrs->role_id) && ($_esrs->role_id > 0)))
	{

		$_esrs->_authorized = true;

		if ($o_query->m_get('console'))
			$o_session->m_add_value('console',$o_query->m_get('console'));

		$_esrs->console($_esrs->role_id,$o_session->m_get_value('console'));

		$_esrs->_home_link = $o_query->m_encode_q("use_role=".$_esrs->role_id."&user_id=".$_esrs->user_id);
		$_esrs->_logout_link = $o_query->m_encode_q("logout=".$_esrs->user_id.$_esrs->role_id);

		if ($o_session->m_get_value('console'))
		{

			$tool_id = $o_session->m_get_value('console');

			$suffix = $_esrs->_tools[$tool_id]['suffix'];

			$object = "o_$suffix";

			$utility = new $object();

			$add  = $o_query->m_post("add_$suffix");

			$edit = $o_query->m_post('edit_id');

			$find = $o_query->m_post("find_$suffix");

			$_esrs->_data_search = "find_$suffix.tpl";
			$_esrs->_add = $o_query->m_post('esrs_add');
			$_esrs->_edit = $o_query->m_post('esrs_edit');
			$_esrs->_find = $o_query->m_post('esrs_find');

			if ($o_query->m_post('jump_menu'))
			{
				unset($add); unset($edit); unset($find);
			}

			$_esrs->_find['sortorder'] = $o_query->m_post('sortorder');

			//paging: determine if a page to view was requested; default 0 (1 in the select menu)
			$_esrs->select_start         = ($o_query->m_post('esrs_select_start') ? $o_query->m_post('esrs_select_start') : "0");
			//paging: determine if a number of results per page was selected; defaults to results_per_page value in _fsnep.config
			$_esrs->select_limit         = ($o_query->m_post('esrs_select_limit') ? $o_query->m_post('esrs_select_limit') : $_esrs->p_config['display']['results_per_page']);

			//paging: set the hidden inputs page_start and page_limit to the 'go to page' and 'display per page' select menu values
			$_esrs->page_start           = $_esrs->select_start;
			$_esrs->page_limit           = $_esrs->select_limit;

			//paging: determine which button was clicked
			$_esrs->page_next            = $o_query->m_post('esrs_page_next');
			$_esrs->page_prev            = $o_query->m_post('esrs_page_prev');

			//paging: if next button, increment the go to page select menu and set the page_start hidden input value
			if ($_esrs->page_next)
			{
				$_esrs->select_start         += $_esrs->page_limit;
				$_esrs->page_start           = $_esrs->select_start;
			}

			//paging: if next button, decrement the go to page select menu and set the page_limit hidden input value
			if ($_esrs->page_prev)
			{
				$_esrs->select_start         -= ($_esrs->select_start >= $_esrs->page_limit ? $_esrs->page_limit : 0);
				$_esrs->page_start           = $_esrs->select_start;
			}

			if ($add)
			{

				$error = $utility->m_test_input($_esrs->_add,'add');

				if ($error)
				{
					$_esrs->add_fail = $error;
				}

				else
				{

					$_esrs->_add['host_url'] = $_esrs->host_url;
					$_esrs->_add['crypt_seed'] = $_esrs->crypt_seed;

					$_esrs->_add['email_domain'] = ($_esrs->_add['email_domain'] ? $_esrs->_add['email_domain'] : $_esrs->email_domain);

					$clean_data = $utility->m_format_input($_esrs->_add,'add');

					$insert =
					$utility->m_save_record($clean_data);

				}

			} //end add

			if ($edit)
			{

				if (is_array($_esrs->_edit))
				{

					$error =
					$utility->m_test_input($_esrs->_edit,'edit');

					if ($error)
					{

						$_esrs->add_fail = $error;

					}

					else
					{

						$_esrs->_edit['edit_id'] = $edit;
						$_esrs->_edit['crypt_seed'] = $_esrs->crypt_seed;
						$_esrs->_edit['email_domain'] = ($_esrs->_edit['email_domain'] ? $_esrs->_edit['email_domain'] : $_esrs->email_domain);

						$clean_data = $utility->m_format_input($_esrs->_edit,'edit');

						$update =
						$utility->m_edit_record($clean_data,'edit');

					}

				}

				else
				{

					$_esrs->_edit = $utility->m_get_one_record($edit);

					eregi("[^@]+@([^@]+)",$_esrs->_edit['email_address'],$domain_part);
					if (is_array($domain_part)) $_esrs->_edit['email_domain'] = $domain_part[1];

				}

			} //end edit

			switch ($object)
			{

				case 'o_user':

				if ($add)
				{

					if (!$error)
					{

						if (is_numeric($insert))
						{

							if ($insert > 0)
							{

								$_esrs->add_pass =
								"The submitted user has been saved to the system.";

								$_esrs->_add['role']          = $clean_data['role'];
								$_esrs->_add['username']      = $clean_data['username'];
								$_esrs->_add['password']      = $clean_data['password'];
								$_esrs->_add['email_address'] = $clean_data['email_address'];

								$_esrs->_add['email_query'] = $o_query->m_encode_q("verify=$insert"
								."&username=".$_esrs->_add['username']."&password=".$_esrs->_add['password']);

								/*email*/   $error = $_esrs->sendemail(124,$_esrs->_add,1) ;

								if ($error)
								{
									$_esrs->add_fail = "An error has occurred, and the user's registration email could not be sent.";
								}

								else
								{
									$_esrs->add_pass .= " A registration and verification email with login information has been sent to the user's registered email address.";
								}

								$_esrs->_find['user_id'] = substr($insert,0,-1);
								unset($_esrs->_add);

							}

							else
							{
								$_esrs->add_fail = "An error has occurred, and the submitted user could not be saved.";
							}

						}

						else if (eregi("duplicate",$insert))
						{
							$_esrs->add_fail = "You are attempting to create a duplicate user record.";
						}

					}

				} //end add

				if ($edit)
				{

					if (!$error)
					{

						if (is_numeric($update))
						{

							if ($update > 0)
							{

								$_esrs->add_pass =
								"The submitted user has been editted.";

								$_esrs->_find['user_id'] = substr($edit,0,-1);
								unset($_esrs->_edit);
								unset($edit);

							}

							else
							{
								$_esrs->add_fail = "You have not made any changes to this user record.";

								$_esrs->_edit = $utility->m_get_one_record($edit);
								$_esrs->_find['user_id'] = substr($edit,0,-1);
							}

						}

						else if (eregi("duplicate",$update))
						{
							$_esrs->add_fail = "You are attempting to create a duplicate user record.";
						}

					}

				} //end edit

				//disable the desired user2role relationship
				if ($o_query->m_post('disable_u2r'))
				if ($utility->m_disable_role($o_query->m_post('disable_u2r')))
				$_esrs->add_pass = "The submitted user role has been DISABLED.";

				//enable the desired user2role relationship
				if ($o_query->m_post('enable_u2r'))
				if ($utility->m_enable_role($o_query->m_post('enable_u2r')))
				$_esrs->add_pass = "The submitted user role has been ENABLED.";

				//disable the desired user
				if ($o_query->m_post('disable_u'))
				if ($utility->m_disable_user($o_query->m_post('disable_u')))
				$_esrs->add_pass = "The submitted user has been DISABLED.";

				//enable the desired user
				if ($o_query->m_post('enable_u'))
				if ($utility->m_enable_user($o_query->m_post('enable_u')))
				$_esrs->add_pass = "The submitted user has been ENABLED.";

				if ($edit)
				{

					$_esrs->_edit['menu_user_roles'] =
					$utility->m_menu_roles($_esrs->role_id,
					$_esrs->_edit['role_id'],
					'edit');

					$_esrs->_edit['menu_domains'] =
					$utility->m_menu_domains(
					$_esrs->_edit['email_domain'],
					'edit');

				}

				else
				{

					$_esrs->_add['menu_user_roles'] =
					$utility->m_menu_roles($_esrs->role_id,
					$_esrs->_add['role_id'],
					'add');

					$_esrs->_add['menu_domains'] =
					$utility->m_menu_domains(
					$_esrs->_add['email_domain'],
					'add');

				}

				$_esrs->_find['menu_user_roles'] =
				$utility->m_menu_roles($_esrs->role_id,
				$_esrs->_find['role_id'],
				'find');

				$_esrs->records =
				$utility->m_filter_records(
				$_esrs->role_id,$_esrs->_find,
				$_esrs->page_start,$_esrs->page_limit);

				//get all available users (apply 'find' filter)
				$_esrs->record_list = $utility->m_parse_records(
				$_esrs->records,$insert,($edit ? $edit : $update));

				$_esrs->m_paging("esrs_find",
				count($_esrs->records),$_esrs->page_start,
				$_esrs->page_limit,$utility->sql_base);

				break; //end case


				case 'o_department':

				if ($add)
				{

					if (!$error)
					{

						if (is_numeric($insert))
						{

							if ($insert > 0)
							{

								$_esrs->add_pass = "The submitted department has been saved to the system.";
								unset($_esrs->_add);

							}

							else
							{
								$_esrs->add_fail = "An error has occurred, and the submitted department could not be saved.";
							}

						}

						else if (eregi("duplicate",$insert))
						{
							$_esrs->add_fail = "You are attempting to create a duplicate department record.";
						}

					}

				} //end add

				if ($edit)
				{

					if (!$error)
					{

						if (is_numeric($update))
						{

							if ($update > 0)
							{
								$_esrs->add_pass = "The submitted department has been editted.";

								unset($_esrs->_edit);
								unset($edit);

							}

							else
							{
								$_esrs->add_fail = "You have not made any changes to this department record.";

								$_esrs->_edit = $utility->m_get_one_record($edit);
							}

						}

						else if (eregi("duplicate",$update))
						{
							$_esrs->add_fail = "You are attempting to create a duplicate department record.";
						}

					}

				} //end edit

				//disable the desired user2dept relationship
				if ($o_query->m_post('default_d'))
				{
					if ($utility->m_default_department($o_query->m_post('default_d')))
						$_esrs->add_pass = "The submitted department is now the DEFAULT department for the related campus.";
					else $_esrs->add_fail = "An error has occured and the submitted department cannot be assigned the DEFAULT.";
				}

				//disable the desired user2dept relationship
				if ($o_query->m_post('disable_d'))
				if ($utility->m_disable_department($o_query->m_post('disable_d')))
				$_esrs->add_pass = "The submitted department has been DISABLED.";

				//enable the desired user2dept relationship
				if ($o_query->m_post('enable_d'))
				if ($utility->m_enable_department($o_query->m_post('enable_d')))
				$_esrs->add_pass = "The submitted department has been ENABLED.";

				//disable the desired user2dept relationship
				if ($o_query->m_post('disable_u2d'))
				if ($utility->m_disable_admin($o_query->m_post('disable_u2d')))
				$_esrs->add_pass = "The submitted department administrator has been DISABLED.";

				//enable the desired user2dept relationship
				if ($o_query->m_post('enable_u2d'))
				if ($utility->m_enable_admin($o_query->m_post('enable_u2d')))
				$_esrs->add_pass = "The submitted department administrator has been ENABLED.";

				if ($edit)
				$_esrs->_edit['menu_campus'] =
				$utility->m_menu_campuses(
				$_esrs->_edit['camp_id'],
				'edit');

				else
				$_esrs->_add['menu_campus'] =
				$utility->m_menu_campuses(
				$_esrs->_add['camp_id'],
				'add');

				$_esrs->_add['menu_admins'] =
				$utility->m_menu_admins(0,0,$_esrs->_add['user2role_id'],'add');

				$_esrs->_edit['menu_admins'] =
				$utility->m_menu_admins(0,$edit,$_esrs->_edit['user2role_id'],'edit');

				$_esrs->records = $utility->m_filter_records(
				$_esrs->user_id,$_esrs->role_id,$_esrs->_find);

				//get all available departments (apply 'find' filter)
				$_esrs->record_list = $utility->m_parse_records(
				$_esrs->records,$insert,($edit ? $edit : $update),
				$_esrs->role_id);

				break; //end case


				case 'o_course':

				if ($add)
				{

					if (!$error)
					{

						if (is_numeric($insert))
						{

							if ($insert > 0)
							{
								$_esrs->add_pass = "The submitted course has been saved to the system.";

								$_esrs->_find['crse_id'] = $edit;
								unset($_esrs->_add);

							}

							else
							{
								$_esrs->add_fail = "An error has occurred, and the submitted course could not be saved.";
							}

						}

						else if (eregi("duplicate",$insert))
						{
							$_esrs->add_fail = "You are attempting to create a duplicate course record.";
						}

					}

				} //end add

				if ($edit)
				{

					if (!$error)
					{

						if (is_numeric($update))
						{

							if ($update > 0)
							{
								$_esrs->add_pass = "The submitted course has been editted.";

								$_esrs->_find['crse_id'] = $edit;
								unset($_esrs->_edit);
								unset($edit);

							}

							else
							{
								$_esrs->add_fail = "You have not made any changes to this course record.";

								$_esrs->_edit = $utility->m_get_one_record($edit);
								$_esrs->_find['crse_id'] = $edit;
							}

						}

						else if (eregi("duplicate",$update))
						{
							$_esrs->add_fail = "You are attempting to create a duplicate course record.";
						}

					}

				} //end edit

				//default the desired course
				if ($o_query->m_post('default_c'))
				{
					if ($utility->m_default_course($o_query->m_post('default_c')))
						$_esrs->add_pass = "The submitted course is now the DEFAULT course for the related department.";
					else $_esrs->add_fail = "An error has occured and the submitted course cannot be assigned the DEFAULT.";
				}

				//disable the desired course
				if ($o_query->m_post('disable_c'))
				if ($utility->m_disable_course($o_query->m_post('disable_c')))
				$_esrs->add_pass = "The submitted course has been DISABLED.";

				//enable the desired course
				if ($o_query->m_post('enable_c'))
				if ($utility->m_enable_course($o_query->m_post('enable_c')))
				$_esrs->add_pass = "The submitted course has been ENABLED.";

				//disable the desired user2course relationship
				if ($o_query->m_post('disable_u2c'))
				if ($utility->m_disable_admin($o_query->m_post('disable_u2c')))
				$_esrs->add_pass = "The submitted course adminstrator has been DISABLED.";

				//enable the desired user2course relationship
				if ($o_query->m_post('enable_u2c'))
				if ($utility->m_enable_admin($o_query->m_post('enable_u2c')))
				$_esrs->add_pass = "The submitted course administrator has been ENABLED.";

				if ($edit)
				{

					$_esrs->_edit['menu_departments'] =
					$utility->m_menu_departments(
					$_esrs->user_id,$_esrs->role_id,
					$_esrs->_edit['dept_id'],
					'edit');

					$_esrs->_edit['menu_admins'] =
					$utility->m_menu_admins(
					$_esrs->user_id,$_esrs->role_id,0,
					$_esrs->_edit['user2role_id'],
					'edit');

				}

				else
				{

					$_esrs->_add['menu_departments'] =
					$utility->m_menu_departments(
					$_esrs->user_id,$_esrs->role_id,
					$_esrs->_add['dept_id'],
					'add');

					$_esrs->_add['menu_admins'] =
					$utility->m_menu_admins(
					$_esrs->user_id,$_esrs->role_id,0,
					$_esrs->_add['user2role_id'],
					'add');

				}

				$_esrs->_find['menu_departments'] =
				$utility->m_menu_departments(
				$_esrs->user_id,$_esrs->role_id,
				$_esrs->_find['dept_id'],
				'find');

				$_esrs->_find['menu_admins'] =
				$utility->m_menu_admins(0,0,0,
				$_esrs->_find['user2role_id'],
				'find');

				$_esrs->records = $utility->m_filter_records(
				$_esrs->user_id,$_esrs->role_id,$_esrs->_find,
				$_esrs->page_start,$_esrs->page_limit);

				//get all available departments (apply 'find' filter)
				$_esrs->record_list = $utility->m_parse_records(
				$_esrs->records,$insert,($edit ? $edit : $update),
				$_esrs->role_id);

				$_esrs->m_paging("esrs_find",
				count($_esrs->records),$_esrs->page_start,
				$_esrs->page_limit,$utility->sql_base);

				break; //end case


				case 'o_exam':

				if ($add)
				{

					if (!$error)
					{

						if (is_numeric($insert))
						{

							if ($insert > 0)
							{
								$_esrs->add_pass = "The submitted exam has been saved to the system.";

								$_esrs->_find['exam_id'] = $insert;
								unset($_esrs->_add['facilitators']);

							}

							else
							{
								$_esrs->add_fail = "An error has occurred, and the submitted exam could not be saved.";
							}

						}

						else if (eregi("duplicate",$insert))
						{
							$_esrs->add_fail = "You are attempting to create a duplicate exam record.";
						}

					}

				} //end add

				if ($edit)
				{

					if (!$error)
					{

						if (is_numeric($update))
						{

							if ($update > 0)
							{
								$_esrs->add_pass = "The submitted exam has been editted.";

								$_esrs->_find['exam_id'] = $edit;
								unset($_esrs->_edit);
								unset($edit);

							}

							else
							{
								$_esrs->add_fail = "You have not made any changes to this exam record.";

								$_esrs->_edit = $utility->m_get_one_record($edit);
								$_esrs->_find['exam_id'] = $edit;
							}

						}

						else if (eregi("duplicate",$update))
						{
							$_esrs->add_fail = "You are attempting to create a duplicate exam record.";
						}

					}

				} //end edit

				//disable the desired exam
				if ($o_query->m_post('disable_e'))
					if ($utility->m_disable_exam($o_query->m_post('disable_e')))
						$_esrs->add_fail = "You cannot disable an exam which has populated sessions.";
					else $_esrs->add_pass = "The submitted exam has been DISABLED.";

				//enable the desired exam
				if ($o_query->m_post('enable_e'))
					if ($utility->m_enable_exam($o_query->m_post('enable_e')))
						$_esrs->add_pass = "The submitted exam has been ENABLED.";

				if ($edit)
				{

					$start_date_array_4 =
					$utility->m_menu_dates("a",
					$_esrs->_edit['a_month'],
					$_esrs->_edit['a_day'],
					$_esrs->_edit['a_year'],
					$_esrs->_edit['a_time'],
					'edit');

					$stops_date_array_4 =
					$utility->m_menu_dates("b",
					$_esrs->_edit['b_month'],
					$_esrs->_edit['b_day'],
					$_esrs->_edit['b_year'],
					$_esrs->_edit['b_time'],
					'edit');

					$start_date_array_5 =
					$utility->m_menu_dates("y",
					$_esrs->_edit['y_month'],
					$_esrs->_edit['y_day'],
					$_esrs->_edit['y_year'],
					$_esrs->_edit['y_time'],
					'edit');

					$stops_date_array_5 =
					$utility->m_menu_dates("z",
					$_esrs->_edit['z_month'],
					$_esrs->_edit['z_day'],
					$_esrs->_edit['z_year'],
					$_esrs->_edit['z_time'],
					'edit');

					$_esrs->_edit['menu_a_month'] =
					$start_date_array_4['m'];
					$_esrs->_edit['menu_a_day'] =
					$start_date_array_4['d'];

					$_esrs->_edit['menu_b_month'] =
					$stops_date_array_4['m'];
					$_esrs->_edit['menu_b_day'] =
					$stops_date_array_4['d'];
					$_esrs->_edit['menu_b_year'] =
					$stops_date_array_4['y'];

					$_esrs->_edit['menu_y_month'] =
					$start_date_array_5['m'];
					$_esrs->_edit['menu_y_day'] =
					$start_date_array_5['d'];

					$_esrs->_edit['menu_z_month'] =
					$stops_date_array_5['m'];
					$_esrs->_edit['menu_z_day'] =
					$stops_date_array_5['d'];
					$_esrs->_edit['menu_z_year'] =
					$stops_date_array_5['y'];

					$_esrs->_edit['menu_departments'] =
					$utility->m_menu_departments(
					$_esrs->user_id,$_esrs->role_id,
					$_esrs->_edit['dept_id'],
					'edit');

					$_esrs->_edit['menu_courses'] =
					$utility->m_menu_courses(
					$_esrs->user_id,$_esrs->role_id,
					$_esrs->_edit['dept_id'],
					$_esrs->_edit['crse_id'],
					'edit');

					$_esrs->_edit['menu_terms'] =
					$utility->m_menu_terms(
					$_esrs->_edit['term_id'],
					'edit');

					$_esrs->_edit['menu_facilitators'] =
					$utility->m_menu_facilitators(
					$_esrs->_edit['dept_id'],
					$_esrs->_edit['facilitators'],
					'edit');

				}

				else
				{

					$start_date_array_4 =
					$utility->m_menu_dates("a",
					$_esrs->_add['a_month'],
					$_esrs->_add['a_day'],
					$_esrs->_add['a_year'],
					$_esrs->_add['a_time'],
					'add');

					$stops_date_array_4 =
					$utility->m_menu_dates("b",
					$_esrs->_add['b_month'],
					$_esrs->_add['b_day'],
					$_esrs->_add['b_year'],
					$_esrs->_add['b_time'],
					'add');

					$start_date_array_5 =
					$utility->m_menu_dates("y",
					$_esrs->_add['y_month'],
					$_esrs->_add['y_day'],
					$_esrs->_add['y_year'],
					$_esrs->_add['y_time'],
					'add');

					$stops_date_array_5 =
					$utility->m_menu_dates("z",
					$_esrs->_add['z_month'],
					$_esrs->_add['z_day'],
					$_esrs->_add['z_year'],
					$_esrs->_add['z_time'],
					'add');

					$_esrs->_add['menu_a_month'] =
					$start_date_array_4['m'];
					$_esrs->_add['menu_a_day'] =
					$start_date_array_4['d'];

					$_esrs->_add['menu_b_month'] =
					$stops_date_array_4['m'];
					$_esrs->_add['menu_b_day'] =
					$stops_date_array_4['d'];
					$_esrs->_add['menu_b_year'] =
					$stops_date_array_4['y'];

					$_esrs->_add['menu_y_month'] =
					$start_date_array_5['m'];
					$_esrs->_add['menu_y_day'] =
					$start_date_array_5['d'];

					$_esrs->_add['menu_z_month'] =
					$stops_date_array_5['m'];
					$_esrs->_add['menu_z_day'] =
					$stops_date_array_5['d'];
					$_esrs->_add['menu_z_year'] =
					$stops_date_array_5['y'];

					$_esrs->_add['menu_departments'] =
					$utility->m_menu_departments(
					$_esrs->user_id,$_esrs->role_id,
					$_esrs->_add['dept_id'],
					'add');

					$_esrs->_add['menu_courses'] =
					$utility->m_menu_courses(
					$_esrs->user_id,$_esrs->role_id,
					$_esrs->_add['dept_id'],
					$_esrs->_add['crse_id'],
					'add');

					$_esrs->_add['menu_terms'] =
					$utility->m_menu_terms(
					$_esrs->_add['term_id'],
					'add');

					$_esrs->_add['menu_facilitators'] =
					$utility->m_menu_facilitators(
					$_esrs->_add['dept_id'],
					$_esrs->_add['facilitators'],
					'add');

				}

				$_esrs->_find['menu_departments'] =
				$utility->m_menu_departments(
				$_esrs->user_id,$_esrs->role_id,
				$_esrs->_find['dept_id'],
				'find');

				$_esrs->_find['menu_courses'] =
				$utility->m_menu_courses(
				$_esrs->user_id,$_esrs->role_id,
				$_esrs->_find['dept_id'],
				$_esrs->_find['crse_id'],
				'find');

				$_esrs->_find['menu_terms'] =
				$utility->m_menu_terms(
				$_esrs->_find['term_id'],
				'find');

				$_esrs->records = $utility->m_filter_records(
				$_esrs->_find,$_esrs->user_id,$_esrs->role_id,
				$_esrs->page_start,$_esrs->page_limit);

				//get all available terms
				$_esrs->record_list = $utility->m_parse_records(
				$_esrs->records,$insert,($edit ? $edit : $update));

				$_esrs->m_paging("esrs_find",
				count($_esrs->records),$_esrs->page_start,
				$_esrs->page_limit,$utility->sql_base);

				break; //end case


				case 'o_session':

				$roster = $o_query->m_post('roster');
				$rsvp   = $o_query->m_post('rsvp');

				//hide the desired session
				if ($o_query->m_post('disable_u2s'))
					if ($update = $utility->m_disable_user($o_query->m_post('disable_u2s')))
						$_esrs->add_pass = "The submitted user has been DISABLED and the number registered for this session decremented by 1.";
					else $_esrs->add_fail = "An error occured and the submitted user cannot be DISABLED.";

				//hide the desired session
				if ($o_query->m_post('enable_u2s'))
					if ($update = $utility->m_enable_user($o_query->m_post('enable_u2s')))
						$_esrs->add_pass = "The submitted user has been ENABLED and the number registered for this session incremented by 1.";
					else $_esrs->add_fail = "An error occored an the submitted user cannot be ENABLED.";

				//display the session roster
				if ($roster > 0)
				{

					$_esrs->roster_list =
					$utility->m_parse_roster(
					$_esrs->role_id,$roster);

					echo $_esrs->roster_list;
					exit;

				}

				else
				{

					if ($add)
					{

						if (!$error)
						{

							if (is_numeric($insert))
							{

								if ($insert > 0)
								{

									$_esrs->add_pass =
									"The submitted session has been saved to the system.";

									$_esrs->_find['sesn_id'] = $insert;

								}

								else
								{
									$_esrs->add_fail = "An error has occurred, and the submitted session could not be saved.";
								}

							}

							else if (eregi("duplicate",$insert))
							{
								$_esrs->add_fail = "You are attempting to create a duplicate session record.";
							}

						}

					} //end add

					if ($edit)
					{

						if (!$error)
						{

							if (is_numeric($update))
							{

								if ($update > 0)
								{

									$_esrs->add_pass =
									"The submitted session has been editted.";

									$_esrs->_find['sesn_id'] = $edit;
									unset($_esrs->_edit);
									unset($edit);

								}

								else
								{
									$_esrs->add_fail =
									"You have not made any changes to this session record.";

									$_esrs->_edit = $utility->m_get_one_record($edit);
									$_esrs->_find['sesn_id'] = $edit;
								}

							}

							else if (eregi("duplicate",$update))
							{
								$_esrs->add_fail = "You are attempting to create a duplicate session record.";
							}

						} //end edit

					}

					//rsvp for an exam session
					if ($rsvp > 0)
					{

						$error = $utility->m_rsvp_session(
						$_esrs->user_id,$_esrs->role_id,$rsvp);

						if ($error)
						{

							$_esrs->add_fail =
							"<br>We apologize for any inconvenience but you cannot be registered to session $rsvp at this time. Either you are already attending this session, or it has just recently filled up. If you believe you are receiving this message in error, please contact the (ESRS) administrator <a href=\"mailto:madmin@".$_esrs->host_url."\">madmin@".$_esrs->host_url."</a>.";

						}

						else
						{

							$_esrs->add_pass =
							"<br>SUCCESS! You have been registered to attend Exam Session $rsvp. You will receive a session reminder email a day or two before your session is scheduled to take place. In the meanwhile, if you have any questions, please contact the (ESRS) administrator <a href=\"mailto:madmin@".$_esrs->host_url."\">madmin@".$_esrs->host_url."</a>.";

						}

					}

					if (!$_esrs->_add['capacity'])
						$_esrs->_add['capacity'] = 5;

					//hide the desired session
					if ($o_query->m_post('hide'))
						if ($utility->m_hide_session($o_query->m_post('hide')))
							$_esrs->add_fail = "You cannot hide a session which has registrations.";
						else $_esrs->add_pass = "The submitted session has been HIDDEN.";

					//show the desired session
					if ($o_query->m_post('show'))
						if ($utility->m_show_session($o_query->m_post('show')))
							$_esrs->add_pass = "The submitted session has been SHOWN.";

					//disable the desired session
					if ($o_query->m_post('disable_s'))
						if ($utility->m_disable_session($o_query->m_post('disable_s')))
							$_esrs->add_pass = "The submitted session has been DISABLED.";
						else $_esrs->add_fail = "You cannot disable a session which has registrations.";

					//enable the desired session
					if ($o_query->m_post('enable_s'))
						if ($utility->m_enable_session($o_query->m_post('enable_s')))
							$_esrs->add_pass = "The submitted session has been ENABLED.";

					if ($edit)
					{

						$start_date_array =
						$utility->m_menu_dates("a",
						$_esrs->_edit['a_month'],
						$_esrs->_edit['a_day'],
						$_esrs->_edit['a_year'],
						$_esrs->_edit['a_time'],
						'edit');

						$stops_date_array =
						$utility->m_menu_dates("z",
						$_esrs->_edit['a_month'],
						$_esrs->_edit['a_day'],
						$_esrs->_edit['a_year'],
						$_esrs->_edit['z_time'],
						'edit');

						$_esrs->_edit['menu_a_month'] =
						$start_date_array['m'];
						$_esrs->_edit['menu_a_day'] =
						$start_date_array['d'];
						$_esrs->_edit['menu_a_year'] =
						$start_date_array['y'];

						$_esrs->_edit['menu_a_time'] =
						$start_date_array['t'];
						$_esrs->_edit['menu_z_time'] =
						$stops_date_array['t'];

						$_esrs->_edit['menu_departments'] =
						$utility->m_menu_departments(
						$_esrs->user_id,$_esrs->role_id,
						$_esrs->_edit['dept_id'],
						'edit');

						$_esrs->_edit['menu_exams'] =
						$utility->m_menu_exams(
						$_esrs->user_id,$_esrs->role_id,
						$_esrs->_edit['dept_id'],
						$_esrs->_edit['exam_id'],
						'edit');

						$_esrs->_edit['menu_rooms'] =
						$utility->m_menu_rooms(
						$_esrs->_edit['dept_id'],
						$_esrs->_edit['room_id'],
						'edit');

						$_esrs->_edit['menu_facilitators'] =
						$utility->m_menu_facilitators(
						$_esrs->_edit['exam_id'],
						$_esrs->_edit['faculty'],
						'edit');

					}

					else
					{

						$start_date_array =
						$utility->m_menu_dates("a",
						$_esrs->_add['a_month'],
						$_esrs->_add['a_day'],
						$_esrs->_add['a_year'],
						$_esrs->_add['a_time'],
						'add');

						$stops_date_array =
						$utility->m_menu_dates("z",
						$_esrs->_add['a_month'],
						$_esrs->_add['a_day'],
						$_esrs->_add['a_year'],
						$_esrs->_add['z_time'],
						'add');

						$_esrs->_add['menu_a_month'] =
						$start_date_array['m'];
						$_esrs->_add['menu_a_day'] =
						$start_date_array['d'];
						$_esrs->_add['menu_a_year'] =
						$start_date_array['y'];

						$_esrs->_add['menu_a_time'] =
						$start_date_array['t'];
						$_esrs->_add['menu_z_time'] =
						$stops_date_array['t'];

						$_esrs->_add['menu_departments'] =
						$utility->m_menu_departments(
						$_esrs->user_id,$_esrs->role_id,
						$_esrs->_add['dept_id'],
						'add');

						$_esrs->_add['menu_exams'] =
						$utility->m_menu_exams(
						$_esrs->user_id,$_esrs->role_id,
						$_esrs->_add['dept_id'],
						$_esrs->_add['exam_id'],
						'add');

						$_esrs->_add['menu_rooms'] =
						$utility->m_menu_rooms(
						$_esrs->_add['dept_id'],
						$_esrs->_add['room_id'],
						'add');

						$_esrs->_add['menu_facilitators'] =
						$utility->m_menu_facilitators(
						$_esrs->_add['exam_id'],
						$_esrs->_add['faculty'],
						'add');

					}

					$_esrs->_find['menu_departments'] =
					$utility->m_menu_departments(
					$_esrs->user_id,$_esrs->role_id,
					$_esrs->_find['dept_id'],
					'find');

					$_esrs->_find['menu_exams'] =
					$utility->m_menu_exams(
					$_esrs->user_id,$_esrs->role_id,
					$_esrs->_find['dept_id'],
					$_esrs->_find['exam_id'],
					'find');

					$_esrs->_find['menu_rooms'] =
					$utility->m_menu_rooms(
					$_esrs->_find['dept_id'],
					$_esrs->_find['room_id'],
					'find');

					if ($find || ($_esrs->role_id < 4) ||
					    $_esrs->_find['sortorder'] ||
					    $o_query->m_post('rsvp') ||
					    $o_query->m_post('hide') ||
					    $o_query->m_post('show'))
					{

						if ($_esrs->role_id > 4)
						{

							if (!$_esrs->_find['dept_id'])
							{
								$_esrs->add_fail = "Please select a 'Department' from the drop-down menu below.";
								$_esrs->_find['no_labels'] = true;
							}

							elseif (!$_esrs->_find['exam_id'])
							{
								$_esrs->add_fail = "Please select an 'Exam Course/Term' from the drop-down menu below.";
								$_esrs->_find['no_labels'] = true;
							}

							else
							{
								$_esrs->records = $utility->m_filter_records(
								$_esrs->_find,$_esrs->user_id,$_esrs->role_id);

								if (is_array($_esrs->records))
									$_esrs->records[0]['host_url'] = $_esrs->host_url;

								//get all available sessions
								$_esrs->record_list = $utility->m_parse_records(
								$_esrs->records,$insert,($edit ? $edit : $update),
								$_esrs->user_id,$_esrs->role_id);
							}

						}

						else
						{

							$_esrs->records = $utility->m_filter_records(
							$_esrs->_find,$_esrs->user_id,$_esrs->role_id,
							$_esrs->page_start,$_esrs->page_limit);

							if (is_array($_esrs->records))
								$_esrs->records[0]['host_url'] = $_esrs->host_url;

							//get all available sessions
							$_esrs->record_list = $utility->m_parse_records(
							$_esrs->records,$insert,($edit ? $edit : $update),
							$_esrs->user_id,$_esrs->role_id);

							$_esrs->m_paging("esrs_find",
							count($_esrs->records),$_esrs->page_start,
							$_esrs->page_limit,$utility->sql_base);

						}

					}

					else
					{
						$_esrs->_find['no_labels'] = true;
					}

				}

				break; //end case


				case 'o_term':

				if ($add)
				{

					if (!$error)
					{

						if (is_numeric($insert))
						{

							if ($insert > 0)
							{

								$_esrs->add_pass = "The submitted term has been saved to the system.";

								unset($_esrs->_add);

							}

							else
							{
								$_esrs->add_fail = "An error has occurred, and the submitted term could not be saved.";
							}

						}

						else if (eregi("duplicate",$insert))
						{
							$_esrs->add_fail = "You are attempting to create a duplicate term record.";
						}

					}

				} //end add

				if ($edit)
				{

					if (!$error)
					{

						if (is_numeric($update))
						{

							if ($update > 0)
							{

								$_esrs->add_pass = "The submitted term has been editted.";

								unset($_esrs->_edit);
								unset($edit);

							}

							else
							{
								$_esrs->add_fail = "You have not made any changes to this term record.";

								$_esrs->_edit = $utility->m_get_one_record($edit);
							}

						}

						else if (eregi("duplicate",$update))
						{
							$_esrs->add_fail = "You are attempting to create a duplicate term record.";
						}

					}

				} //end edit

				//disable the desired term
				if ($o_query->m_post('disable_t'))
					if ($utility->m_disable_term($o_query->m_post('disable_t')))
						$_esrs->add_pass = "The submitted term has been DISABLED.";

				//enable the desired term
				if ($o_query->m_post('enable_t'))
					if ($utility->m_enable_term($o_query->m_post('enable_t')))
						$_esrs->add_pass = "The submitted term has been ENABLED.";

				//default the desired term
				if ($o_query->m_post('default_t'))
					if ($utility->m_default_term($o_query->m_post('default_t')))
						$_esrs->add_pass = "The submitted term is now assigned the DEFAULT.";

				if ($edit)
				{

					$_esrs->_edit['menu_periods'] =
					$utility->m_menu_periods($_esrs->_edit['peri_id'],'edit');

					$_esrs->_edit['menu_sections'] =
					$utility->m_menu_sections($_esrs->_edit['sect_id'],'edit');

					$_esrs->_edit['menu_years'] =
					$utility->m_menu_years($_esrs->_edit['term_year'],'edit');

				}

				else
				{

					$_esrs->_add['menu_periods'] =
					$utility->m_menu_periods($_esrs->_add['peri_id'],'add');

					$_esrs->_add['menu_sections'] =
					$utility->m_menu_sections($_esrs->_add['sect_id'],'add');

					$_esrs->_add['menu_years'] =
					$utility->m_menu_years($_esrs->_add['term_year'],'add');

				}

				$_esrs->records = $utility->m_filter_records();

				//get all available terms
				$_esrs->record_list = $utility->m_parse_records(
				$_esrs->records,$insert,($edit ? $edit : $update));

				break; //end case


				case 'o_room':

				if ($add)
				{

					if (!$error)
					{

						if (is_numeric($insert))
						{

							if ($insert > 0)
							{

								$_esrs->add_pass = "The submitted room has been saved to the system.";

								$_esrs->_find['room_id'] = $insert;
								unset($_esrs->_add);

							}

							else
							{
								$_esrs->add_fail = "An error has occurred, and the submitted room could not be saved.";
							}

						}

						else if (eregi("duplicate",$insert))
						{
							$_esrs->add_fail = "You are attempting to create a duplicate room record.";
						}

					}

				} //end add

				if ($edit)
				{

					if (!$error)
					{

						if (is_numeric($update))
						{

							if ($update > 0)
							{

								$_esrs->add_pass =
								"The submitted room has been editted.";

								$_esrs->_find['room_id'] = $edit;
								unset($_esrs->_edit);
								unset($edit);

							}

							else
							{
								$_esrs->add_fail =
								"You have not made any changes to this room record.";

								$_esrs->_edit = $utility->m_get_one_record($edit);
								$_esrs->_find['room_id'] = $edit;
							}

						}

						else if (eregi("duplicate",$update))
						{
							$_esrs->add_fail =
							"You are attempting to create a duplicate room record.";
						}

					}

				} //end edit

			//disable the desired building
				if ($o_query->m_post('default_r'))
				{
	 			//default the desired term
					if ($o_query->m_post('default_r'))
						if ($utility->m_default_room($o_query->m_post('default_r')))
							$_esrs->add_pass = "The submitted room is now assigned the DEFAULT for the associated building.";
						else $_esrs->add_fail = "An error occured and the submitted room cannot be assigned the DEFAULT.";

				if ($o_query->m_post('disable_r'))
					if ($utility->m_disable_room($o_query->m_post('disable_r')))
						$_esrs->add_pass = "The submitted room is now DISABLED.";

				if ($o_query->m_post('enable_r'))
					if ($utility->m_enable_room($o_query->m_post('enable_r')))
						$_esrs->add_pass = "The submitted room is now ENABLED.";

				if ($edit)
				{

					$_esrs->_edit['menu_campuses'] =
					$utility->m_menu_campuses($_esrs->_edit['camp_id'],'edit');

					$_esrs->_edit['menu_buildings'] =
					$utility->m_menu_buildings($_esrs->_edit['camp_id'],$_esrs->_edit['buil_id'],'edit');

				}

				else
				{

					$_esrs->_add['menu_campuses'] =
					$utility->m_menu_campuses($_esrs->_add['camp_id'],'add');

					$_esrs->_add['menu_buildings'] =
					$utility->m_menu_buildings($_esrs->_add['camp_id'],$_esrs->_add['buil_id'],'add');

				}

				$_esrs->_find['menu_campuses'] =
				$utility->m_menu_campuses($_esrs->_find['camp_id'],'find');

				$_esrs->_find['menu_buildings'] =
				$utility->m_menu_buildings($_esrs->_find['camp_id'],$_esrs->_find['buil_id'],'find');

				$_esrs->records = $utility->m_filter_records(
				$_esrs->_find,$_esrs->page_start,$_esrs->page_limit);

				//get all available rooms
				$_esrs->record_list = $utility->m_parse_records(
				$_esrs->records,$insert,($edit ? $edit : $update));

				$_esrs->m_paging("esrs_find",
				count($_esrs->records),$_esrs->page_start,
				$_esrs->page_limit,$utility->sql_base);

				break; //end case


				case 'o_building':

				if ($add)
				{

					if (!$error)
					{

						if (is_numeric($insert))
						{

							if ($insert > 0)
							{

								$_esrs->add_pass =
								"The submitted building has been saved to the system.";

								$_esrs->_find['buil_id'] = $insert;
								unset($_esrs->_add);

							}

							else
							{
								$_esrs->add_fail =
								"An error has occurred, and the submitted building could not be saved.";
							}

						}

						else if (eregi("duplicate",$insert))
						{
							$_esrs->add_fail =
							"You are attempting to create a duplicate building record.";
						}

					}

				} //end add


				if ($edit)
				{

					if (!$error)
					{

						if (is_numeric($update))
						{

							if ($update > 0)
							{

								$_esrs->add_pass =
								"The submitted building has been editted.";

								$_esrs->_find['buil_id'] = $edit;
								unset($_esrs->_edit);
								unset($edit);

							}

							else
							{
								$_esrs->add_fail =
								"You have not made any changes to this building record.";

								$_esrs->_edit = $utility->m_get_one_record($edit);
								$_esrs->_find['buil_id'] = $edit;
							}

						}

						else if (eregi("duplicate",$update))
						{
							$_esrs->add_fail =
							"You are attempting to create a duplicate building record.";
						}

					}

				} //end edit


			//disable the desired building
				if ($o_query->m_post('default_b'))
				{
					if ($o_query->m_post('default_b'))
						if ($utility->m_default_building($o_query->m_post('default_b')))
							$_esrs->add_pass = "The submitted building is now assigned the DEFAULT for the associated campus.";
						else $_esrs->add_fail = "An error occured and the submitted building cannot be assigned the DEFAULT.";
				}

				//disable the desired building
				if ($o_query->m_post('disable_b'))
					if ($utility->m_disable_building($o_query->m_post('disable_b')))
						$_esrs->add_pass = "The submitted building is now DISABLED.";

				//enable the desired building
				if ($o_query->m_post('enable_b'))
					if ($utility->m_enable_building($o_query->m_post('enable_b')))
						$_esrs->add_pass = "The submitted building is now ENABLED.";

				if ($edit)
					$_esrs->_edit['menu_campuses'] =
					$utility->m_menu_campuses($_esrs->_edit['camp_id'],
					'edit');

				else $_esrs->_add['menu_campuses'] =
					$utility->m_menu_campuses($_esrs->_edit['camp_id'],
					'add');

				$_esrs->_find['menu_campuses'] =
				$utility->m_menu_campuses($_esrs->_edit['camp_id'],
				'find');

				$_esrs->records = $utility->m_filter_records(
				$_esrs->_find,$_esrs->page_start,$_esrs->page_limit);

			//get all available buildings
				$_esrs->record_list = $utility->m_parse_records(
				$_esrs->records,$insert,($edit ? $edit : $update));

				$_esrs->m_paging("esrs_find",
				count($_esrs->records),$_esrs->page_start,
				$_esrs->page_limit,$utility->sql_base);

				break;


				case 'o_campus':

				if ($add)
				{

					if (!$error)
					{

						if (is_numeric($insert))
						{

							if ($insert > 0)
							{

								$_esrs->add_pass =
								"The submitted campus has been saved to the system.";

								$_esrs->_find['camp_id'] = $insert;
								unset($_esrs->_add);

							}

							else
							{
								$_esrs->add_fail =
								"An error has occurred, and the submitted campus could not be saved.";
							}

						}

						else if (eregi("duplicate",$insert))
						{
							$_esrs->add_fail =
							"You are attempting to create a duplicate campus record.";
						}

					}

				} //end add


				if ($edit)
				{

					if (!$error)
					{

						if (is_numeric($update))
						{

							if ($update > 0)
							{

								$_esrs->add_pass =
								"The submitted campus has been editted.";

								unset($_esrs->_edit);
								unset($edit);

							}

							else
							{
								$_esrs->add_fail =
								"You have not made any changes to this campus record.";

								$_esrs->_edit = $utility->m_get_one_record($edit);
							}

						}

						else if (eregi("duplicate",$update))
						{
							$_esrs->add_fail =
							"You are attempting to create a duplicate campus record.";
						}

					}

				} //end edit


			//default the desired campus
				if ($o_query->m_post('default_c'))
					if ($utility->m_default_campus($o_query->m_post('default_c')))
						$_esrs->add_pass = "The submitted campus is now assigned the DEFAULT.";

				$_esrs->records = $utility->m_filter_records();

			//get all available buildings
				$_esrs->record_list = $utility->m_parse_records(
				$_esrs->records,$insert,($edit ? $edit : $update));

				break; //end case

			} //end switch

		} //end if

	} //end if

	$_esrs->_data_change = ($_esrs->_tools[($tool_id+100)] ?
	($edit ? "edit_$suffix.tpl" : "add_$suffix.tpl") : "");

	//assign ever key/value pair of the _esrs object
	//to a variable of the Smary object
	while (list($key,$val) = each($_esrs))
	$_smarty->assign($key,$val);

	//call the _smarty object display function
	//display the templates requested
	$_smarty->display("index.tpl");


} //end index.php