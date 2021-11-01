<!DOCTYPE html>
<html>
<head>

<title>Mond-Keks.de FAP2 - Profile</title>
<style>
body
{ 
	background-color: #001118; 
	color: #29b6f6;
}
a:link 
{
  color: #29b6f6; 
}
a:visited:focus 
{ 
  color: #29b6f6;
  background: #35363a; 
}
input[type=button], input[type=submit], input[type=reset] 
{
  background-color: #012231;
  border: none;
  color: black;
  padding: 16px 32px;
  text-decoration: none;
  margin: 4px 2px;
  cursor: pointer;
}
</style>
</head>
<body>
<?php
require_once ('db_open.php');
require_once ('lib.php');
$uuid = $_GET["uuid"];
$sql = "SELECT * FROM users2 WHERE uuid = '$uuid'";
//$sql = "SELECT * FROM achievements";
$db_erg = mysqli_query( $mysqli, $sql );
if (! $db_erg )
{
  die('No Entry: ' . mysqli_error());
}
echo "<a href=index.php><img src=images/back.png width=120 height=30></a>";
echo "<a href=../"."><img src=images/mondkeks.png width=120 height=30></a>";
echo "<a href=secondlife:///app/group/ef8e3856-381b-d0d3-86fb-91e83e5f59ac/about"."><img src=images/group.png width=120 height=30></a>";
echo "<a href=https://discord.gg/PqXP5T4HP7"."><img src=images/discord.png width=120 height=30></a>";
echo "<a href=../doku.php?id=fap2privpol"."><img src=images/privacy.png width=120 height=30></a>";
echo "". "<a href=reward.php?uuid=".$uuid."><img src=images/reward.png width=120 height=30></a>" . "";
echo "</br>";
while ($zeile = mysqli_fetch_array( $db_erg, MYSQLI_ASSOC))
{
      echo "<h1><strong>Profile of ".$zeile['displayname']."</strong></h1></br>";
      echo "</br>";
      if($zeile['picture'] != 'no picture' && $zeile['picture'] != '')
      {
          if(strlen ($zeile['picture'])==36)
          echo "<img src=http://secondlife.com/app/image/". $zeile['picture'] ."/1 width=420 height=420></strong></br>";
          else
          echo "<img src=".$zeile['picture'] ." width=420 height=420></strong></br>";
      }
      echo "</br>";
      echo "<strong>Display Name: ". $zeile['displayname'] . "</strong></br>";
      echo "<strong>Legacy Name: ". $zeile['firstname'] ." ". $zeile['lastname']. "</strong></br>";
      echo "<strong>XP: ". $zeile['experience'] . "</strong></br>";
      echo "<strong>Species: ". $zeile['race'] . "</strong></br>";
      echo "<strong>Gender: ". $zeile['gender'] . "</strong></br>";
      echo "<strong>Sexual orientation: ". $zeile['orientation'] . "</strong></br>";
      echo "<strong>Style of body: ". $zeile['body'] . "</strong></br>";
      if($zeile['boobs'] == "1")
      {
        echo "<strong>Has boobs: ". "Yes" . "</strong></br>";
      }
      else if($zeile['boobs'] != "1")
      {
        echo "<strong>". "No" . "</strong></br>";
      }
      echo "<strong>Wearing bits: ". $zeile['bits'] . "</strong></br>";
      echo "<strong>Kinks: ". $zeile['kinks'] . "</strong></br>";
      echo "<strong>Taboos: ". $zeile['taboo'] . "</strong></br>";
      echo "<strong>Interested in long time relationship: ". $zeile['longtime'] . "</strong></br>";
      if($zeile['rape'] == "1")
      {
        echo "<strong>Does rape rp: ". "Yes" . "</strong></br>";
      }
      else if($zeile['rape'] != "1")
      {
        echo "<strong>Does rape rp: ". "No" . "</strong></br>";
      }
      if($zeile['financial'] == "1")
      {
        echo "<strong>Has financial interests: ". "Yes" . "</strong></br>";
      }
      else if($zeile['financial'] != "1")
      {
        echo "<strong>Has financial interests: ". "No" . "</strong></br>";
      }
      echo "<strong>Discord: ". $zeile['discord'] . "</strong></br>";
      echo "<strong>Flickr: ". $zeile['flickr'] . "</strong></br>";
      echo "</br>";
      if($zeile['info'] != '')
      {
        echo "<strong>". $zeile['info'] . "</strong></br>";
        echo "</br>";
      }
      
    }
mysqli_free_result( $db_erg );
?>
</body>
</html>
