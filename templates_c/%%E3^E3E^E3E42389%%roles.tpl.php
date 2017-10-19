<?php /* Smarty version 2.6.20, created on 2009-01-19 03:51:42
         compiled from roles.tpl */ ?>
<div id="esrs_data" class="esrs_data">

<div id="esrs_pass" class="esrs_pass"><?php echo $this->_tpl_vars['login_pass']; ?>
</div>

Below is a list of 'user roles' assigned to your registration. Please select the role you would like to administer.

<p align=center>

<table width="60%" border=0 cellpadding=0 cellspacing=0>
<tr>
<td id="esrs_label" class="esrs_label">Date Created</td>
<td id="esrs_label" class="esrs_label">User Role</td>
<td id="esrs_label" class="esrs_label">&nbsp;</td>
</tr>

<?php $_from = $this->_tpl_vars['_result']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['i']):
?>

<tr>
<td id="<?php echo $this->_tpl_vars['i']['row']; ?>
" class="<?php echo $this->_tpl_vars['i']['row']; ?>
"><?php echo $this->_tpl_vars['i']['created_u2r']; ?>
</td>
<td id="<?php echo $this->_tpl_vars['i']['row']; ?>
" class="<?php echo $this->_tpl_vars['i']['row']; ?>
"><?php echo $this->_tpl_vars['i']['role']; ?>
</td>
<td id="<?php echo $this->_tpl_vars['i']['row']; ?>
" class="<?php echo $this->_tpl_vars['i']['row']; ?>
"><a href="http://<?php echo $this->_tpl_vars['host_url']; ?>
/index.php?<?php echo $this->_tpl_vars['i']['query_string']; ?>
">administer</a></td>
</tr>

<?php endforeach; endif; unset($_from); ?>

</table>

</p>

</div>