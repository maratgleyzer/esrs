<div id="esrs_change" class="esrs_change">

<span id="esrs_heading" class="esrs_heading">Add a Campus:</span>

<span id="esrs_pass" class="esrs_pass">{$add_pass}</span>
<span id="esrs_fail" class="esrs_fail">{$add_fail}</span>

<table width="100%" border=0 cellpadding=0 cellspacing=4>
<form name="esrs_add" method="POST" action="http://{$host_url}/">
<tr>
<td id="esrs_label" class="esrs_label">Campus</td>
<td id="esrs_label" class="esrs_label">Host Domain</td>
<td id="esrs_label" class="esrs_label">Admin Alias</td>
<td width=1 align=right><input id="esrs_submit" class="esrs_submit" type=submit name="add_campus" value=" ADD >>"></td>
</tr>
<tr>
<td id="esrs_field" class="esrs_field"><input id="esrs_text" class="esrs_text" type=text name="esrs_add[campus]" maxlength=60 size=40 value="{$_add.campus}"></td>
<td id="esrs_field" class="esrs_field"><input id="esrs_text" class="esrs_text" type=text name="esrs_add[email_domain]" maxlength=40 size=20 value="{$_add.email_domain}"></td>
<td id="esrs_field" class="esrs_field"><input id="esrs_text" class="esrs_text" type=text name="esrs_add[email_alias]" maxlength=40 size=20 value="{$_add.email_alias}"></td>
<td><input id="esrs_submit" class="esrs_submit" type=reset value="- reset -"></td>
</tr>
</form>
</table>

</div>