<?php /* Smarty version 2.6.20, created on 2009-01-10 22:19:47
         compiled from manage_terms.tpl */ ?>
<?php if ($this->_tpl_vars['_tools']['132']): ?>
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
<th class=label>(toggle) Term</th>
<th class=label>Section</th>
<th class=label>Period</th>
<th class=label>Year</th>
<th class=label>&nbsp;</th>
</tr>

<?php echo $this->_tpl_vars['term_list']; ?>


</form>
</table>