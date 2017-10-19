<?php /* Smarty version 2.6.20, created on 2009-01-11 04:45:35
         compiled from manage_users.tpl */ ?>
<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => $this->_tpl_vars['change_form'], 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>

<div class="title">Search for Users:</div>

<table width="100%" border=0 cellpadding=0 cellspacing=4>
<form name="find" method="POST" action="http://<?php echo $this->_tpl_vars['host_url']; ?>
/index.php">
<input type=hidden name="sortorder" value="<?php echo $this->_tpl_vars['_find']['sortorder']; ?>
">
<tr>
<th class=label>Last Name</th>
<th class=label>First Name</th>
<th class=label>Campus ID</th>
<th class=label>User Role</th>
<th class=label>Disabled</th>
<td width=1 align=right><input class=esrs_submit type=submit name="find_users" value="FIND >>"></td>
</tr>
<tr>
<td valign=top class=field><input class=esrs_text type=text name="last_name" maxlength=20 size=10 value="<?php echo $this->_tpl_vars['_find']['last_name']; ?>
"></td>
<td valign=top class=field><input class=esrs_text type=text name="first_name" maxlength=20 size=10 value="<?php echo $this->_tpl_vars['_find']['first_name']; ?>
"></td>
<td valign=top class=field><input class=esrs_text type=text name="campus_id" maxlength=10 size=10 value="<?php echo $this->_tpl_vars['_find']['campus_id']; ?>
"></td>
<td valign=top><?php echo $this->_tpl_vars['_find']['menu_user_roles']; ?>
</td>
<td valign=top align=center><input class=esrs_check type=checkbox name="disable" value="1"<?php if ($this->_tpl_vars['_find']['disable']): ?> checked<?php endif; ?>></td>
<td></td>
</tr></table>

</td></tr>
<tr><td align=top valign=top colspan=2 height="100%">

<table width="100%" border=0 cellpadding=2 cellspacing=0>
<tr>
<th class=label width=1>&nbsp;</th>
<th class=label>(toggle) Last Name, First &nbsp;<a href="javascript:" onClick="esrs_set('find','sortorder','n_u');"><img src="http://<?php echo $this->_tpl_vars['host_url']; ?>
/img/arrw_up.jpg" border=0></a><a href="javascript:" onClick="esrs_set('find','sortorder','n_d');"><img src="http://<?php echo $this->_tpl_vars['host_url']; ?>
/img/arrw_dwn.jpg" border=0></a></th>
<th class=label>Campus ID &nbsp;<a href="javascript:" onClick="esrs_set('find','sortorder','c_u');"><img src="http://<?php echo $this->_tpl_vars['host_url']; ?>
/img/arrw_up.jpg" border=0></a><a href="javascript:" onClick="esrs_set('find','sortorder','c_d');"><img src="http://<?php echo $this->_tpl_vars['host_url']; ?>
/img/arrw_dwn.jpg" border=0></a></th>
<th class=label>(toggle) User Role &nbsp;<a href="javascript:" onClick="esrs_set('find','sortorder','r_u');"><img src="http://<?php echo $this->_tpl_vars['host_url']; ?>
/img/arrw_up.jpg" border=0></a><a href="javascript:" onClick="esrs_set('find','sortorder','r_d');"><img src="http://<?php echo $this->_tpl_vars['host_url']; ?>
/img/arrw_dwn.jpg" border=0></a></th>
<th class=label>Date Created &nbsp;<a href="javascript:" onClick="esrs_set('find','sortorder','d_u');"><img src="http://<?php echo $this->_tpl_vars['host_url']; ?>
/img/arrw_up.jpg" border=0></a><a href="javascript:" onClick="esrs_set('find','sortorder','d_d');"><img src="http://<?php echo $this->_tpl_vars['host_url']; ?>
/img/arrw_dwn.jpg" border=0></a></th>
<th class=label width=1>&nbsp;</th>
</tr>

<?php echo $this->_tpl_vars['user_list']; ?>


</form>
</table>