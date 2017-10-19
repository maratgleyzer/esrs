<form name="signup" method="POST" action="http://{$host_url}/">

<span id="esrs_signup" class="esrs_signup">

<div id="esrs_copy" class="esrs_copy">

<div id="esrs_title" class="esrs_title">
CALLING ALL STUDENTS!! Register here...
</div>

Complete the form below and register to use the (ESRS). You will receive an email confirmation with your 'Username' and 'Password' to the submitted campus address. Click the validation link included in the email to verify your email address; then log in and select your desired exam sessions.

</div>

<p>
<div id="esrs_fail" class="esrs_fail">{$register_fail}</div>
<div id="esrs_pass" class="esrs_pass">{$register_pass}</div>
</p>

<table border=0 cellpadding=0 cellspacing=4>
<tr><td id="esrs_label" class="esrs_label">First Name</td><td id="esrs_label" class="esrs_label">Last Name</td></tr>
<tr><td id="esrs_field" class="esrs_field"><input id="esrs_text" class="esrs_text" type=text name="esrs_add[first_name]" maxlength=20 size=15 value="{$_fields.first_name}"></td><td class="esrs_field"><input id="esrs_text" class="esrs_text" type=text name="esrs_add[last_name]" maxlength=20 size=15 value="{$_fields.last_name}"></td></tr>
<tr><td id="esrs_label" class="esrs_label" colspan=2>Campus eMail Address</td></tr>
<tr><td id="esrs_field" class="esrs_field" colspan=2><input id="esrs_text" class="esrs_text" type=text name="esrs_add[email_address]" maxlength=40 size=15 value="{$_fields.email_address}"> @{$email_domain}<br>Confirm Your eMail<br><input id="esrs_text" class="esrs_text" type=text name="esrs_add[confirm_email]" maxlength=40 size=15 value="{$_fields.confirm_email}"> @{$email_domain}</td></tr>
<tr><td id="esrs_label" class="esrs_label" colspan=2>Campus ID</td></tr>
<tr><td id="esrs_field" class="esrs_field" colspan=2><input id="esrs_text" class="esrs_text" type=text name="esrs_add[campus_id]" maxlength=10 size=15 value="{$_fields.campus_id}"> <font size=1>(ie. Student ID)</font><br>Confirm Your ID<br><input id="esrs_text" class="esrs_text" type=text name="esrs_add[confirm_id]" maxlength=10 size=15 value="{$_fields.confirm_id}"></td></tr>
<tr><td id="esrs_field" class="esrs_field" colspan=2><br><input id="esrs_submit" class="esrs_submit" type=submit name="register" value="Register"></td></tr>
</table>

</form>

</span>

<p><br>
<b>All fields are required.</b>