<?php /* Smarty version 2.6.20, created on 2009-02-01 10:32:42
         compiled from find_department.tpl */ ?>
<div id="esrs_data" class="esrs_data">

<table width="100%" border=0 cellpadding=3 cellspacing=0>
<form name="esrs_find" method="POST" action="http://<?php echo $this->_tpl_vars['host_url']; ?>
/">
<input type=hidden name="sortorder" value="<?php echo $this->_tpl_vars['_find']['sortorder']; ?>
">
<tr>
<td id="esrs_label" class="esrs_label" width=40>&nbsp;</td>
<td id="esrs_label" class="esrs_label">ID</td>
<td id="esrs_label" class="esrs_label">Department ID &nbsp;<a href="javascript:" onClick="esrs_set('esrs_find','sortorder','n_u');"><img src="http://<?php echo $this->_tpl_vars['host_url']; ?>
/img/arrw_up.jpg" border=0></a><a href="javascript:" onClick="esrs_set('esrs_find','sortorder','n_d');"><img src="http://<?php echo $this->_tpl_vars['host_url']; ?>
/img/arrw_dwn.jpg" border=0></a></td>
<td id="esrs_label" class="esrs_label">(toggle) Department &nbsp;<a href="javascript:" onClick="esrs_set('esrs_find','sortorder','d_u');"><img src="http://<?php echo $this->_tpl_vars['host_url']; ?>
/img/arrw_up.jpg" border=0></a><a href="javascript:" onClick="esrs_set('esrs_find','sortorder','d_d');"><img src="http://<?php echo $this->_tpl_vars['host_url']; ?>
/img/arrw_dwn.jpg" border=0></a></td>
<td id="esrs_label" class="esrs_label">(toggle) Administrator &nbsp;<a href="javascript:" onClick="esrs_set('esrs_find','sortorder','r_u');"><img src="http://<?php echo $this->_tpl_vars['host_url']; ?>
/img/arrw_up.jpg" border=0></a><a href="javascript:" onClick="esrs_set('esrs_find','sortorder','r_d');"><img src="http://<?php echo $this->_tpl_vars['host_url']; ?>
/img/arrw_dwn.jpg" border=0></a></td>
<td id="esrs_label" class="esrs_label" width=1>&nbsp;</th>
</tr>

<?php echo $this->_tpl_vars['record_list']; ?>


</form>
</table>

</div>