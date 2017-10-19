<div id="esrs_change" class="esrs_change">

<span id="esrs_heading" class="esrs_heading">Edit This Term:</span>

<span id="esrs_pass" class="esrs_pass">{$add_pass}</span>
<span id="esrs_fail" class="esrs_fail">{$add_fail}</span>

<table id="esrs_row_edit" class="esrs_row_edit"
width="100%" border=0 cellpadding=0 cellspacing=4>
<form name="esrs_edit" method="POST" action="http://{$host_url}/">
<input type=hidden name="edit_id" value="{$_edit.term_id}">
<tr>
<td id="esrs_label" class="esrs_label">Section</td>
<td id="esrs_label" class="esrs_label">Period</td>
<td id="esrs_label" class="esrs_label">Year</td>
<td width=1 align=right><input id="esrs_submit" class="esrs_submit" type=submit name="edit_term" value="EDIT >>"></td>
</tr>
<tr>
<td id="esrs_field" class="esrs_field">{$_edit.menu_sections}</td>
<td id="esrs_field" class="esrs_field">{$_edit.menu_periods}</td>
<td id="esrs_field" class="esrs_field">{$_edit.menu_years}</td>
<td><input id="esrs_submit" class="esrs_submit" type=reset value="- reset -"></td>
</tr>
</form>
</table>

</div>