<div id="esrs_change" class="esrs_change">

<span id="esrs_heading" class="esrs_heading">Add an Exam:</span>

<span id="esrs_pass" class="esrs_pass">{$add_pass}</span>
<span id="esrs_fail" class="esrs_fail">{$add_fail}</span>

<table width="100%" border=0 cellpadding=0 cellspacing=4>
<form name="esrs_add" method="POST" action="http://{$host_url}/">
<tr>
<td id="esrs_label" class="esrs_label">Department</td>
<td id="esrs_label" class="esrs_label">Course</td>
<td id="esrs_label" class="esrs_label">Select Facilitators</td>
<td width=1 align=right><input id="esrs_submit" class="esrs_submit" type=submit name="add_exam" value=" ADD >>"></td>
</tr>
<tr>
<td id="esrs_field" class="esrs_field">{$_add.menu_departments}</td>
<td id="esrs_field" class="esrs_field">{$_add.menu_courses}</td>
<td id="esrs_field" class="esrs_field" rowspan=5 valign=top width=130>
{$_add.menu_facilitators}
<div style="font-size:8px;font-style:verdana;font-weight:bold;">
NOTE: To submit more than one user, hold the (CTRL) key as you make your selections.
</div>
</td>
<td rowspan=5 valign=top><input id="esrs_submit" class="esrs_submit" type=reset value="- reset -"></td>
</tr>
<tr>
<td id="esrs_label" class="esrs_label">Course Term</td>
<td id="esrs_label" class="esrs_label">Exam Type</td>
</tr>
<tr>
<td id="esrs_field" class="esrs_field">{$_add.menu_terms}</td>
<td id="esrs_field" class="esrs_field">
<input id="esrs_check" class="esrs_check" type=radio name="exam_type" value="0"{if !$_add.exam_type} checked{/if}>
Verbal
&nbsp;
<input id="esrs_check" class="esrs_check" disabled type=radio name="exam_type" value="1"{if $_add.exam_type} checked{/if}>
Written
</td>
</tr>
<tr>
<td id="esrs_label" class="esrs_label">Facilitator Signup Period</td>
<td id="esrs_label" class="esrs_label">Student Signup Period</td>
</tr>
<tr>
<td id="esrs_field" class="esrs_field">
{$_add.menu_a_month}
{$_add.menu_a_day}
to
{$_add.menu_b_month}
{$_add.menu_b_day},
{$_add.menu_b_year}
</td>
<td id="esrs_field" class="esrs_field">
{$_add.menu_y_month}
{$_add.menu_y_day}
to
{$_add.menu_z_month}
{$_add.menu_z_day},
{$_add.menu_z_year}
</td>
</tr>
</form>
</table>

</div>