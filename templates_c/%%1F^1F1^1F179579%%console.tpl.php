<?php /* Smarty version 2.6.20, created on 2009-02-02 00:30:00
         compiled from console.tpl */ ?>
<div id="esrs_console" class="esrs_console">

<div id="esrs_nav_bar" class="esrs_nav_bar">

<table width="100%" border=0 cellpadding=0 cellspacing=0>
<tr><td>
<span id="esrs_nav_off" class="esrs_nav_off">Manage:</span>
<?php if ($this->_tpl_vars['_tools']['123']): ?><span <?php if ($this->_tpl_vars['_tools']['123']['on']): ?>id="esrs_nav_on" class="esrs_nav_on"<?php else: ?>id="esrs_nav_off" class="esrs_nav_off"<?php endif; ?>><a id="esrs_nav_a" class="esrs_nav_a" href="http://<?php echo $this->_tpl_vars['host_url']; ?>
/?<?php echo $this->_tpl_vars['_tools']['123']['url']; ?>
"><?php if ($this->_tpl_vars['role_id'] > 3): ?>Student Users<?php else: ?>Users<?php endif; ?></a></span><?php endif; ?>

<?php if ($this->_tpl_vars['_tools']['124']): ?><span <?php if ($this->_tpl_vars['_tools']['124']['on']): ?>id="esrs_nav_on" class="esrs_nav_on"<?php else: ?>id="esrs_nav_off" class="esrs_nav_off"<?php endif; ?>><a id="esrs_nav_a" class="esrs_nav_a" href="http://<?php echo $this->_tpl_vars['host_url']; ?>
/?<?php echo $this->_tpl_vars['_tools']['124']['url']; ?>
">Departments</a></span><?php endif; ?>

<?php if ($this->_tpl_vars['_tools']['125']): ?><span <?php if ($this->_tpl_vars['_tools']['125']['on']): ?>id="esrs_nav_on" class="esrs_nav_on"<?php else: ?>id="esrs_nav_off" class="esrs_nav_off"<?php endif; ?>><a id="esrs_nav_a" class="esrs_nav_a" href="http://<?php echo $this->_tpl_vars['host_url']; ?>
/?<?php echo $this->_tpl_vars['_tools']['125']['url']; ?>
">Courses</a></span><?php endif; ?>

<?php if ($this->_tpl_vars['_tools']['126']): ?><span <?php if ($this->_tpl_vars['_tools']['126']['on']): ?>id="esrs_nav_on" class="esrs_nav_on"<?php else: ?>id="esrs_nav_off" class="esrs_nav_off"<?php endif; ?>><a id="esrs_nav_a" class="esrs_nav_a" href="http://<?php echo $this->_tpl_vars['host_url']; ?>
/?<?php echo $this->_tpl_vars['_tools']['126']['url']; ?>
">Exams</a></span><?php endif; ?>

<?php if ($this->_tpl_vars['_tools']['127']): ?><span <?php if ($this->_tpl_vars['_tools']['127']['on']): ?>id="esrs_nav_on" class="esrs_nav_on"<?php else: ?>id="esrs_nav_off" class="esrs_nav_off"<?php endif; ?>><a id="esrs_nav_a" class="esrs_nav_a" href="http://<?php echo $this->_tpl_vars['host_url']; ?>
/?<?php echo $this->_tpl_vars['_tools']['127']['url']; ?>
"><?php if ($this->_tpl_vars['role_id'] > 3): ?>Exam Sessions<?php else: ?>Sessions<?php endif; ?></a></span><?php endif; ?>

<?php if ($this->_tpl_vars['_tools']['128']): ?><span <?php if ($this->_tpl_vars['_tools']['128']['on']): ?>id="esrs_nav_on" class="esrs_nav_on"<?php else: ?>id="esrs_nav_off" class="esrs_nav_off"<?php endif; ?>><a id="esrs_nav_a" class="esrs_nav_a" href="http://<?php echo $this->_tpl_vars['host_url']; ?>
/?<?php echo $this->_tpl_vars['_tools']['128']['url']; ?>
">Terms</a></span><?php endif; ?>

<?php if ($this->_tpl_vars['_tools']['129']): ?><span <?php if ($this->_tpl_vars['_tools']['129']['on']): ?>id="esrs_nav_on" class="esrs_nav_on"<?php else: ?>id="esrs_nav_off" class="esrs_nav_off"<?php endif; ?>><a id="esrs_nav_a" class="esrs_nav_a" href="http://<?php echo $this->_tpl_vars['host_url']; ?>
/?<?php echo $this->_tpl_vars['_tools']['129']['url']; ?>
">Rooms</a></span><?php endif; ?>

<?php if ($this->_tpl_vars['_tools']['130']): ?><span <?php if ($this->_tpl_vars['_tools']['130']['on']): ?>id="esrs_nav_on" class="esrs_nav_on"<?php else: ?>id="esrs_nav_off" class="esrs_nav_off"<?php endif; ?>><a id="esrs_nav_a" class="esrs_nav_a" href="http://<?php echo $this->_tpl_vars['host_url']; ?>
/?<?php echo $this->_tpl_vars['_tools']['130']['url']; ?>
">Buildings</a></span><?php endif; ?>

<?php if ($this->_tpl_vars['_tools']['131']): ?><span <?php if ($this->_tpl_vars['_tools']['131']['on']): ?>id="esrs_nav_on" class="esrs_nav_on"<?php else: ?>id="esrs_nav_off" class="esrs_nav_off"<?php endif; ?>><a id="esrs_nav_a" class="esrs_nav_a" href="http://<?php echo $this->_tpl_vars['host_url']; ?>
/?<?php echo $this->_tpl_vars['_tools']['131']['url']; ?>
">Campuses</a></span><?php endif; ?>

</td><td align=right>

<span id="esrs_nav_home" class="esrs_nav_home">
<a id="esrs_nav_a" class="esrs_nav_a" href="http://<?php echo $this->_tpl_vars['host_url']; ?>
/?<?php echo $this->_tpl_vars['_home_link']; ?>
">Home</a>
| <a id="esrs_nav_a" class="esrs_nav_a" href="http://<?php echo $this->_tpl_vars['host_url']; ?>
/?<?php echo $this->_tpl_vars['_logout_link']; ?>
">Logout</a>
</span>

</td></tr>
</table>

</div>

<?php if ($this->_tpl_vars['_role_home']): ?>
<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => $this->_tpl_vars['_role_home'], 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>

<?php else: ?>

<?php if ($this->_tpl_vars['_data_change']): ?>
<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => $this->_tpl_vars['_data_change'], 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
<?php endif; ?>

<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => $this->_tpl_vars['_data_search'], 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>

<?php endif; ?>

</div>