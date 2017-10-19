<table width="100%" cellpadding=0 cellspacing=0 border=0>
<input type=hidden name="esrs_page_start" value="{$page_start}">
<input type=hidden name="esrs_page_limit" value="{$page_limit}">

<tr><td colspan=10>&nbsp;</td></tr>

<tr><td width=250 align=center id="esrs_label" class="esrs_label">

Showing: {$page_range}

</td><td align=center id="esrs_label" class="esrs_label">

{if $paging_options}
Display:
{/if}
&nbsp;

</td><td align=center id="esrs_label" class="esrs_label">

{if $paging_options}
{$paging_options}
{/if}
&nbsp;

</td><td align=center id="esrs_label" class="esrs_label">

{if $page_select}
Go To:
{/if}
&nbsp;

</td><td align=center id="esrs_label" class="esrs_label">

{if $page_select}
{$page_select}
{/if}
&nbsp;

</td><td align=right width=55 id="esrs_label" class="esrs_label">

{$prev_butt}

</td><td align=right width=55 id="esrs_label" class="esrs_label">

{$next_butt}

</td></tr>
</table>