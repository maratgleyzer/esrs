<?php

//initiate the system with global vars and object starts
require_once("../_autoload.php");

$sql = "update users2exams set notice = 0 where notice = 1";
$result = $o_db->m_update($sql);

$sql = "update users2sessions set notice = 0 where notice = 1";
$result = $o_db->m_update($sql);

$sql = "update sessions set notice = 0 where notice = 1";
$result = $o_db->m_update($sql);

?>
