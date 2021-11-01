<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>FAP2 - Rewards Database</title>
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
  background: #001118; 
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
table 
{
    border-collapse:separate;
    border:solid black 0px;
    border-radius:10px;
    -moz-border-radius:10px;
}

td, th 
{
    border-left:solid black 0px;
    border-top:solid black 1px;
}

th 
{
    background-color: #001118;
    border-top: none;
}

td:first-child, th:first-child 
{
     border-left: none;
}
table tr:hover td 
{
  background-color: #003d80 !important
}
.center {
  margin-left: auto;
  margin-right: auto;
}

.chip {
  display: inline-block;
  padding: 0 25px;
  height: 50px;
  font-size: 16px;
  line-height: 50px;
  border-radius: 25px;
  background-color: #012231;
}

.chip img {
  float: left;
  margin: 0 10px 0 -25px;
  height: 50px;
  width: 50px;
  border-radius: 50%;
}
</style>
</head>
<body>
<table>
<?php
require_once ('db_open.php');
require_once ('lib.php');
$uuid = $_GET["uuid"];
$sql = "SELECT * FROM achievements WHERE uuid = '$uuid'";
//$sql = "SELECT * FROM achievements";
$db_erg = mysqli_query( $mysqli, $sql );
if (!$db_erg )
{
  die('No Entry: ' . mysqli_error());
}
echo "<center><a href=index.php><img src=images/back.png width=120 height=30></a>";
echo "<a href=../"."><img src=images/mondkeks.png width=120 height=30></a>";
echo "<a href=secondlife:///app/group/ef8e3856-381b-d0d3-86fb-91e83e5f59ac/about"."><img src=images/group.png width=120 height=30></a>";
echo "<a href=https://discord.gg/PqXP5T4HP7"."><img src=images/discord.png width=120 height=30></a>";
echo "<a href=../doku.php?id=fap2privpol"."><img src=images/privacy.png width=120 height=30></a>";
echo "". "<a href=reward.php?uuid=".$uuid."><img src=images/reward.png width=120 height=30></a>" . "";
echo '<table class="center">';

  echo "<tr>";
  echo "<td>". "<strong>Reward</strong>" . "</td>";
  echo "<td>". "<strong>XP</strong>" . "</td>";
  echo "<td>". "<strong>from</strong>" . "</td>";
  echo "<td>". "<strong>for</strong>" . "</td>";
  echo "</tr>";
    while ($zeile = mysqli_fetch_array( $db_erg, MYSQLI_ASSOC))
    {
      $found = 0;
        echo "<tr>";
          $sql = "SELECT * FROM rewards";
          $db_erg2 = mysqli_query( $mysqli, $sql );
          if ($db_erg2)
          {
            while ($zeile2 = mysqli_fetch_array( $db_erg2, MYSQLI_ASSOC))
            {
              if($zeile['name'] == $zeile2['name'])
              {
                $found = 1;
                  echo "<tr><td><div class=chip>";
                  if($zeile2['picture'] != 'no picture' && $zeile2['picture'] != '')
                  {
                    if(strlen ($zeile2['picture'])==36)
                    echo "<img src=http://secondlife.com/app/image/". $zeile2['picture'] ."/1 width=40 height=40></strong>";
                    else
                    echo "<img src=".$zeile2['picture'] ." width=40 height=40></strong>";
                  }
                  echo $zeile2['name']."</div></td>";
                  echo "<td><strong>". $zeile['points'] . "</strong></td>";
                  echo "<td><strong>". $zeile['fromu'] . "</strong></td>";
                  echo "<td><strong>". $zeile2['text'] . "</strong></td>";                  
              }
            }
          }
          $sql = "SELECT * FROM specrewards";
          $db_erg3 = mysqli_query( $mysqli, $sql );
          if ($db_erg3)
          {
            while ($zeile3 = mysqli_fetch_array( $db_erg3, MYSQLI_ASSOC))
            {
              if($zeile['name'] == $zeile3['name'])
              {   $found = 1;
                  echo "<tr><td><div class=chip>";
                  if($zeile3['picture'] != 'no picture' && $zeile3['picture'] != '')
                  {
                    if(strlen ($zeile3['picture'])==36)
                    echo "<img src=http://secondlife.com/app/image/". $zeile3['picture'] ."/1 width=40 height=40></strong>";
                    else
                    echo "<img src=".$zeile3['picture'] ." width=40 height=40></strong>";
                  }
                  echo $zeile3['name']."</div></td>";
                  echo "<td><strong>". $zeile['points'] . "</strong></td>";
                  echo "<td><strong>". $zeile['fromu'] . "</strong></td>";
                  echo "<td><strong>". $zeile3['text'] . "</strong></td>";
              }

            }
          }
          if($found != 1)
          {
                echo "<tr><td><div class=chip>"."<img src="."images/Developed.png" ." width=40 height=40>".$zeile['name']."</div></td>";  // ersetzen mit bildern   images/Developed.png
                echo "<td><strong>". $zeile['points'] . "</strong></td>";
                echo "<td><strong>". $zeile['fromu'] . "</strong></td>";
                echo "<td><strong>". $zeile['info'] . "</strong></td>";
          }
        echo "</tr>";
    }
    
echo "</table></center>"; 
mysqli_free_result( $db_erg );
mysqli_free_result( $db_erg2 );
mysqli_free_result( $db_erg3 );
?>
</body>
</html>
