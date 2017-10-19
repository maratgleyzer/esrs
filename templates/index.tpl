{include file=$_header}

<div id="esrs_main" class="esrs_main">

{if $_authorized}
{include file=$_console}
{else}
{include file=$_portal}
{/if}

</div>

{include file=$_footer}
