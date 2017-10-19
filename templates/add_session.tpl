<div id="esrs_change" class="esrs_change">

<span id="esrs_heading" class="esrs_heading">Add a Session:</span>

<span id="esrs_pass" class="esrs_pass">{$add_pass}</span>
<span id="esrs_fail" class="esrs_fail">{$add_fail}</span>

<table width="100%" border=0 cellpadding=0 cellspacing=4>
<form name="esrs_add" method="POST" action="http://{$host_url}/">
<tr>
<td id="esrs_label" class="esrs_label">Department</td>
<td id="esrs_label" class="esrs_label" colspan=2>Exam Course/Term</td>
<td id="esrs_label" class="esrs_label">Session Facilitator</td>
<td width=1 align=right><input id="esrs_submit" class="esrs_submit" type=submit name="add_session" value=" ADD >>"></td>
</tr>
<tr>
<td id="esrs_field" class="esrs_field">{$_add.menu_departments}</td>
<td id="esrs_field" class="esrs_field" colspan=2>{$_add.menu_exams}</td>
<td id="esrs_field" class="esrs_field">{$_add.menu_facilitators}</td>
<td><input id="esrs_submit" class="esrs_submit" type=reset value="- reset -"></td>
</tr>
<tr>
<td id="esrs_label" class="esrs_label">Session Date</td>
<td id="esrs_label" class="esrs_label">Session Duration</td>
<td id="esrs_label" class="esrs_label">Campus Building/Room</td>
<td id="esrs_label" class="esrs_label">Room Capacity</td>
<td></td>
</tr>
<tr>
<td id="esrs_field" class="esrs_field">
{$_add.menu_a_month}
{$_add.menu_a_day}
{$_add.menu_a_year}
</td>
<td id="esrs_field" class="esrs_field">
{$_add.menu_a_time}
to
{$_add.menu_z_time}
</td>
<td id="esrs_field" class="esrs_field">{$_add.menu_rooms}</td>
<td id="esrs_field" class="esrs_field"><input id="esrs_text" class="esrs_text" type=text name="esrs_add[capacity]" maxlength=3 size=2 value="{$_add.capacity}"> Students</td>
<td></td>
</tr>
</form>
</table>

</div>