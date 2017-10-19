<?php /* Smarty version 2.6.20, created on 2009-01-28 05:17:53
         compiled from roster.tpl */ ?>
<div id="esrs_roster" class="esrs_roster">

<table width="100%" border=0 cellpadding=3 cellspacing=0>
<tr>

<?php if ($this->_tpl_vars['role_id'] < 5): ?>

<td id="esrs_label" class="esrs_label">User Role</td>
<td id="esrs_label" class="esrs_label">Last Name, First</td>
<td id="esrs_label" class="esrs_label">Campus ID</td>
<td id="esrs_label" class="esrs_label">Campus eMail Address</td>
<td id="esrs_label" class="esrs_label">Date Created</td>

<?php else: ?>

<td id="esrs_label" class="esrs_label" width=150>User Role</td>
<td id="esrs_label" class="esrs_label" width=150>Last Name, First</td>
<td id="esrs_label" class="esrs_label">&nbsp;</td>

<?php endif; ?>

</tr>

<?php echo $this->_tpl_vars['roster_list']; ?>


</table>