<div id="esrs_change" class="esrs_change">

<span id="esrs_heading" class="esrs_heading">Add a User:</span>

<span id="esrs_pass" class="esrs_pass">{$add_pass}</span>
<span id="esrs_fail" class="esrs_fail">{$add_fail}</span>

<table width="100%" border=0 cellpadding=0 cellspacing=4>
<form name="esrs_add" method="POST" action="http://{$host_url}/">
<tr>
<td id="esrs_label" class="esrs_label">Last Name</td>
<td id="esrs_label" class="esrs_label">First Name</td>
<td id="esrs_label" class="esrs_label">Campus ID</td>
<td id="esrs_label" class="esrs_label" colspan=2>Campus eMail Address</td>
<td id="esrs_label" class="esrs_label">User Role</td>
<td width=1 align=right><input id="esrs_submit" class="esrs_submit" type=submit name="add_user" value=" ADD >>"></td>
</tr>
<tr>
<td id="esrs_field" class="esrs_field"><input id="esrs_text" class="esrs_text" type=text name="esrs_add[last_name]" maxlength=20 size=8 value="{$_add.last_name}"></td>
<td id="esrs_field" class="esrs_field"><input id="esrs_text" class="esrs_text" type=text name="esrs_add[first_name]" maxlength=20 size=8 value="{$_add.first_name}"></td>
<td id="esrs_field" class="esrs_field"><input id="esrs_text" class="esrs_text" type=text name="esrs_add[campus_id]" maxlength=10 size=8 value="{$_add.campus_id}"></td>
<td id="esrs_field" class="esrs_field" width=1><input id="esrs_text" class="esrs_text" type=text name="esrs_add[username]" maxlength=40 size=15 value="{$_add.username}"></td>
<td id="esrs_field" class="esrs_field">@{$_add.menu_domains}</td>
<td id="esrs_field" class="esrs_field">{$_add.menu_user_roles}</td>
<td><input id="esrs_submit" class="esrs_submit" type=reset value="- reset -"></td>
</tr>
</form>
</table>

</div>