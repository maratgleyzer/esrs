<?php /* Smarty version 2.6.20, created on 2009-01-26 11:02:31
         compiled from edit_user.tpl */ ?>
<div id="esrs_change" class="esrs_change">

<span id="esrs_heading" class="esrs_heading">Edit This User:</span>

<span id="esrs_pass" class="esrs_pass"><?php echo $this->_tpl_vars['add_pass']; ?>
</span>
<span id="esrs_fail" class="esrs_fail"><?php echo $this->_tpl_vars['add_fail']; ?>
</span>

<table id="esrs_row_edit" class="esrs_row_edit"
width="100%" border=0 cellpadding=0 cellspacing=4>
<form name="esrs_edit" method="POST" action="http://<?php echo $this->_tpl_vars['host_url']; ?>
/">
<input type=hidden name="edit_id" value="<?php echo $this->_tpl_vars['_edit']['user2role_id']; ?>
">
<tr>
<td id="esrs_label" class="esrs_label">Last Name</td>
<td id="esrs_label" class="esrs_label">First Name</td>
<td id="esrs_label" class="esrs_label">Campus ID</td>
<td id="esrs_label" class="esrs_label">Campus eMail Address</td>
<td id="esrs_label" class="esrs_label">User Role</td>
<td width=1 align=right><input id="esrs_submit" class="esrs_submit" type=submit name="edit_user" value="EDIT >>"></td>
</tr>
<tr>
<td id="esrs_field" class="esrs_field"><input id="esrs_text" class="esrs_text" type=text name="esrs_edit[last_name]" maxlength=20 size=10 value="<?php echo $this->_tpl_vars['_edit']['last_name']; ?>
"></td>
<td id="esrs_field" class="esrs_field"><input id="esrs_text" class="esrs_text" type=text name="esrs_edit[first_name]" maxlength=20 size=10 value="<?php echo $this->_tpl_vars['_edit']['first_name']; ?>
"></td>
<td id="esrs_field" class="esrs_field"><input id="esrs_text" class="esrs_text" type=text name="esrs_edit[campus_id]" maxlength=10 size=10 value="<?php echo $this->_tpl_vars['_edit']['campus_id']; ?>
"></td>
<td id="esrs_field" class="esrs_field"><input id="esrs_text" class="esrs_text" type=text name="esrs_edit[username]" maxlength=40 size=15 value="<?php echo $this->_tpl_vars['_edit']['username']; ?>
"> @<?php echo $this->_tpl_vars['email_domain']; ?>
</td>
<td id="esrs_field" class="esrs_field"><?php echo $this->_tpl_vars['_edit']['menu_user_roles']; ?>
</td>
<td><input id="esrs_submit" class="esrs_submit" type=reset value="- reset -"></td>
</tr>
</form>
</table>

</div>