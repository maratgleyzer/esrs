<div id="esrs_change" class="esrs_change">

<span id="esrs_heading" class="esrs_heading">Add a Building:</span>

<span id="esrs_pass" class="esrs_pass">{$add_pass}</span>
<span id="esrs_fail" class="esrs_fail">{$add_fail}</span>

<table width="100%" border=0 cellpadding=0 cellspacing=4>
<form name="esrs_add" method="POST" action="http://{$host_url}/">
<tr>
<td id="esrs_label" class="esrs_label">Campus</td>
<td id="esrs_label" class="esrs_label">Building Name</td>
<td width=1 align=right><input id="esrs_submit" class="esrs_submit" type=submit name="add_building" value=" ADD >>"></td>
</tr>
<tr>
<td id="esrs_field" class="esrs_field">{$_add.menu_campuses}</td>
<td id="esrs_field" class="esrs_field"><input id="esrs_text" class="esrs_text" type=text name="esrs_add[building]" maxlength=60 size=40 value="{$_add.building}"></td>
<td><input id="esrs_submit" class="esrs_submit" type=reset value="- reset -"></td>
</tr>
</form>
</table>

</div>