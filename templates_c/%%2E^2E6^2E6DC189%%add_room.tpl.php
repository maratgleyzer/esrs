<?php /* Smarty version 2.6.20, created on 2009-02-01 15:27:33
         compiled from add_room.tpl */ ?>
<div id="esrs_change" class="esrs_change">

<span id="esrs_heading" class="esrs_heading">Add a Room:</span>

<span id="esrs_pass" class="esrs_pass"><?php echo $this->_tpl_vars['add_pass']; ?>
</span>
<span id="esrs_fail" class="esrs_fail"><?php echo $this->_tpl_vars['add_fail']; ?>
</span>

<table width="100%" border=0 cellpadding=0 cellspacing=4>
<form name="esrs_add" method="POST" action="http://<?php echo $this->_tpl_vars['host_url']; ?>
/">
<tr>
<td id="esrs_label" class="esrs_label">Campus</td>
<td id="esrs_label" class="esrs_label">Building</td>
<td id="esrs_label" class="esrs_label">Room Number</td>
<td id="esrs_label" class="esrs_label">&nbsp;</td>
<td id="esrs_label" class="esrs_label">Name</td>
<td width=1 align=right><input id="esrs_submit" class="esrs_submit" type=submit name="add_room" value=" ADD >>"></td>
</tr>
<tr>
<td id="esrs_field" class="esrs_field"><?php echo $this->_tpl_vars['_add']['menu_campuses']; ?>
</td>
<td id="esrs_field" class="esrs_field"><?php echo $this->_tpl_vars['_add']['menu_buildings']; ?>
</td>
<td id="esrs_field" class="esrs_field"><input id="esrs_text" class="esrs_text" type=text name="esrs_add[room_number]" maxlength=10 size=10 value="<?php echo $this->_tpl_vars['_add']['room_number']; ?>
"></td>
<td id="esrs_field" class="esrs_field">and / or</td>
<td id="esrs_field" class="esrs_field"><input id="esrs_text" class="esrs_text" type=text name="esrs_add[room_name]" maxlength=40 size=30 value="<?php echo $this->_tpl_vars['_add']['room_name']; ?>
"></td>
<td><input id="esrs_submit" class="esrs_submit" type=reset value="- reset -"></td>
</tr>
</form>
</table>

</div>