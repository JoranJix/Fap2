<!DOCTYPE html>
<html>
<head>

<title>Mond-Keks.de FAP2 - User Database</title>
<style>
body
{ 
	background-color: #001118; 
	color: #29b6f6;
}
a:link {
  color: #29b6f6; 
}
a:visited:focus { 
  color: #29b6f6;
  background: #35363a; 
}
table 
{
	border-collapse: collapse;
	width: 100%;
	color: #29b6f6;
	font-family: monospace;
	font-size: 15px;
	text-align: center;
}
input[type=button], input[type=submit], input[type=reset] {
  background-color: #012231;
  border: none;
  color: black;
  padding: 16px 32px;
  text-decoration: none;
  margin: 4px 2px;
  cursor: pointer;
}
th 
{
background-color: #001118;
color: #29b6f6;
}
tr:nth-child(even) {background-color: #000000}
</style>
</head>
<body>
<table>
<?php
require_once ('db_open.php');
require_once ('lib.php');

$sql = "SELECT * FROM users2 ORDER BY firstname ASC";
$db_erg = mysqli_query( $mysqli, $sql );
if (! $db_erg )
{
  die('Ungültige Abfrage: ' . mysqli_error());
}
echo '<table border="1">';

  echo "<tr>";
  echo "<td>". "<strong>Displayname</strong>" . "</td>";
  echo "<td>". "<strong>XP</strong>" . "</td>";
  echo "<td>". "<strong>Species</strong>" . "</td>";
  echo "<td>". "<strong>Gender</strong>" . "</td>";
  echo "<td>". "<strong>Orientation</strong>" . "</td>";
  echo "<td>". "<strong>Body</strong>" . "</td>";
  echo "<td>". "<strong>Boobs</strong>" . "</td>";
  echo "<td>". "<strong>Bits</strong>" . "</td>";
  echo "<td>". "<strong>Kinks</strong>" . "</td>";
  echo "<td>". "<strong>Taboos</strong>" . "</td>";
  echo "<td>". "<strong>Relationship</strong>" . "</td>";
  echo "<td>". "<strong>Rape</strong>" . "</td>";
  echo "<td>". "<strong>Financial</strong>" . "</td>";
  echo "<td>". "<strong>Banned</strong>" . "</td>";
  echo "<td>". "<strong>in search</strong>" . "</td>";
  echo "<td>". "<strong>Achievements</strong>" . "</td>";
  echo "</tr>";
  while ($zeile = mysqli_fetch_array( $db_erg, MYSQLI_ASSOC))
  {
      echo "<tr>";
      echo "<td>". "<strong><a href=profile.php?uuid=".$zeile['uuid'].">".$zeile['displayname']."</a></strong>" . "</td>";
      echo "<td><strong>". $zeile['experience'] . "</strong></td>";
      echo "<td><strong>". $zeile['race'] . "</strong></td>";
      echo "<td><strong>". $zeile['gender'] . "</strong></td>";
      echo "<td><strong>". $zeile['orientation'] . "</strong></td>";
      echo "<td><strong>". $zeile['body'] . "</strong></td>";
      if($zeile['boobs'] == "1")
      {
        echo "<td><strong>". "Yes" . "</strong></td>";
      }
      else if($zeile['boobs'] != "1")
      {
        echo "<td><strong>". "No" . "</strong></td>";
      }
      echo "<td><strong>". $zeile['bits'] . "</strong></td>";
      echo "<td><strong>". $zeile['kinks'] . "</strong></td>";
      echo "<td><strong>". $zeile['taboo'] . "</strong></td>";
      echo "<td><strong>". $zeile['longtime'] . "</strong></td>";
      if($zeile['rape'] == "1")
      {
        echo "<td><strong>". "Yes" . "</strong></td>";
      }
      else if($zeile['rape'] != "1")
      {
        echo "<td><strong>". "No" . "</strong></td>";
      }
      if($zeile['financial'] == "1")
      {
        echo "<td><strong>". "Yes" . "</strong></td>";
      }
      else if($zeile['financial'] != "1")
      {
        echo "<td><strong>". "No" . "</strong></td>";
      }
      if($zeile['banned'] == "1")
      {
        echo "<td><strong>". "Yes" . "</strong></td>";
      }
      else if($zeile['banned'] != "1")
      {
        echo "<td><strong>". "No" . "</strong></td>";
      }
      if($zeile['search'] == "1")
      {
        echo "<td><strong>". "Yes" . "</strong></td>";
      }
      else if($zeile['search'] != "1")
      {
        echo "<td><strong>". "No" . "</strong></td>";
      }
      echo "<td>". "<strong><a href=achievements.php?uuid=".$zeile['uuid'].">Link</a></strong>" . "</td>";
      echo "</tr>";
    }
      echo "</tr>";
echo "</table>"; 
mysqli_free_result( $db_erg );
?>
</body>
</html>