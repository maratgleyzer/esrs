<?php /* Smarty version 2.6.20, created on 2009-01-10 03:24:26
         compiled from manage_courses.tpl */ ?>
<?php if ($this->_tpl_vars['_tools']['129']): ?>
<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => $this->_tpl_vars['change_form'], 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
<?php endif; ?>

<div class="title">Search for Courses:</div>

<table width="100%" border=0 cellpadding=0 cellspacing=4>
<form name="find" method="POST" action="http://<?php echo $this->_tpl_vars['host_url']; ?>
/index.php">
<input type=hidden name="sortorder" value="<?php echo $this->_tpl_vars['_find']['sortorder']; ?>
">
<tr>
<th class=label>Department</th>
<th class=label>Course ID</th>
<th class=label>Course Name</th>
<th class=label>Administrator</th>
<th class=label>Disabled</th>
<td width=1 align=right><input class=esrs_submit type=submit name="find_courses" value="FIND >>"></td>
</tr><tr>
<td valign=top><?php echo $this->_tpl_vars['_find']['menu_departments']; ?>
</td>
<td valign=top class=field><input class=esrs_text type=text name="crse_number" maxlength=10 size=10 value="<?php echo $this->_tpl_vars['_find']['crse_number']; ?>
"></td>
<td valign=top class=field><input class=esrs_text type=text name="course" maxlength=60 size=30 value="<?php echo $this->_tpl_vars['_find']['course']; ?>
"></td>
<td valign=top><?php echo $this->_tpl_vars['_find']['menu_admins']; ?>
</td>
<td valign=top align=center><input class=esrs_check type=checkbox name="disable" value="1"<?php if ($this->_tpl_vars['_find']['disable']): ?> checked<?php endif; ?>></td>
<td></td>
</tr></table>

</td></tr>
<tr><td align=top valign=top colspan=2 height="100%">

<table width="100%" border=0 cellpadding=2 cellspacing=0>
<tr>
<th class=label>&nbsp;</th>
<th class=label>Department &nbsp;<a href="javascript:" onClick="esrs_set('find','sortorder','d_u');"><img src="http://<?php echo $this->_tpl_vars['host_url']; ?>
/img/arrw_up.jpg" border=0></a><a href="javascript:" onClick="esrs_set('find','sortorder','d_d');"><img src="http://<?php echo $this->_tpl_vars['host_url']; ?>
/img/arrw_dwn.jpg" border=0></a></th>
<th class=label>Course ID &nbsp;<a href="javascript:" onClick="esrs_set('find','sortorder','n_u');"><img src="http://<?php echo $this->_tpl_vars['host_url']; ?>
/img/arrw_up.jpg" border=0></a><a href="javascript:" onClick="esrs_set('find','sortorder','n_d');"><img src="http://<?php echo $this->_tpl_vars['host_url']; ?>
/img/arrw_dwn.jpg" border=0></a></th>
<th class=label>(toggle) Course &nbsp;<a href="javascript:" onClick="esrs_set('find','sortorder','c_u');"><img src="http://<?php echo $this->_tpl_vars['host_url']; ?>
/img/arrw_up.jpg" border=0></a><a href="javascript:" onClick="esrs_set('find','sortorder','c_d');"><img src="http://<?php echo $this->_tpl_vars['host_url']; ?>
/img/arrw_dwn.jpg" border=0></a></th>
<th class=label>(toggle) Administrator &nbsp;<a href="javascript:" onClick="esrs_set('find','sortorder','r_u');"><img src="http://<?php echo $this->_tpl_vars['host_url']; ?>
/img/arrw_up.jpg" border=0></a><a href="javascript:" onClick="esrs_set('find','sortorder','r_d');"><img src="http://<?php echo $this->_tpl_vars['host_url']; ?>
/img/arrw_dwn.jpg" border=0></a></th>
<th class=label width=1>&nbsp;</th>
</tr>

<?php echo $this->_tpl_vars['course_list']; ?>


</form>
</table>