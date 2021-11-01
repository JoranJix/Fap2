<?php
//error_reporting(0);
require_once ('db_open.php');
require_once ('lib.php');
date_default_timezone_set("Europe/Berlin");
$zeit = unixtotime(time());
$api = $_GET["api"];
$cmd = $_GET["cmd"];
$uuid = $_GET["uuid"];
$firstname = $_GET["firstname"];
$lastname = $_GET["lastname"];
$displayname = $_GET["displayname"];
$gender = $_GET["gender"];
$body = $_GET["body"];
$boobs = $_GET["boobs"];
$bits = $_GET["bits"];
$orientation = $_GET["orientation"];
$rpstyle = $_GET["rpstyle"];
$longtime = $_GET["longtime"];
$financial = $_GET["financial"];
$race = $_GET["race"];
$role = $_GET["role"];
$experience = $_GET["experience"];
$discord = $_GET["discord"];
$flickr = $_GET["flickr"];
$kinks = $_GET["kinks"];
$taboo = $_GET["taboo"];
$info = $_GET["info"];
$rape = $_GET["rape"];
$search = $_GET["search"];
$banned = $_GET["banned"];
$isadmin = $_GET["isadmin"];
$active = $_GET["active"];
$xp = $_GET["xp"];
$picture = $_GET["picture"];
$data = $_GET["data"];
$text = $_GET["text"];
$name = $_GET["name"];

// achievements
$acname = $_GET["acname"];
$acfrom = $_GET["acfrom"];
$acxp = $_GET["acxp"];
$acinfo = $_GET["acinfo"];

/*
(`id`,`uuid`,`firstname`,`lastname`,`displayname`,`gender`,`body`,`boobs`,`bits`,`orientation`,`rpstyle`,`longtime`,`financial`,`race`,`role`,`experience`,`discord`,`flickr`,`kinks`,`taboo`,`info`,`rape`,`search`,`banned`,`isadmin`,`timestamp`) 
*/





if($api=='pd')
{
    if($cmd=='getinfo')//get user info by uuid
    {
        
        $res = $mysqli->query("SELECT * FROM `users2` WHERE uuid = '$uuid'");
        if (!$res)
        {
            echo "Table Search failed: (" . $mysqli->errno . ") " . $mysqli->error;
            return;
        }
        $earray[] = array();
        while($row =mysqli_fetch_assoc($res))
        {
            $earray[] = $row;
        }
        echo json_encode($earray);
    }
    if($cmd=='getac')//get user info by uuid
    {
        $res = $mysqli->query("SELECT * FROM `rewards`");
        while($row =mysqli_fetch_assoc($res))
        {
            echo $row[name]."|";
        }
    }
    if($cmd=='getspec')//get user info by uuid
    {
        $res = $mysqli->query("SELECT * FROM `specrewards` WHERE uuidby = '$uuid'");
        while($row =mysqli_fetch_assoc($res))
        {
            echo $row[name]."|";
        }
    }
    if($cmd=='changegender')//set info by uuid
    {
        if (!$mysqli->query("UPDATE users2 Set gender = '$gender' WHERE uuid = '$uuid'"))
        {
            echo "Table creation failed: (" . $mysqli->errno . ") " . $mysqli->error;
		}
    }
    else if($cmd=='changerace')//set info by uuid
    {
        if (!$mysqli->query("UPDATE users2 Set race = '$race' WHERE uuid = '$uuid'"))
        {
            echo "Table creation failed: (" . $mysqli->errno . ") " . $mysqli->error;
		}
    }
    else if($cmd=='changebody')//set info by uuid
    {
        if (!$mysqli->query("UPDATE users2 Set body = '$body' WHERE uuid = '$uuid'"))
        {
            echo "Table creation failed: (" . $mysqli->errno . ") " . $mysqli->error;
		}
    }
    else if($cmd=='changeboobs')//set info by uuid
    {
        if (!$mysqli->query("UPDATE users2 Set boobs = '$boobs' WHERE uuid = '$uuid'"))
        {
            echo "Table creation failed: (" . $mysqli->errno . ") " . $mysqli->error;
		}
    }
    else if($cmd=='changebits')//set info by uuid
    {
        if (!$mysqli->query("UPDATE users2 Set bits = '$bits' WHERE uuid = '$uuid'"))
        {
            echo "Table creation failed: (" . $mysqli->errno . ") " . $mysqli->error;
		}
    }
    if($cmd=='changelongtime')//set info by uuid
    {
        if (!$mysqli->query("UPDATE users2 Set longtime = '$longtime' WHERE uuid = '$uuid'"))
        {
            echo "Table creation failed: (" . $mysqli->errno . ") " . $mysqli->error;
		}
    }
    else if($cmd=='changeorientation')//set info by uuid
    {
        if (!$mysqli->query("UPDATE users2 Set orientation = '$orientation' WHERE uuid = '$uuid'"))
        {
            echo "Table creation failed: (" . $mysqli->errno . ") " . $mysqli->error;
		}
    }
    else if($cmd=='changerpstyle')//set info by uuid
    {
        if (!$mysqli->query("UPDATE users2 Set rpstyle = '$rpstyle' WHERE uuid = '$uuid'"))
        {
            echo "Table creation failed: (" . $mysqli->errno . ") " . $mysqli->error;
		}
    }
    else if($cmd=='changekinks')//set info by uuid
    {
        if (!$mysqli->query("UPDATE users2 Set kinks = '$kinks' WHERE uuid = '$uuid'"))
        {
            echo "Table creation failed: (" . $mysqli->errno . ") " . $mysqli->error;
		}
    }
    else if($cmd=='changetaboo')//set info by uuid
    {
        if (!$mysqli->query("UPDATE users2 Set taboo = '$taboo' WHERE uuid = '$uuid'"))
        {
            echo "Table creation failed: (" . $mysqli->errno . ") " . $mysqli->error;
		}
    }
    else if($cmd=='changeinfo')//set info by uuid
    {
        if (!$mysqli->query("UPDATE users2 Set info = '$info' WHERE uuid = '$uuid'"))
        {
            echo "Table creation failed: (" . $mysqli->errno . ") " . $mysqli->error;
		}
    }
    else if($cmd=='changeflickr')//set info by uuid
    {
        if (!$mysqli->query("UPDATE users2 Set flickr = '$flickr' WHERE uuid = '$uuid'"))
        {
            echo "Table creation failed: (" . $mysqli->errno . ") " . $mysqli->error;
		}
    }
    else if($cmd=='changediscord')//set info by uuid
    {
        if (!$mysqli->query("UPDATE users2 Set discord = '$discord' WHERE uuid = '$uuid'"))
        {
            echo "Table creation failed: (" . $mysqli->errno . ") " . $mysqli->error;
		}
    }
    else if($cmd=='changefinancial')//set info by uuid
    {
        if (!$mysqli->query("UPDATE users2 Set financial = '$financial' WHERE uuid = '$uuid'"))
        {
            echo "Table creation failed: (" . $mysqli->errno . ") " . $mysqli->error;
		}
    }
    else if($cmd=='changesearch')//set info by uuid
    {
        if (!$mysqli->query("UPDATE users2 Set search = '$search' WHERE uuid = '$uuid'"))
        {
            echo "Table creation failed: (" . $mysqli->errno . ") " . $mysqli->error;
		}
    }
    else if($cmd=='changerape')//set info by uuid
    {
        if (!$mysqli->query("UPDATE users2 Set rape = '$rape' WHERE uuid = '$uuid'"))
        {
            echo "Table creation failed: (" . $mysqli->errno . ") " . $mysqli->error;
		}
    }
    else if($cmd=='changepicture')//set info by uuid
    {
        if (!$mysqli->query("UPDATE users2 Set picture = '$picture' WHERE uuid = '$uuid'"))
        {
            echo "Table creation failed: (" . $mysqli->errno . ") " . $mysqli->error;
		}
    }
    else if($cmd=='changexp')//set info by uuid
    {
        if (!$mysqli->query("UPDATE users2 Set experience = '$xp' WHERE uuid = '$uuid'"))
        {
            echo "Table creation failed: (" . $mysqli->errno . ") " . $mysqli->error;
        }
        //ranks levels
        $role = "Level ".(int)($xp / 1000);
        if (!$mysqli->query("UPDATE users2 Set role = '$role' WHERE uuid = '$uuid'"))
        {
            echo "Table creation failed: (" . $mysqli->errno . ") " . $mysqli->error;
        }
    }
    else if($cmd=='changeactive')//set info by uuid
    {
        if (!$mysqli->query("UPDATE users2 Set active = '$active' WHERE uuid = '$uuid'"))
        {
            echo "Table creation failed: (" . $mysqli->errno . ") " . $mysqli->error;
            return;
		}
		else
		{
            echo "active";
		}
    }
    else if($cmd=='changeadmin')//set info by uuid
    {
        if (!$mysqli->query("UPDATE users2 Set isadmin = '$isadmin' WHERE uuid = '$uuid'"))
        {
            echo "Table creation failed: (" . $mysqli->errno . ") " . $mysqli->error;
            return;
		}
    }
    else if($cmd=='ban')//set info by uuid
    {
        if (!$mysqli->query("UPDATE users2 Set banned = '$banned' WHERE uuid = '$uuid'"))
        {
            echo "Table creation failed: (" . $mysqli->errno . ") " . $mysqli->error;
            return;
		}
        else
		{
            echo "banned";
		}
    }
    else if($cmd=='unban')//set info by uuid
    {
        if (!$mysqli->query("UPDATE users2 Set banned = '$banned' WHERE uuid = '$uuid'"))
        {
            echo "Table creation failed: (" . $mysqli->errno . ") " . $mysqli->error;
            return;
		}
    }
    else if($cmd=='delete')
    {
        
        if (!$mysqli->query("DELETE FROM `users2` WHERE `users2`.uuid = '$uuid'"))
        {
            echo "Table creation failed: (" . $mysqli->errno . ") " . $mysqli->error;
		}
    }
    else if($cmd=='find')
    {
        $found = 0;
        $res = $mysqli->query("SELECT * FROM `users2`");
        
            if (!$res)
            {
                echo "Table Search failed: (" . $mysqli->errno . ") " . $mysqli->error;
                return;
            }
            for ($row_no = $res->num_rows - 1; $row_no >= 0; $row_no--) 
            {
                $res->data_seek($row_no);
                $row = $res->fetch_assoc();
                if($row['uuid'] == $uuid)
                {
                    
                        $found = 1;
                        echo "already registered";
                        mysqli_free_result($mysqli);
                        return;
                }
            }
            if($found == 0)
            {
                echo "not registered";
                mysqli_free_result($mysqli);
                return;
            }
            
        
    }
    else if($cmd=='register')
    {
        $found = 0;
        $res = $mysqli->query("SELECT * FROM `users2`");
        
        if (!$res)
        {
            echo "Table Search failed: (" . $mysqli->errno . ") " . $mysqli->error;
            return;
        }
        for ($row_no = $res->num_rows - 1; $row_no >= 0; $row_no--) 
        {
            $res->data_seek($row_no);
            $row = $res->fetch_assoc();
            if($row['uuid'] == $uuid)
            {
                    
                $found = 1;
                echo "already registered";
                mysqli_free_result($mysqli);
                return;
            }
        }
        if($found == 0)
        {
            if (!$mysqli->query("INSERT INTO `users2` (`id`,`uuid`,`firstname`,`lastname`,`displayname`,`gender`,`body`,`boobs`,`bits`,`orientation`,`rpstyle`,`longtime`,`financial`,`race`,`role`,`experience`,`discord`,`flickr`,`kinks`,`taboo`,`info`,`rape`,`search`,`banned`,`isadmin`,`timestamp`,`picture`) 
            VALUES 
            (NULL,'$uuid','$firstname','$lastname','$displayname',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)"))
            {
                echo "Table creation failed: (" . $mysqli->errno . ") " . $mysqli->error;
                mysqli_free_result($mysqli);
                return;
            }
            mysqli_free_result($mysqli);  
        }
        
    }
}

//$acname = $_GET["acname"];
//$acfrom = $_GET["acfrom"];
//$acxp = $_GET["acxp"];
//$acinfo = $_GET["acinfo"];

if($api=='ac')
{
    if($cmd=='setac')
    {
        if($acxp == "random")
        {
            $acxp=random_int(20,125);
        }
        if(!$mysqli->query("INSERT INTO `achievements` (`id`,`uuid`,`name`,`points`,`fromu`,`info`) 
            VALUES (NULL,'$uuid','$acname','$acxp','$acfrom','$acinfo')"))
        {
                echo "Table creation failed: (" . $mysqli->errno . ") " . $mysqli->error;
                mysqli_free_result($mysqli);
                return;
        }
        echo "addxp|".$acxp."|"."Achievement for ".$acinfo;
        mysqli_free_result($mysqli);
        return;
        
    }
}
if($api=='rw')
{
    if($cmd=='addreward')
    {
        if(!$mysqli->query("INSERT INTO `rewards` (`id`,`name`,`picture`,`text`) VALUES (NULL,'$name','$picture','$text')"))
        {
            echo "You need a unique name for your reward";
        }
        else
        {
            echo "adding: ". $name ." picture: ". $picture . " text: ". $text;
        }
        mysqli_free_result($mysqli);
        //"api=rw"+"&cmd=addreward"+"&picture="+llEscapeURL(customt)+"&name="+llEscapeURL(customr)+"&name="+llEscapeURL(msg),[HTTP_METHOD, "GET",HTTP_VERBOSE_THROTTLE, FALSE,
    }
    if($cmd=='addspecreward')
    {
        //echo echo "testing: ". $name ." picture: ". $picture . " text: ". $text;
        if(!$mysqli->query("INSERT INTO `specrewards` (`id`,`uuidby`,`name`,`picture`,`text`) VALUES (NULL,'$uuid','$name','$picture','$text')"))
        {
            echo "You need a unique name for your reward";
        }
        else
        {
            echo "adding: ". $name ." picture: ". $picture . " text: ". $text;
        }
        mysqli_free_result($mysqli);
        //"api=rw"+"&cmd=addreward"+"&picture="+llEscapeURL(customt)+"&name="+llEscapeURL(customr)+"&name="+llEscapeURL(msg),[HTTP_METHOD, "GET",HTTP_VERBOSE_THROTTLE, FALSE,
    }
    if($cmd=='delspecreward')
    {
        if (!$mysqli->query("DELETE FROM `specrewards` WHERE `specrewards`. `uuidby` = '$uuid' AND `name` = $name "))
        {
            echo "Table creation failed: (" . $mysqli->errno . ") " . $mysqli->error;
		}
        else
        {
            echo  $name . " removed";
        }
        mysqli_free_result($mysqli);
    }
}
if($api=='pdmenu')
{
        if($cmd=='racemain')
        {
            echo "human|furry|feral|robotic|other";
        }
}
?>
