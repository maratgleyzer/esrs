<div id="esrs_search" class="esrs_search">

<span id="esrs_heading" class="esrs_heading">Search for Users:</span>

<table width="100%" border=0 cellpadding=0 cellspacing=4>
<form name="esrs_find" method="POST" action="http://{$host_url}/">
<input type=hidden name="sortorder" value="{$_find.sortorder}">
<tr>
<td id="esrs_label" class="esrs_label">Last Name</td>
<td id="esrs_label" class="esrs_label">First Name</td>
<td id="esrs_label" class="esrs_label">Campus ID</td>
<td id="esrs_label" class="esrs_label">User Role</td>
<td id="esrs_label" class="esrs_label" width=1>Disabled</td>
<td width=1><input id="esrs_submit" class="esrs_submit" type=submit name="find_user" value="FIND >>"></td>
</tr>
<tr>
<td id="esrs_field" class="esrs_field"><input id="esrs_text" class="esrs_text" type=text name="esrs_find[last_name]" maxlength=20 size=8 value="{$_find.last_name}"></td>
<td id="esrs_field" class="esrs_field"><input id="esrs_text" class="esrs_text" type=text name="esrs_find[first_name]" maxlength=20 size=8 value="{$_find.first_name}"></td>
<td id="esrs_field" class="esrs_field"><input id="esrs_text" class="esrs_text" type=text name="esrs_find[campus_id]" maxlength=10 size=8 value="{$_find.campus_id}"></td>
<td id="esrs_field" class="esrs_field">{$_find.menu_user_roles}</td>
<td align=center><input id="esrs_check" class="esrs_check" type=checkbox name="esrs_find[disable]" value="1"{if $_find.disable} checked{/if}></td>
<td><input id="esrs_submit" class="esrs_submit" type=reset value="- reset -"></td>
</tr></table>

</div>

<div id="esrs_data" class="esrs_data">

<table width="100%" border=0 cellpadding=3 cellspacing=0>
<tr>
<td id="esrs_label" class="esrs_label" width=40>&nbsp;</td>
<td id="esrs_label" class="esrs_label">(toggle) Last Name, First &nbsp;<a href="javascript:" onClick="esrs_set('esrs_find','sortorder','n_u');"><img src="http://{$host_url}/img/arrw_up.jpg" border=0></a><a href="javascript:" onClick="esrs_set('esrs_find','sortorder','n_d');"><img src="http://{$host_url}/img/arrw_dwn.jpg" border=0></a></td>
<td id="esrs_label" class="esrs_label">Campus ID &nbsp;<a href="javascript:" onClick="esrs_set('esrs_find','sortorder','c_u');"><img src="http://{$host_url}/img/arrw_up.jpg" border=0></a><a href="javascript:" onClick="esrs_set('esrs_find','sortorder','c_d');"><img src="http://{$host_url}/img/arrw_dwn.jpg" border=0></a></td>
<td id="esrs_label" class="esrs_label">(toggle) User Role &nbsp;<a href="javascript:" onClick="esrs_set('esrs_find','sortorder','r_u');"><img src="http://{$host_url}/img/arrw_up.jpg" border=0></a><a href="javascript:" onClick="esrs_set('esrs_find','sortorder','r_d');"><img src="http://{$host_url}/img/arrw_dwn.jpg" border=0></a></td>
<td id="esrs_label" class="esrs_label">Date Created &nbsp;<a href="javascript:" onClick="esrs_set('esrs_find','sortorder','d_u');"><img src="http://{$host_url}/img/arrw_up.jpg" border=0></a><a href="javascript:" onClick="esrs_set('esrs_find','sortorder','d_d');"><img src="http://{$host_url}/img/arrw_dwn.jpg" border=0></a></td>
<td id="esrs_label" class="esrs_label" width=1>&nbsp;</th>
</tr>

{$record_list}

</table>

{if $do_paging}
{include file=$_paging}
{/if}

</form>

</div>