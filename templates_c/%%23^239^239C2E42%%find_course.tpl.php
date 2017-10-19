<?php /* Smarty version 2.6.20, created on 2009-02-01 10:32:42
         compiled from find_course.tpl */ ?>
<div id="esrs_search" class="esrs_search">

<span id="esrs_heading" class="esrs_heading">Search for Courses:</span>

<table width="100%" border=0 cellpadding=0 cellspacing=4>
<form name="esrs_find" method="POST" action="http://<?php echo $this->_tpl_vars['host_url']; ?>
/">
<input type=hidden name="sortorder" value="<?php echo $this->_tpl_vars['_find']['sortorder']; ?>
">
<tr>
<td id="esrs_label" class="esrs_label">Department</td>
<td id="esrs_label" class="esrs_label">Course ID</td>
<td id="esrs_label" class="esrs_label">Course Name</td>
<td id="esrs_label" class="esrs_label">Administrator</td>
<td id="esrs_label" class="esrs_label" width=1>Disabled</td>
<td width=1><input id="esrs_submit" class="esrs_submit" type=submit name="find_course" value="FIND >>"></td>
</tr>
<tr>
<td id="esrs_field" class="esrs_field"><?php echo $this->_tpl_vars['_find']['menu_departments']; ?>
</td>
<td id="esrs_field" class="esrs_field"><input id="esrs_text" class="esrs_text" type=text name="esrs_find[crse_number]" maxlength=10 size=10 value="<?php echo $this->_tpl_vars['_find']['crse_number']; ?>
"></td>
<td id="esrs_field" class="esrs_field"><input id="esrs_text" class="esrs_text" type=text name="esrs_find[course]" maxlength=60 size=30 value="<?php echo $this->_tpl_vars['_find']['course']; ?>
"></td>
<td id="esrs_field" class="esrs_field"><?php echo $this->_tpl_vars['_find']['menu_admins']; ?>
</td>
<td align=center><input id="esrs_check" class="esrs_check" type=checkbox name="esrs_find[disable]" value="1"<?php if ($this->_tpl_vars['_find']['disable']): ?> checked<?php endif; ?>></td>
<td><input id="esrs_submit" class="esrs_submit" type=reset value="- reset -"></td>
</tr></table>

</div>

<div id="esrs_data" class="esrs_data">

<table width="100%" border=0 cellpadding=3 cellspacing=0>
<tr>
<td id="esrs_label" class="esrs_label" width=40>&nbsp;</td>
<td id="esrs_label" class="esrs_label">Department &nbsp;<a href="javascript:" onClick="esrs_set('esrs_find','sortorder','d_u');"><img src="http://<?php echo $this->_tpl_vars['host_url']; ?>
/img/arrw_up.jpg" border=0></a><a href="javascript:" onClick="esrs_set('esrs_find','sortorder','d_d');"><img src="http://<?php echo $this->_tpl_vars['host_url']; ?>
/img/arrw_dwn.jpg" border=0></a></td>
<td id="esrs_label" class="esrs_label">Course ID &nbsp;<a href="javascript:" onClick="esrs_set('esrs_find','sortorder','n_u');"><img src="http://<?php echo $this->_tpl_vars['host_url']; ?>
/img/arrw_up.jpg" border=0></a><a href="javascript:" onClick="esrs_set('esrs_find','sortorder','n_d');"><img src="http://<?php echo $this->_tpl_vars['host_url']; ?>
/img/arrw_dwn.jpg" border=0></a></td>
<td id="esrs_label" class="esrs_label">(toggle) Course &nbsp;<a href="javascript:" onClick="esrs_set('esrs_find','sortorder','c_u');"><img src="http://<?php echo $this->_tpl_vars['host_url']; ?>
/img/arrw_up.jpg" border=0></a><a href="javascript:" onClick="esrs_set('esrs_find','sortorder','c_d');"><img src="http://<?php echo $this->_tpl_vars['host_url']; ?>
/img/arrw_dwn.jpg" border=0></a></td>
<td id="esrs_label" class="esrs_label">(toggle) Administrator &nbsp;<a href="javascript:" onClick="esrs_set('esrs_find','sortorder','r_u');"><img src="http://<?php echo $this->_tpl_vars['host_url']; ?>
/img/arrw_up.jpg" border=0></a><a href="javascript:" onClick="esrs_set('esrs_find','sortorder','r_d');"><img src="http://<?php echo $this->_tpl_vars['host_url']; ?>
/img/arrw_dwn.jpg" border=0></a></td>
<td id="esrs_label" class="esrs_label" width=1>&nbsp;</th>
</tr>

<?php echo $this->_tpl_vars['record_list']; ?>


</form>
</table>

</div>