<?php /* Smarty version 2.6.20, created on 2009-01-12 09:41:39
         compiled from manage_departments.tpl */ ?>
<?php if ($this->_tpl_vars['_tools']['128']): ?>
<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => $this->_tpl_vars['change_form'], 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
<?php endif; ?>

</td></tr>
<tr><td align=top valign=top colspan=2 height="100%">

<table width="100%" border=0 cellpadding=2 cellspacing=0>
<form name="find" method="POST" action="http://<?php echo $this->_tpl_vars['host_url']; ?>
/index.php">
<input type=hidden name="sortorder" value="<?php echo $this->_tpl_vars['_find']['sortorder']; ?>
">
<tr>
<th class=label>&nbsp;</th>
<th class=label>ID</th>
<th class=label>Department ID &nbsp;<a href="javascript:" onClick="esrs_set('find','sortorder','n_u');"><img src="http://<?php echo $this->_tpl_vars['host_url']; ?>
/img/arrw_up.jpg" border=0></a><a href="javascript:" onClick="esrs_set('find','sortorder','n_d');"><img src="http://<?php echo $this->_tpl_vars['host_url']; ?>
/img/arrw_dwn.jpg" border=0></a></th>
<th class=label>(toggle) Department &nbsp;<a href="javascript:" onClick="esrs_set('find','sortorder','d_u');"><img src="http://<?php echo $this->_tpl_vars['host_url']; ?>
/img/arrw_up.jpg" border=0></a><a href="javascript:" onClick="esrs_set('find','sortorder','d_d');"><img src="http://<?php echo $this->_tpl_vars['host_url']; ?>
/img/arrw_dwn.jpg" border=0></a></th>
<th class=label>(toggle) Administrator &nbsp;<a href="javascript:" onClick="esrs_set('find','sortorder','r_u');"><img src="http://<?php echo $this->_tpl_vars['host_url']; ?>
/img/arrw_up.jpg" border=0></a><a href="javascript:" onClick="esrs_set('find','sortorder','r_d');"><img src="http://<?php echo $this->_tpl_vars['host_url']; ?>
/img/arrw_dwn.jpg" border=0></a></th>
<th class=label>&nbsp;</th>
</tr>

<?php echo $this->_tpl_vars['department_list']; ?>


</form>
</table>