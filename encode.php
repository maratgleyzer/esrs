<html><head>
<title>(ESRS) ENCODER/CRYPTER</title>
</head>
<body>

<form name="encode" method="POST" action="encode.php">
<input type=text name="string" size=50>
<input type=submit name="crypt" value="crypt">
<input type=submit name="encode" value="encode">
<input type=submit name="decode" value="decode">
</form>

</body>
</html>


<?php


if ($_POST['crypt'])
{

$string = $_POST['string'];

$crypted = m_crypt($string);

echo "$string = $crypted";

}


if ($_POST['encode'])
{

$string = $_POST['string'];

$encoded = m_encode_q($string);

echo "$string = $encoded";

}


if ($_POST['decode'])
{

$string = $_POST['string'];

$decoded = m_decode_q($string);

echo "$string = $decoded";

}




function m_decode_q($query=null)
{

return convert_uudecode(urldecode(base64_decode($query)));

}




function m_encode_q($query=null)
{

return base64_encode(urlencode(convert_uuencode($query)));

}



function m_crypt($query=null)
{

$seed = "uoc";

return crypt($query,$seed);

}

?>