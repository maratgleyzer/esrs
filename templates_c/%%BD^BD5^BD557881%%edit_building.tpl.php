<?php /* Smarty version 2.6.20, created on 2009-01-21 01:38:30
         compiled from edit_building.tpl */ ?>
<div id="esrs_change" class="esrs_change">

<span id="esrs_heading" class="esrs_heading">Edit This Building:</span>

<span id="esrs_pass" class="esrs_pass"><?php echo $this->_tpl_vars['add_pass']; ?>
</span>
<span id="esrs_fail" class="esrs_fail"><?php echo $this->_tpl_vars['add_fail']; ?>
</span>

<table id="esrs_row_edit" class="esrs_row_edit"
width="100%" border=0 cellpadding=0 cellspacing=4>
<form name="esrs_edit" method="POST" action="http://<?php echo $this->_tpl_vars['host_url']; ?>
/">
<input type=hidden name="edit_id" value="<?php echo $this->_tpl_vars['_edit']['buil_id']; ?>
">
<tr>
<td id="esrs_label" class="esrs_label">Campus</td>
<td id="esrs_label" class="esrs_label">Building Name</td>
<td width=1 align=right><input id="esrs_submit" class="esrs_submit" type=submit name="edit_building" value="EDIT >>"></td>
</tr>
<tr>
<td id="esrs_field" class="esrs_field"><?php echo $this->_tpl_vars['_edit']['menu_campuses']; ?>
</td>
<td id="esrs_field" class="esrs_field"><input id="esrs_text" class="esrs_text" type=text name="esrs_edit[building]" maxlength=60 size=40 value="<?php echo $this->_tpl_vars['_edit']['building']; ?>
"></td>
<td></td>
</tr>
</form>
</table>

</div>