<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Mond-Keks.de FAP2 - User Database</title>
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
}
a:visited
{ 
  color: #29b6f6;
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
  background-color: black !important
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

<?php
require_once ('db_open.php');
require_once ('lib.php');


$sql = "SELECT * FROM users2 ORDER BY firstname ASC";
$search = $_POST["search"];
$db_erg = mysqli_query( $mysqli, $sql );
if (! $db_erg )
{
  die('Ungültige Abfrage: ' . mysqli_error());
}
echo "<center><h1><strong><img src=images/logo.png width=512 height=64></strong></h1></br>";
echo "<a href=../"."><img src=images/mondkeks.png width=120 height=30></a>";
echo "<a href=secondlife:///app/group/ef8e3856-381b-d0d3-86fb-91e83e5f59ac/about"."><img src=images/group.png width=120 height=30></a>";
echo "<a href=https://discord.gg/PqXP5T4HP7"."><img src=images/discord.png width=120 height=30></a>";
echo "<a href=../doku.php?id=fap2privpol"."><img src=images/privacy.png width=120 height=30></a>";
?>
</br><strong>Search:</strong>
<form action="index.php" method="post">
   <input name="search" size="36" maxlength="50"/>
   <input type="submit" value="Send"/>
   <input type="reset" value="Clear"/>
</form>
<?php
echo "</br>";
echo "</br>";

echo '<table class="center">';

  echo "<tr>";
  echo "<td>". "<strong>Displayname</strong>" . "</td>";
  echo "<td><strong>SLProfile</strong></td>";
  echo "<td><strong>Webprofile</strong></td>";
	echo "<td><strong>Wishlist</strong></td>";
  echo "<td>". "<strong>Rewards</strong>" . "</td>";
  echo "<td>". "<strong>XP</strong>" . "</td>";
  echo "<td>". "<strong>Species</strong>" . "</td>";
  echo "<td>". "<strong>Gender</strong>" . "</td>";
  echo "<td>". "<strong>Orientation</strong>" . "</td>";
  echo "<td>". "<strong>Body</strong>" . "</td>";
  echo "<td>". "<strong>Boobs</strong>" . "</td>";
  echo "<td>". "<strong>Bits</strong>" . "</td>";
  echo "<td>". "<strong>Kinks</strong>" . "</td>";
  echo "<td>". "<strong>Relationship</strong>" . "</td>";
  echo "<td>". "<strong>Rape</strong>" . "</td>";
  echo "<td>". "<strong>Financial</strong>" . "</td>";
  echo "<td><strong>Taboos</strong>" . "</td>";
  echo "</tr>";
  if($search!="")
  {
    //echo $search;
    while ($zeile = mysqli_fetch_array( $db_erg, MYSQLI_ASSOC))
    {
      if(array_search($search, $zeile,true))
      {
        if($zeile['search'] == 1 && $zeile['banned'] != 1 && $zeile['active'] == 1)
        {
              echo "<tr><td><div class=chip>";
              if($zeile['picture'] != 'no picture' && $zeile['picture'] != '')
              {
                if(strlen ($zeile['picture'])==36)
                echo "<img src=http://secondlife.com/app/image/". $zeile['picture'] ."/1 width=40 height=40></strong>";
                else
                echo "<img src=".$zeile['picture'] ." width=40 height=40></strong>";
              }
              echo "<a href=profile.php?uuid=".$zeile['uuid'].">".$zeile['displayname']."</a></div></td>";

              echo "<td><a href=secondlife:///app/agent/". $zeile['uuid'] . "/about target=_prof1 ><img src=images/profile.png width=90 height=20></a></a></td>";
              if($zeile['lastname'] != "Resident")
              {
                echo "<td><a href=https://my.secondlife.com/". $zeile['firstname'] .".".$zeile['lastname'] . " target=_prof ><img src=images/web.png width=90 height=20></a></td>";
                echo "<td><a href=https://marketplace.secondlife.com/wishlists/". $zeile['firstname'] .".".$zeile['lastname'] . " target=_wish ><img src=images/wish.png width=90 height=20></a></td>";
              }
              else if($zeile['lastname'] == "Resident")
              {
                echo "<td><a href=https://my.secondlife.com/". $zeile['firstname'] . " target=_prof ><img src=images/web.png width=90 height=20></a></td>";
                echo "<td><a href=https://marketplace.secondlife.com/wishlists/". $zeile['firstname'] . " target=_wish ><img src=images/wish.png width=90 height=20></a></td>";
              }
              echo "<td>". "<strong><a href=reward.php?uuid=".$zeile['uuid']."><img src=images/reward.png width=90 height=20></a></strong>" . "</td>";
              echo "<td><strong>". $zeile['experience'] . "</strong></td>";
              echo "<td><strong>". $zeile['race'] . "</strong></td>";
              echo "<td><strong>". $zeile['gender'] . "</strong></td>";
              echo "<td><strong>". $zeile['orientation'] . "</strong></td>";
              echo "<td><strong>". $zeile['body'] . "</strong></td>";
              if($zeile['boobs'] == "1")
              {
                echo "<td><strong>". "<img src=images/yes.png width=20 height=20>" . "</strong></td>";
              }
              else if($zeile['boobs'] != "1")
              {
                echo "<td><strong>". "<img src=images/no.png width=20 height=20>" . "</strong></td>";
              }
              echo "<td><strong>". $zeile['bits'] . "</strong></td>";
              echo "<td><strong>". $zeile['kinks'] . "</strong></td>";
              
              echo "<td><strong>". $zeile['longtime'] . "</strong></td>";
              if($zeile['rape'] == "1")
              {
                echo "<td><strong>". "<img src=images/yes.png width=20 height=20>" . "</strong></td>";
              }
              else if($zeile['rape'] != "1")
              {
                echo "<td><strong>". "<img src=images/no.png width=20 height=20>" . "</strong></td>";
              }
              if($zeile['financial'] == "1")
              {
                echo "<td><strong>". "<img src=images/yes.png width=20 height=20>" . "</strong></td>";
              }
              else if($zeile['financial'] != "1")
              {
                echo "<td><strong>". "<img src=images/no.png width=20 height=20>" . "</strong></td>";
              }
              echo "<td><strong>". $zeile['taboo'] . "</strong></td>";
              echo "</tr>";
            }
        ///////////////////////////////////////////
      }
    }
  }

  if($search=="")
  {
      while ($zeile = mysqli_fetch_array( $db_erg, MYSQLI_ASSOC))
      {
            if($zeile['search'] == 1 && $zeile['banned'] != 1 && $zeile['active'] == 1)
            {
              echo "<tr><td><div class=chip>";
              if($zeile['picture'] != 'no picture' && $zeile['picture'] != '')
              {
                if(strlen ($zeile['picture'])==36)
                echo "<img src=http://secondlife.com/app/image/". $zeile['picture'] ."/1 width=40 height=40></strong>";
                else
                echo "<img src=".$zeile['picture'] ." width=40 height=40></strong>";
              }
              echo "<a href=profile.php?uuid=".$zeile['uuid'].">".$zeile['displayname']."</a></div></td>";

              echo "<td><a href=secondlife:///app/agent/". $zeile['uuid'] . "/about target=_prof1 ><img src=images/profile.png width=90 height=20></a></a></td>";
              if($zeile['lastname'] != "Resident")
              {
                echo "<td><a href=https://my.secondlife.com/". $zeile['firstname'] .".".$zeile['lastname'] . " target=_prof ><img src=images/web.png width=90 height=20></a></td>";
                echo "<td><a href=https://marketplace.secondlife.com/wishlists/". $zeile['firstname'] .".".$zeile['lastname'] . " target=_wish ><img src=images/wish.png width=90 height=20></a></td>";
              }
              else if($zeile['lastname'] == "Resident")
              {
                echo "<td><a href=https://my.secondlife.com/". $zeile['firstname'] . " target=_prof ><img src=images/web.png width=90 height=20></a></td>";
                echo "<td><a href=https://marketplace.secondlife.com/wishlists/". $zeile['firstname'] . " target=_wish ><img src=images/wish.png width=90 height=20></a></td>";
              }
              echo "<td>". "<strong><a href=reward.php?uuid=".$zeile['uuid']."><img src=images/reward.png width=90 height=20></a></strong>" . "</td>";
              echo "<td><strong>". $zeile['experience'] . "</strong></td>";
              echo "<td><strong>". $zeile['race'] . "</strong></td>";
              echo "<td><strong>". $zeile['gender'] . "</strong></td>";
              echo "<td><strong>". $zeile['orientation'] . "</strong></td>";
              echo "<td><strong>". $zeile['body'] . "</strong></td>";
              if($zeile['boobs'] == "1")
              {
                echo "<td><strong>". "<img src=images/yes.png width=20 height=20>" . "</strong></td>";
              }
              else if($zeile['boobs'] != "1")
              {
                echo "<td><strong>". "<img src=images/no.png width=20 height=20>" . "</strong></td>";
              }
              echo "<td><strong>". $zeile['bits'] . "</strong></td>";
              echo "<td><strong>". $zeile['kinks'] . "</strong></td>";
              
              echo "<td><strong>". $zeile['longtime'] . "</strong></td>";
              if($zeile['rape'] == "1")
              {
                echo "<td><strong>". "<img src=images/yes.png width=20 height=20>" . "</strong></td>";
              }
              else if($zeile['rape'] != "1")
              {
                echo "<td><strong>". "<img src=images/no.png width=20 height=20>" . "</strong></td>";
              }
              if($zeile['financial'] == "1")
              {
                echo "<td><strong>". "<img src=images/yes.png width=20 height=20>" . "</strong></td>";
              }
              else if($zeile['financial'] != "1")
              {
                echo "<td><strong>". "<img src=images/no.png width=20 height=20>" . "</strong></td>";
              }
              echo "<td><strong>". $zeile['taboo'] . "</strong></td>";
              echo "</tr>";
            }
      }
    }
    echo "</tr>";
echo "</table></center>"; 
mysqli_free_result( $db_erg );

?>
</body>
</html>
