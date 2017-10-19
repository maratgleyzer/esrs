<div id="esrs_console" class="esrs_console">

{if $_role_play}
{include file=$_role_play}

{else}

<table width="100%" cellpadding=0 cellspacing=10 border=0>
<tr><td width="50%" align=center valign=top>

{include file=$_signin}

</td>
<td width="50%" align=center valign=top>

{include file=$_signup}

</td></tr>
</table>

{/if}

</div>