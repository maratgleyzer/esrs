<?php /* Smarty version 2.6.20, created on 2009-02-02 03:47:49
         compiled from signin.tpl */ ?>
<form name="signin" method="POST" action="http://<?php echo $this->_tpl_vars['host_url']; ?>
/">

<span id="esrs_signin" class="esrs_signin">

<div id="esrs_copy" class="esrs_copy">

<div id="esrs_title" class="esrs_title">
Exam Scheduling &amp; Registration System (ESRS)
</div>

To access your user console, please complete the form below with the 'Username' and 'Password' you SHOULD have received in your confirmation email, after you registered to use this system. Remember to click the validation link in your confirmation email, to verify your email address.

</div>

<p>
<div id="esrs_fail" class="esrs_fail"><?php echo $this->_tpl_vars['login_fail']; ?>
</div>
<div id="esrs_pass" class="esrs_pass"><?php echo $this->_tpl_vars['login_pass']; ?>
</div>
</p>

<table border=0 cellpadding=0 cellspacing=4>
<tr><td id="esrs_label" class="esrs_label">Username</td></tr>
<tr><td id="esrs_field" class="esrs_field"><input class="esrs_text" type=text name="username" maxlength=40 size=20 value="<?php echo $this->_tpl_vars['_fields']['username']; ?>
"></td></tr>
<tr><td id="esrs_label" class="esrs_label">Password</td></tr>
<tr><td id="esrs_field" class="esrs_field"><input id="esrs_text" class="esrs_text" type=password name="password" maxlength=20 size=20><br><font size=1>(case sensitive)</font></td></tr>
<tr><td id="esrs_field" class="esrs_field"><br><input id="esrs_submit" class="esrs_submit" type=submit name="login" value="Login"></td>
</tr></table>

</form>

</span>

<p><br>
<!--
<a href="?q=cHJvYz1mb3Jnb3Q=">Forget your password?</a>
/-->