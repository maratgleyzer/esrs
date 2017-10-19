<div id="esrs_search" class="esrs_search">

<span id="esrs_heading" class="esrs_heading">Search for Exams:</span>

<table width="100%" border=0 cellpadding=0 cellspacing=4>
<form name="esrs_find" method="POST" action="http://{$host_url}/">
<input type=hidden name="sortorder" value="{$_find.sortorder}">
<tr>
<td id="esrs_label" class="esrs_label">Department</td>
<td id="esrs_label" class="esrs_label">Course</td>
<td id="esrs_label" class="esrs_label">Term</td>
<td id="esrs_label" class="esrs_label" width=1>Disabled</td>
<td width=1><input id="esrs_submit" class="esrs_submit" type=submit name="find_exam" value="FIND >>"></td>
</tr>
<tr>
<td id="esrs_field" class="esrs_field">{$_find.menu_departments}</td>
<td id="esrs_field" class="esrs_field">{$_find.menu_courses}</td>
<td id="esrs_field" class="esrs_field">{$_find.menu_terms}</td>
<td align=center><input id="esrs_check" class="esrs_check" type=checkbox name="esrs_find[disable]" value="1"{if $_find.disable} checked{/if}></td>
<td><input id="esrs_submit" class="esrs_submit" type=reset value="- reset -"></td>
</tr></table>

</div>

<div id="esrs_data" class="esrs_data">

<table width="100%" border=0 cellpadding=3 cellspacing=0>
<tr>
<td id="esrs_label" class="esrs_label" width=40>&nbsp;</td>
<td id="esrs_label" class="esrs_label">Department &nbsp;<a href="javascript:" onClick="esrs_set('esrs_find','sortorder','d_u');"><img alt="sort up" src="http://{$host_url}/img/arrw_up.jpg" border=0></a><a href="javascript:" onClick="esrs_set('esrs_find','sortorder','d_d');"><img alt="sort down" src="http://{$host_url}/img/arrw_dwn.jpg" border=0></a></td>
<td id="esrs_label" class="esrs_label">Course &nbsp;<a href="javascript:" onClick="esrs_set('esrs_find','sortorder','c_u');"><img alt="sort up" src="http://{$host_url}/img/arrw_up.jpg" border=0></a><a href="javascript:" onClick="esrs_set('esrs_find','sortorder','c_d');"><img alt="sort down" src="http://{$host_url}/img/arrw_dwn.jpg" border=0></a></td>
<td id="esrs_label" class="esrs_label">Term &nbsp;<a href="javascript:" onClick="esrs_set('esrs_find','sortorder','t_u');"><img alt="sort up" src="http://{$host_url}/img/arrw_up.jpg" border=0></a><a href="javascript:" onClick="esrs_set('esrs_find','sortorder','t_d');"><img alt="sort down" src="http://{$host_url}/img/arrw_dwn.jpg" border=0></a></td>
<td id="esrs_label" class="esrs_label">Active Dates &nbsp;<a href="javascript:" onClick="esrs_set('esrs_find','sortorder','a_u');"><img alt="sort up" src="http://{$host_url}/img/arrw_up.jpg" border=0></a><a href="javascript:" onClick="esrs_set('esrs_find','sortorder','a_d');"><img alt="sort down" src="http://{$host_url}/img/arrw_dwn.jpg" border=0></a></td>
<td id="esrs_label" class="esrs_label" width=1>(toggle)</td>
</tr>

{$record_list}

</table>

{if $do_paging}
{include file=$_paging}
{/if}

</form>

</div>