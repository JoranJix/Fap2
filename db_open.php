<?php

$dbhost = 'localhost';
$dbuser = 'username';
$dbpass = 'password';
$mysqli = new mysqli($dbhost, $dbuser, $dbpass, "fap2");
//echo 'Connected successfully';
if ($mysqli->connect_errno) {
    echo "Failed to connect to MySQL: (" . $mysqli->connect_errno . ") " . $mysqli->connect_error;
}
?>
