<?php /* Smarty version 2.6.20, created on 2009-01-30 01:28:46
         compiled from edit_department.tpl */ ?>
<div id="esrs_change" class="esrs_change">

<span id="esrs_heading" class="esrs_heading">Edit This Department:</span>

<span id="esrs_pass" class="esrs_pass"><?php echo $this->_tpl_vars['add_pass']; ?>
</span>
<span id="esrs_fail" class="esrs_fail"><?php echo $this->_tpl_vars['add_fail']; ?>
</span>

<table id="esrs_row_edit" class="esrs_row_edit"
width="100%" border=0 cellpadding=0 cellspacing=4>
<form name="esrs_edit" method="POST" action="http://<?php echo $this->_tpl_vars['host_url']; ?>
/">
<input type=hidden name="edit_id" value="<?php echo $this->_tpl_vars['_edit']['user2dept_id']; ?>
">
<tr>
<td id="esrs_label" class="esrs_label">Department ID</td>
<td id="esrs_label" class="esrs_label">Department Name</td>
<td id="esrs_label" class="esrs_label">Administrator</td>
<td width=1 align=right><input id="esrs_submit" class="esrs_submit" type=submit name="edit_department" value="EDIT >>"></td>
</tr>
<tr>
<td id="esrs_field" class="esrs_field"><input id="esrs_text" class="esrs_text" type=text name="esrs_edit[dept_number]" maxlength=10 size=10 value="<?php echo $this->_tpl_vars['_edit']['dept_number']; ?>
"></td>
<td id="esrs_field" class="esrs_field"><input id="esrs_text" class="esrs_text" type=text name="esrs_edit[department]" maxlength=60 size=30 value="<?php echo $this->_tpl_vars['_edit']['department']; ?>
"></td>
<td id="esrs_field" class="esrs_field"><?php echo $this->_tpl_vars['_edit']['menu_admins']; ?>
</td>
<td><input id="esrs_submit" class="esrs_submit" type=reset value="- reset -"></td>
</tr>
</form>
</table>

</div>