<?php /* Smarty version 2.6.20, created on 2009-02-01 12:06:08
         compiled from edit_term.tpl */ ?>
<div id="esrs_change" class="esrs_change">

<span id="esrs_heading" class="esrs_heading">Edit This Term:</span>

<span id="esrs_pass" class="esrs_pass"><?php echo $this->_tpl_vars['add_pass']; ?>
</span>
<span id="esrs_fail" class="esrs_fail"><?php echo $this->_tpl_vars['add_fail']; ?>
</span>

<table id="esrs_row_edit" class="esrs_row_edit"
width="100%" border=0 cellpadding=0 cellspacing=4>
<form name="esrs_edit" method="POST" action="http://<?php echo $this->_tpl_vars['host_url']; ?>
/">
<input type=hidden name="edit_id" value="<?php echo $this->_tpl_vars['_edit']['term_id']; ?>
">
<tr>
<td id="esrs_label" class="esrs_label">Section</td>
<td id="esrs_label" class="esrs_label">Period</td>
<td id="esrs_label" class="esrs_label">Year</td>
<td width=1 align=right><input id="esrs_submit" class="esrs_submit" type=submit name="edit_term" value="EDIT >>"></td>
</tr>
<tr>
<td id="esrs_field" class="esrs_field"><?php echo $this->_tpl_vars['_edit']['menu_sections']; ?>
</td>
<td id="esrs_field" class="esrs_field"><?php echo $this->_tpl_vars['_edit']['menu_periods']; ?>
</td>
<td id="esrs_field" class="esrs_field"><?php echo $this->_tpl_vars['_edit']['menu_years']; ?>
</td>
<td><input id="esrs_submit" class="esrs_submit" type=reset value="- reset -"></td>
</tr>
</form>
</table>

</div>