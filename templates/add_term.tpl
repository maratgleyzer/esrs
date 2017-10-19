<div id="esrs_change" class="esrs_change">

<span id="esrs_heading" class="esrs_heading">Add a Term:</span>

<span id="esrs_pass" class="esrs_pass">{$add_pass}</span>
<span id="esrs_fail" class="esrs_fail">{$add_fail}</span>

<table width="100%" border=0 cellpadding=0 cellspacing=4>
<form name="esrs_add" method="POST" action="http://{$host_url}/">
<tr>
<td id="esrs_label" class="esrs_label">Section</td>
<td id="esrs_label" class="esrs_label">Period</td>
<td id="esrs_label" class="esrs_label">Year</td>
<td width=1 align=right><input id="esrs_submit" class="esrs_submit" type=submit name="add_term" value=" ADD >>"></td>
</tr>
<tr>
<td id="esrs_field" class="esrs_field">{$_add.menu_sections}</td>
<td id="esrs_field" class="esrs_field">{$_add.menu_periods}</td>
<td id="esrs_field" class="esrs_field">{$_add.menu_years}</td>
<td><input id="esrs_submit" class="esrs_submit" type=reset value="- reset -"></td>
</tr>
</form>
</table>

</div>