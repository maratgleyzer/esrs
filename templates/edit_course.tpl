<div id="esrs_change" class="esrs_change">

<span id="esrs_heading" class="esrs_heading">Edit This Course:</span>

<span id="esrs_pass" class="esrs_pass">{$add_pass}</span>
<span id="esrs_fail" class="esrs_fail">{$add_fail}</span>

<table id="esrs_row_edit" class="esrs_row_edit"
width="100%" border=0 cellpadding=0 cellspacing=4>
<form name="esrs_edit" method="POST" action="http://{$host_url}/">
<input type=hidden name="edit_id" value="{$_edit.user2crse_id}">
<tr>
<td id="esrs_label" class="esrs_label">Department</td>
<td id="esrs_label" class="esrs_label">Course ID</td>
<td id="esrs_label" class="esrs_label">Course Name</td>
<td id="esrs_label" class="esrs_label">Administrator</td>
<td width=1 align=right><input id="esrs_submit" class="esrs_submit" type=submit name="edit_course" value="EDIT >>"></td>
</tr>
<tr>
<td id="esrs_field" class="esrs_field">{$_edit.menu_departments}</td>
<td id="esrs_field" class="esrs_field"><input id="esrs_text" class="esrs_text" type=text name="esrs_edit[crse_number]" maxlength=10 size=10 value="{$_edit.crse_number}"></td>
<td id="esrs_field" class="esrs_field"><input id="esrs_text" class="esrs_text" type=text name="esrs_edit[course]" maxlength=60 size=30 value="{$_edit.course}"></td>
<td id="esrs_field" class="esrs_field">{$_edit.menu_admins}</td>
<td><input id="esrs_submit" class="esrs_submit" type=reset value="- reset -"></td>
</tr>
</form>
</table>

</div>