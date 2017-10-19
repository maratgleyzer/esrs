<?php /* Smarty version 2.6.20, created on 2009-01-10 02:36:39
         compiled from manage_sessions.tpl */ ?>
<?php if ($this->_tpl_vars['_tools']['131']): ?>
<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => $this->_tpl_vars['change_form'], 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
<?php endif; ?>

<div class="title">Search for Sessions:</div>

<table width="100%" border=0 cellpadding=0 cellspacing=4>
<tr>
<form name="find" method="POST" action="http://<?php echo $this->_tpl_vars['host_url']; ?>
/index.php">
<th class=label>Department</th>
<th class=label>Exam Course/Term</th>
<th class=label>Campus Building/Room</th>
<th class=label>Disabled</th>
<td width=1 align=right><input class=esrs_submit type=submit name="find_session" value="FIND >>"></td>
</tr><tr>
<td valign=top><?php echo $this->_tpl_vars['_find']['menu_departments']; ?>
</td>
<td valign=top><?php echo $this->_tpl_vars['_find']['menu_exams']; ?>
</td>
<td valign=top><?php echo $this->_tpl_vars['_find']['menu_rooms']; ?>
</td>
<td valign=top align=center><input class=esrs_check type=checkbox name="disable" value="1"<?php if ($this->_tpl_vars['_find']['disable']): ?> checked<?php endif; ?>></td>
<td></td>
</tr></table>

</td></tr>
<tr><td align=top valign=top colspan=2 height="100%">

<table width="100%" border=0 cellpadding=0 cellspacing=4>
<tr>
<th class=label>(toggle session)</th>
<th class=label>Department</th>
<th class=label>Exam Cycle</th>
<th class=label>Capacity</th>
<th class=label>Registered</th>
<th class=label>Start Date/Time</th>
<th class=label>Show/Hide</th>
<th class=label>Facilitator</th>
</tr>

<?php echo $this->_tpl_vars['session_list']; ?>


</form>
</table>