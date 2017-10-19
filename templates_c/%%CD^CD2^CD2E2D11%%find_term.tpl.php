<?php /* Smarty version 2.6.20, created on 2009-02-01 12:06:02
         compiled from find_term.tpl */ ?>
<div id="esrs_data" class="esrs_data">

<table width="100%" border=0 cellpadding=3 cellspacing=0>
<form name="esrs_find" method="POST" action="http://<?php echo $this->_tpl_vars['host_url']; ?>
/">
<input type=hidden name="sortorder" value="<?php echo $this->_tpl_vars['_find']['sortorder']; ?>
">
<tr>
<td id="esrs_label" class="esrs_label" width=40>&nbsp;</td>
<td id="esrs_label" class="esrs_label">(toggle) Term</td>
<td id="esrs_label" class="esrs_label">Section</td>
<td id="esrs_label" class="esrs_label">Period</td>
<td id="esrs_label" class="esrs_label">Year</td>
<td id="esrs_label" class="esrs_label" width=1>&nbsp;</th>
</tr>

<?php echo $this->_tpl_vars['record_list']; ?>


</form>
</table>

</div>