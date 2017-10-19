<?php /* Smarty version 2.6.20, created on 2009-01-10 02:36:35
         compiled from manage_exams.tpl */ ?>
<?php if ($this->_tpl_vars['_tools']['130']): ?>
<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => $this->_tpl_vars['change_form'], 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
<?php endif; ?>

<div class="title">Search for Exams:</div>

<table width="100%" border=0 cellpadding=0 cellspacing=4>
<form name="find" method="POST" action="http://<?php echo $this->_tpl_vars['host_url']; ?>
/index.php">
<input type=hidden name="sortorder" value="<?php echo $this->_tpl_vars['_find']['sortorder']; ?>
">
<tr>
<th class=label>Department</th>
<th class=label>Course</th>
<th class=label>Term</th>
<th class=label>Disabled</th>
<td width=1 align=right><input class=esrs_submit type=submit name="find_exam" value="FIND >>"></td>
</tr>
<tr>
<td valign=top><?php echo $this->_tpl_vars['_find']['menu_departments']; ?>
</td>
<td valign=top><?php echo $this->_tpl_vars['_find']['menu_courses']; ?>
</td>
<td valign=top><?php echo $this->_tpl_vars['_find']['menu_terms']; ?>
</td>
<td valign=top align=center><input class=esrs_check type=checkbox name="disable" value="1"<?php if ($this->_tpl_vars['_find']['disable']): ?> checked<?php endif; ?>></td>
<td></td>
</tr></table>

</td></tr>
<tr><td align=top valign=top colspan=2 height="100%">

<table width="100%" border=0 cellpadding=4 cellspacing=0>
<tr>
<th class=label>(toggle exam)</th>
<th class=label>Department</th>
<th class=label>Course</th>
<th class=label>Term</th>
<th class=label>Exam Date</th>
</tr>

<?php echo $this->_tpl_vars['exam_list']; ?>


</form>
</table>