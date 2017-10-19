<div id="esrs_console" class="esrs_console">

<div id="esrs_nav_bar" class="esrs_nav_bar">

<table width="100%" border=0 cellpadding=0 cellspacing=0>
<tr><td>
<span id="esrs_nav_off" class="esrs_nav_off">Manage:</span>
{if $_tools.131}<span {if $_tools.131.on}id="esrs_nav_on" class="esrs_nav_on"{else}id="esrs_nav_off" class="esrs_nav_off"{/if}><a id="esrs_nav_a" class="esrs_nav_a" href="http://{$host_url}/?{$_tools.131.url}">Campuses</a></span>{/if}

{if $_tools.130}<span {if $_tools.130.on}id="esrs_nav_on" class="esrs_nav_on"{else}id="esrs_nav_off" class="esrs_nav_off"{/if}><a id="esrs_nav_a" class="esrs_nav_a" href="http://{$host_url}/?{$_tools.130.url}">Buildings</a></span>{/if}

{if $_tools.129}<span {if $_tools.129.on}id="esrs_nav_on" class="esrs_nav_on"{else}id="esrs_nav_off" class="esrs_nav_off"{/if}><a id="esrs_nav_a" class="esrs_nav_a" href="http://{$host_url}/?{$_tools.129.url}">Rooms</a></span>{/if}

{if $_tools.128}<span {if $_tools.128.on}id="esrs_nav_on" class="esrs_nav_on"{else}id="esrs_nav_off" class="esrs_nav_off"{/if}><a id="esrs_nav_a" class="esrs_nav_a" href="http://{$host_url}/?{$_tools.128.url}">Terms</a></span>{/if}

{if $_tools.124}<span {if $_tools.124.on}id="esrs_nav_on" class="esrs_nav_on"{else}id="esrs_nav_off" class="esrs_nav_off"{/if}><a id="esrs_nav_a" class="esrs_nav_a" href="http://{$host_url}/?{$_tools.124.url}">Departments</a></span>{/if}

{if $_tools.125}<span {if $_tools.125.on}id="esrs_nav_on" class="esrs_nav_on"{else}id="esrs_nav_off" class="esrs_nav_off"{/if}><a id="esrs_nav_a" class="esrs_nav_a" href="http://{$host_url}/?{$_tools.125.url}">Courses</a></span>{/if}

{if $_tools.126}<span {if $_tools.126.on}id="esrs_nav_on" class="esrs_nav_on"{else}id="esrs_nav_off" class="esrs_nav_off"{/if}><a id="esrs_nav_a" class="esrs_nav_a" href="http://{$host_url}/?{$_tools.126.url}">Exams</a></span>{/if}

{if $_tools.127}<span {if $_tools.127.on}id="esrs_nav_on" class="esrs_nav_on"{else}id="esrs_nav_off" class="esrs_nav_off"{/if}><a id="esrs_nav_a" class="esrs_nav_a" href="http://{$host_url}/?{$_tools.127.url}">{if $role_id > 3}Exam Sessions{else}Sessions{/if}</a></span>{/if}

{if $_tools.123}<span {if $_tools.123.on}id="esrs_nav_on" class="esrs_nav_on"{else}id="esrs_nav_off" class="esrs_nav_off"{/if}><a id="esrs_nav_a" class="esrs_nav_a" href="http://{$host_url}/?{$_tools.123.url}">{if $role_id > 3}Student Users{else}Users{/if}</a></span>{/if}

</td><td align=right>

<span id="esrs_nav_home" class="esrs_nav_home">
<a id="esrs_nav_a" class="esrs_nav_a" href="http://{$host_url}/?{$_home_link}">Home</a>
| <a id="esrs_nav_a" class="esrs_nav_a" href="http://{$host_url}/?{$_logout_link}">Logout</a>
</span>

</td></tr>
</table>

</div>

{if $_role_home}
{include file=$_role_home}

{else}

{if $_data_change}
{include file=$_data_change}
{/if}

{include file=$_data_search}

{/if}

</div>