<?php /* Smarty version 2.6.20, created on 2009-02-02 12:12:49
         compiled from find_session.tpl */ ?>
<div id="esrs_search" class="esrs_search">

<?php if ($this->_tpl_vars['role_id'] < 4): ?>

<span id="esrs_heading" class="esrs_heading">Search for Sessions:</span>

<?php else: ?>

<span id="esrs_heading" class="esrs_heading">Search for your desired exam session and register:</span>

<span id="esrs_pass" class="esrs_pass"><?php echo $this->_tpl_vars['add_pass']; ?>
</span>
<span id="esrs_fail" class="esrs_fail"><?php echo $this->_tpl_vars['add_fail']; ?>
</span>

<?php endif; ?>

<table width="100%" border=0 cellpadding=0 cellspacing=4>
<form name="esrs_find" method="POST" action="http://<?php echo $this->_tpl_vars['host_url']; ?>
/">
<input type=hidden name="sortorder" value="<?php echo $this->_tpl_vars['_find']['sortorder']; ?>
">
<tr>

<?php if ($this->_tpl_vars['role_id'] < 4): ?>

<td id="esrs_label" class="esrs_label">Department</td>
<td id="esrs_label" class="esrs_label">Exam Course/Term</td>
<td id="esrs_label" class="esrs_label" width=1>Full</td>
<td id="esrs_label" class="esrs_label" width=1>Hidden</td>
<td width=1><input id="esrs_submit" class="esrs_submit" type=submit name="find_session" value="FIND >>"></td>
</tr>
<tr>
<td id="esrs_field" class="esrs_field"><?php echo $this->_tpl_vars['_find']['menu_departments']; ?>
</td>
<td id="esrs_field" class="esrs_field"><?php echo $this->_tpl_vars['_find']['menu_exams']; ?>
</td>
<td align=center><input id="esrs_check" class="esrs_check" type=checkbox name="esrs_find[full]" value="1"<?php if ($this->_tpl_vars['_find']['full']): ?> checked<?php endif; ?>></td>
<td align=center><input id="esrs_check" class="esrs_check" type=checkbox name="esrs_find[hidden]" value="1"<?php if ($this->_tpl_vars['_find']['hidden']): ?> checked<?php endif; ?>></td>
<td><input id="esrs_submit" class="esrs_submit" type=reset value="- reset -"></td>

<?php else: ?>

<td id="esrs_label" class="esrs_label">Department</td>
<td id="esrs_label" class="esrs_label">Exam Course/Term</td>
<td width=1><input id="esrs_submit" class="esrs_submit" type=submit name="find_session" value="FIND >>"></td>
</tr>
<tr>
<td id="esrs_field" class="esrs_field"><?php echo $this->_tpl_vars['_find']['menu_departments']; ?>
</td>
<td id="esrs_field" class="esrs_field"><?php echo $this->_tpl_vars['_find']['menu_exams']; ?>
</td>
<td>&nbsp;</td>

<?php endif; ?>

</tr></table>

</div>

<div id="esrs_data" class="esrs_data">

<?php if ($this->_tpl_vars['role_id'] > 3): ?>
<?php if (! $this->_tpl_vars['_find']['no_labels']): ?>

<div id="esrs_copy" class="esrs_copy">
Click the GREEN (REGISTER) LINK to attend the related exam session. Exam sessions you have registered for, will be highlighted in yellow at the top of the record list. To view registrants for a particular exam session, click the GREEN (ROSTER) LINK next to the number registered for the related exam session. Use the up/down arrows to sort records by the desired column.
</div>
<br>

<?php endif; ?>
<?php endif; ?>

<table width="100%" border=0 cellpadding=3 cellspacing=0>
<tr>

<?php if ($this->_tpl_vars['role_id'] < 4): ?>

<td id="esrs_label" class="esrs_label" width=40>&nbsp;</td>
<td id="esrs_label" class="esrs_label">Location &nbsp;<a href="javascript:" onClick="esrs_set('esrs_find','sortorder','r_u');"><img alt="sort up" src="http://<?php echo $this->_tpl_vars['host_url']; ?>
/img/arrw_up.jpg" border=0></a><a href="javascript:" onClick="esrs_set('esrs_find','sortorder','r_d');"><img alt="sort down" src="http://<?php echo $this->_tpl_vars['host_url']; ?>
/img/arrw_dwn.jpg" border=0></a></td>
<td id="esrs_label" class="esrs_label">Capacity</td>
<td id="esrs_label" class="esrs_label">Registered</td>
<td id="esrs_label" class="esrs_label">Facilitator &nbsp;<a href="javascript:" onClick="esrs_set('esrs_find','sortorder','u_u');"><img alt="sort up" src="http://<?php echo $this->_tpl_vars['host_url']; ?>
/img/arrw_up.jpg" border=0></a><a href="javascript:" onClick="esrs_set('esrs_find','sortorder','u_d');"><img alt="sort down" src="http://<?php echo $this->_tpl_vars['host_url']; ?>
/img/arrw_dwn.jpg" border=0></a></td>
<td id="esrs_label" class="esrs_label">Date @ Time &nbsp;<a href="javascript:" onClick="esrs_set('esrs_find','sortorder','t_u');"><img alt="sort up" src="http://<?php echo $this->_tpl_vars['host_url']; ?>
/img/arrw_up.jpg" border=0></a><a href="javascript:" onClick="esrs_set('esrs_find','sortorder','t_d');"><img alt="sort down" src="http://<?php echo $this->_tpl_vars['host_url']; ?>
/img/arrw_dwn.jpg" border=0></a></td>
<td id="esrs_label" class="esrs_label" width=1>&nbsp;</td>

<?php else: ?>
<?php if (! $this->_tpl_vars['_find']['no_labels']): ?>

<td id="esrs_label" class="esrs_label">Course</td>
<td id="esrs_label" class="esrs_label">Location &nbsp;<a href="javascript:" onClick="esrs_set('esrs_find','sortorder','r_u');"><img alt="sort up" src="http://<?php echo $this->_tpl_vars['host_url']; ?>
/img/arrw_up.jpg" border=0></a><a href="javascript:" onClick="esrs_set('esrs_find','sortorder','r_d');"><img alt="sort down" src="http://<?php echo $this->_tpl_vars['host_url']; ?>
/img/arrw_dwn.jpg" border=0></a></td>
<td id="esrs_label" class="esrs_label">Capacity</td>
<td id="esrs_label" class="esrs_label">Registered</td>
<td id="esrs_label" class="esrs_label">Facilitator &nbsp;<a href="javascript:" onClick="esrs_set('esrs_find','sortorder','u_u');"><img alt="sort up" src="http://<?php echo $this->_tpl_vars['host_url']; ?>
/img/arrw_up.jpg" border=0></a><a href="javascript:" onClick="esrs_set('esrs_find','sortorder','u_d');"><img alt="sort down" src="http://<?php echo $this->_tpl_vars['host_url']; ?>
/img/arrw_dwn.jpg" border=0></a></td>
<td id="esrs_label" class="esrs_label">Date @ Time &nbsp;<a href="javascript:" onClick="esrs_set('esrs_find','sortorder','t_u');"><img alt="sort up" src="http://<?php echo $this->_tpl_vars['host_url']; ?>
/img/arrw_up.jpg" border=0></a><a href="javascript:" onClick="esrs_set('esrs_find','sortorder','t_d');"><img alt="sort down" src="http://<?php echo $this->_tpl_vars['host_url']; ?>
/img/arrw_dwn.jpg" border=0></a></td>
<td id="esrs_label" class="esrs_label">&nbsp;</td>
<td id="esrs_label" class="esrs_label" width=1>&nbsp;</td>

<?php endif; ?>
<?php endif; ?>

</tr>

<?php echo $this->_tpl_vars['record_list']; ?>


</form>
</table>

</div>