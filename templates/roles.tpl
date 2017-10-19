<div id="esrs_data" class="esrs_data">

<div id="esrs_pass" class="esrs_pass">{$login_pass}</div>

Below is a list of 'user roles' assigned to your registration. Please select the role you would like to administer.

<p align=center>

<table width="60%" border=0 cellpadding=0 cellspacing=0>
<tr>
<td id="esrs_label" class="esrs_label">Date Created</td>
<td id="esrs_label" class="esrs_label">User Role</td>
<td id="esrs_label" class="esrs_label">&nbsp;</td>
</tr>

{foreach from=$_result item=i}

<tr>
<td id="{$i.row}" class="{$i.row}">{$i.created_u2r}</td>
<td id="{$i.row}" class="{$i.row}">{$i.role}</td>
<td id="{$i.row}" class="{$i.row}"><a href="http://{$host_url}/index.php?{$i.query_string}">administer</a></td>
</tr>

{/foreach}

</table>

</p>

</div>