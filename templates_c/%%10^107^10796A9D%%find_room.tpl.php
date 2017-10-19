<?php /* Smarty version 2.6.20, created on 2009-02-01 15:27:59
         compiled from find_room.tpl */ ?>
<div id="esrs_search" class="esrs_search">

<span id="esrs_heading" class="esrs_heading">Search for Rooms:</span>

<table width="100%" border=0 cellpadding=0 cellspacing=4>
<form name="esrs_find" method="POST" action="http://<?php echo $this->_tpl_vars['host_url']; ?>
/">
<input type=hidden name="sortorder" value="<?php echo $this->_tpl_vars['_find']['sortorder']; ?>
">
<tr>
<td id="esrs_label" class="esrs_label">Campus</td>
<td id="esrs_label" class="esrs_label">Building</td>
<td id="esrs_label" class="esrs_label">Room Number</td>
<td id="esrs_label" class="esrs_label">Name</td>
<td id="esrs_label" class="esrs_label" width=1>Disabled</td>
<td width=1><input id="esrs_submit" class="esrs_submit" type=submit name="find_room" value="FIND >>"></td>
</tr>
<tr>
<td id="esrs_field" class="esrs_field"><?php echo $this->_tpl_vars['_find']['menu_campuses']; ?>
</td>
<td id="esrs_field" class="esrs_field"><?php echo $this->_tpl_vars['_find']['menu_buildings']; ?>
</td>
<td id="esrs_field" class="esrs_field"><input id="esrs_text" class="esrs_text" type=text name="esrs_find[room_number]" maxlength=10 size=10 value="<?php echo $this->_tpl_vars['_find']['room_number']; ?>
"></td>
<td id="esrs_field" class="esrs_field"><input id="esrs_text" class="esrs_text" type=text name="esrs_find[room_name]" maxlength=40 size=30 value="<?php echo $this->_tpl_vars['_find']['room_name']; ?>
"></td>
<td align=center><input id="esrs_check" class="esrs_check" type=checkbox name="esrs_find[disable]" value="1"<?php if ($this->_tpl_vars['_find']['disable']): ?> checked<?php endif; ?>></td>
<td><input id="esrs_submit" class="esrs_submit" type=reset value="- reset -"></td>
</tr></table>

</div>

<div id="esrs_data" class="esrs_data">

<table width="100%" border=0 cellpadding=3 cellspacing=0>
<tr>
<td id="esrs_label" class="esrs_label" width=40>&nbsp;</td>
<td id="esrs_label" class="esrs_label">Campus &nbsp;<a href="javascript:" onClick="esrs_set('esrs_find','sortorder','c_u');"><img src="http://<?php echo $this->_tpl_vars['host_url']; ?>
/img/arrw_up.jpg" border=0></a><a href="javascript:" onClick="esrs_set('esrs_find','sortorder','c_d');"><img src="http://<?php echo $this->_tpl_vars['host_url']; ?>
/img/arrw_dwn.jpg" border=0></a></td>
<td id="esrs_label" class="esrs_label">Building &nbsp;<a href="javascript:" onClick="esrs_set('esrs_find','sortorder','b_u');"><img src="http://<?php echo $this->_tpl_vars['host_url']; ?>
/img/arrw_up.jpg" border=0></a><a href="javascript:" onClick="esrs_set('esrs_find','sortorder','b_d');"><img src="http://<?php echo $this->_tpl_vars['host_url']; ?>
/img/arrw_dwn.jpg" border=0></a></td>
<td id="esrs_label" class="esrs_label" width=160>(toggle) Room Number &nbsp;<a href="javascript:" onClick="esrs_set('esrs_find','sortorder','r_u');"><img src="http://<?php echo $this->_tpl_vars['host_url']; ?>
/img/arrw_up.jpg" border=0></a><a href="javascript:" onClick="esrs_set('esrs_find','sortorder','r_d');"><img src="http://<?php echo $this->_tpl_vars['host_url']; ?>
/img/arrw_dwn.jpg" border=0></a></td>
<td id="esrs_label" class="esrs_label">Name &nbsp;<a href="javascript:" onClick="esrs_set('esrs_find','sortorder','n_u');"><img src="http://<?php echo $this->_tpl_vars['host_url']; ?>
/img/arrw_up.jpg" border=0></a><a href="javascript:" onClick="esrs_set('esrs_find','sortorder','n_d');"><img src="http://<?php echo $this->_tpl_vars['host_url']; ?>
/img/arrw_dwn.jpg" border=0></a></td>
<td id="esrs_label" class="esrs_label" width=1>&nbsp;</th>
</tr>

<?php echo $this->_tpl_vars['record_list']; ?>


</form>
</table>

</div>