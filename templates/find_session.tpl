<div id="esrs_search" class="esrs_search">

{if $role_id < 4}

<span id="esrs_heading" class="esrs_heading">Search for Sessions:</span>

{else}

<span id="esrs_heading" class="esrs_heading">Search for your desired exam session and register:</span>

<span id="esrs_pass" class="esrs_pass">{$add_pass}</span>
<span id="esrs_fail" class="esrs_fail">{$add_fail}</span>

{/if}

<table width="100%" border=0 cellpadding=0 cellspacing=4>
<form name="esrs_find" method="POST" action="http://{$host_url}/">
<input type=hidden name="sortorder" value="{$_find.sortorder}">
<tr>

{if $role_id < 4}

<td id="esrs_label" class="esrs_label">Department</td>
<td id="esrs_label" class="esrs_label">Exam Course/Term</td>
<td id="esrs_label" class="esrs_label" width=1>Taken</td>
<td id="esrs_label" class="esrs_label" width=1>Empty</td>
<td id="esrs_label" class="esrs_label" width=1>Filled</td>
<td id="esrs_label" class="esrs_label" width=1>Hidden</td>
<td width=1><input id="esrs_submit" class="esrs_submit" type=submit name="find_session" value="FIND >>"></td>
</tr>
<tr>
<td id="esrs_field" class="esrs_field">{$_find.menu_departments}</td>
<td id="esrs_field" class="esrs_field">{$_find.menu_exams}</td>
<td align=center><input id="esrs_check" class="esrs_check" type=checkbox name="esrs_find[taken]" value="1"{if $_find.taken} checked{/if}></td>
<td align=center><input id="esrs_check" class="esrs_check" type=checkbox name="esrs_find[empty]" value="1"{if $_find.empty} checked{/if}></td>
<td align=center><input id="esrs_check" class="esrs_check" type=checkbox name="esrs_find[filled]" value="1"{if $_find.filled} checked{/if}></td>
<td align=center><input id="esrs_check" class="esrs_check" type=checkbox name="esrs_find[hidden]" value="1"{if $_find.hidden} checked{/if}></td>
<td><input id="esrs_submit" class="esrs_submit" type=reset value="- reset -"></td>

{else}

<td id="esrs_label" class="esrs_label">Department</td>
<td id="esrs_label" class="esrs_label">Exam Course/Term</td>
<td width=1><input id="esrs_submit" class="esrs_submit" type=submit name="find_session" value="FIND >>"></td>
</tr>
<tr>
<td id="esrs_field" class="esrs_field">{$_find.menu_departments}</td>
<td id="esrs_field" class="esrs_field">{$_find.menu_exams}</td>
<td>&nbsp;</td>

{/if}

</tr></table>

</div>

<div id="esrs_data" class="esrs_data">

{if $role_id > 3}
{if !$_find.no_labels}

<div id="esrs_copy" class="esrs_copy">
Click the GREEN (REGISTER) LINK to attend the related exam session. Exam sessions you have registered for, will be highlighted in yellow at the top of the record list. To view registrants for a particular exam session, click the GREEN (ROSTER) LINK next to the number registered for the related exam session. Use the up/down arrows to sort records by the desired column.
</div>
<br>

{/if}
{/if}

<table width="100%" border=0 cellpadding=3 cellspacing=0>
<tr>

{if $role_id < 4}

<td id="esrs_label" class="esrs_label" width=40>&nbsp;</td>
<td id="esrs_label" class="esrs_label">Course</td>
<td id="esrs_label" class="esrs_label">Location &nbsp;<a href="javascript:" onClick="esrs_set('esrs_find','sortorder','r_u');"><img alt="sort up" src="http://{$host_url}/img/arrw_up.jpg" border=0></a><a href="javascript:" onClick="esrs_set('esrs_find','sortorder','r_d');"><img alt="sort down" src="http://{$host_url}/img/arrw_dwn.jpg" border=0></a></td>
<td id="esrs_label" class="esrs_label">Capacity</td>
<td id="esrs_label" class="esrs_label">Registered</td>
<td id="esrs_label" class="esrs_label">Facilitator &nbsp;<a href="javascript:" onClick="esrs_set('esrs_find','sortorder','u_u');"><img alt="sort up" src="http://{$host_url}/img/arrw_up.jpg" border=0></a><a href="javascript:" onClick="esrs_set('esrs_find','sortorder','u_d');"><img alt="sort down" src="http://{$host_url}/img/arrw_dwn.jpg" border=0></a></td>
<td id="esrs_label" class="esrs_label">Date @ Time &nbsp;<a href="javascript:" onClick="esrs_set('esrs_find','sortorder','t_u');"><img alt="sort up" src="http://{$host_url}/img/arrw_up.jpg" border=0></a><a href="javascript:" onClick="esrs_set('esrs_find','sortorder','t_d');"><img alt="sort down" src="http://{$host_url}/img/arrw_dwn.jpg" border=0></a></td>
<td id="esrs_label" class="esrs_label" width=1>&nbsp;</td>

{else}
{if !$_find.no_labels}

<td id="esrs_label" class="esrs_label">Course</td>
<td id="esrs_label" class="esrs_label">Location &nbsp;<a href="javascript:" onClick="esrs_set('esrs_find','sortorder','r_u');"><img alt="sort up" src="http://{$host_url}/img/arrw_up.jpg" border=0></a><a href="javascript:" onClick="esrs_set('esrs_find','sortorder','r_d');"><img alt="sort down" src="http://{$host_url}/img/arrw_dwn.jpg" border=0></a></td>
<td id="esrs_label" class="esrs_label">Capacity</td>
<td id="esrs_label" class="esrs_label">Registered</td>
<td id="esrs_label" class="esrs_label">Facilitator &nbsp;<a href="javascript:" onClick="esrs_set('esrs_find','sortorder','u_u');"><img alt="sort up" src="http://{$host_url}/img/arrw_up.jpg" border=0></a><a href="javascript:" onClick="esrs_set('esrs_find','sortorder','u_d');"><img alt="sort down" src="http://{$host_url}/img/arrw_dwn.jpg" border=0></a></td>
<td id="esrs_label" class="esrs_label">Date @ Time &nbsp;<a href="javascript:" onClick="esrs_set('esrs_find','sortorder','t_u');"><img alt="sort up" src="http://{$host_url}/img/arrw_up.jpg" border=0></a><a href="javascript:" onClick="esrs_set('esrs_find','sortorder','t_d');"><img alt="sort down" src="http://{$host_url}/img/arrw_dwn.jpg" border=0></a></td>
<td id="esrs_label" class="esrs_label">&nbsp;</td>
<td id="esrs_label" class="esrs_label" width=1>&nbsp;</td>

{/if}
{/if}

</tr>

{$record_list}

</table>

{if $do_paging}
{include file=$_paging}
{/if}

</form>

</div>