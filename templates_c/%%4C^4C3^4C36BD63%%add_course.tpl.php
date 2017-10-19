<?php /* Smarty version 2.6.20, created on 2009-01-26 00:46:24
         compiled from add_course.tpl */ ?>
<div id="esrs_change" class="esrs_change">

<span id="esrs_heading" class="esrs_heading">Add a Course:</span>

<span id="esrs_pass" class="esrs_pass"><?php echo $this->_tpl_vars['add_pass']; ?>
</span>
<span id="esrs_fail" class="esrs_fail"><?php echo $this->_tpl_vars['add_fail']; ?>
</span>

<table width="100%" border=0 cellpadding=0 cellspacing=4>
<form name="esrs_add" method="POST" action="http://<?php echo $this->_tpl_vars['host_url']; ?>
/">
<tr>
<td id="esrs_label" class="esrs_label">Department</td>
<td id="esrs_label" class="esrs_label">Course ID</td>
<td id="esrs_label" class="esrs_label">Course Name</td>
<td id="esrs_label" class="esrs_label">Administrator</td>
<td width=1 align=right><input id="esrs_submit" class="esrs_submit" type=submit name="add_course" value=" ADD >>"></td>
</tr>
<tr>
<td id="esrs_field" class="esrs_field"><?php echo $this->_tpl_vars['_add']['menu_departments']; ?>
</td>
<td id="esrs_field" class="esrs_field"><input id="esrs_text" class="esrs_text" type=text name="esrs_add[crse_number]" maxlength=10 size=10 value="<?php echo $this->_tpl_vars['_add']['crse_number']; ?>
"></td>
<td id="esrs_field" class="esrs_field"><input id="esrs_text" class="esrs_text" type=text name="esrs_add[course]" maxlength=60 size=30 value="<?php echo $this->_tpl_vars['_add']['course']; ?>
"></td>
<td id="esrs_field" class="esrs_field"><?php echo $this->_tpl_vars['_add']['menu_admins']; ?>
</td>
<td><input id="esrs_submit" class="esrs_submit" type=reset value="- reset -"></td>
</tr>
</form>
</table>

</div>