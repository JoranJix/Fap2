//  _____ ______   ________  ________   ________     
// |\   _ \  _   \|\   __  \|\   ___  \|\   ___ \    
// \ \  \\\__\ \  \ \  \|\  \ \  \\ \  \ \  \_|\ \   
//  \ \  \\|__| \  \ \  \\\  \ \  \\ \  \ \  \ \\ \  
//   \ \  \    \ \  \ \  \\\  \ \  \\ \  \ \  \_\\ \ 
//    \ \__\    \ \__\ \_______\ \__\\ \__\ \_______\
//     \|__|     \|__|\|_______|\|__| \|__|\|_______| 
//  ___  __    _______   ___  __    ________         
// |\  \|\  \ |\  ___ \ |\  \|\  \ |\   ____\        
// \ \  \/  /|\ \   __/|\ \  \/  /|\ \  \___|_       
//  \ \   ___  \ \  \_|/_\ \   ___  \ \_____  \      
//   \ \  \\ \  \ \  \_|\ \ \  \\ \  \|____|\  \     
//    \ \__\\ \__\ \_______\ \__\\ \__\____\_\  \    
//     \|__| \|__|\|_______|\|__| \|__|\_________\   
//                                    \|_________|   
//
// Script written by Mikosa Manamiko
//                                                  
// NOT TO BE DISTRIBUTED AS FULL PERMISSION VERSION!



string url = "ururl/fap2/data2.php";
string systemname = "FAP2 eRP";
string version = "0.94 B (hud)";

integer apiChan = 600600;// DO NOT CHANGE!!
integer displayChan = 600610;// DO NOT CHANGE!
integer apiL;// DO NOT CHANGE!
integer limit = 600;//time limit for rewards
//integer limit = 10;//time limit for rewards

//server
key process1;
getdata()
{
    process1 = llHTTPRequest(url+"?"+"api=pd"+"&cmd=getinfo&uuid="+(string)owner,[HTTP_METHOD, "GET",HTTP_VERBOSE_THROTTLE, FALSE,HTTP_BODY_MAXLENGTH, 16384],"");
}

key process2;
getinfo(key uuid)// grab info about person
{
    process2 = llHTTPRequest(url+"?"+"api=pd"+"&cmd=getinfo&uuid="+(string)uuid,[HTTP_METHOD, "GET",HTTP_VERBOSE_THROTTLE, FALSE,HTTP_BODY_MAXLENGTH, 16384],"");
}
ban(key uuid)// grab info about person
{
    llHTTPRequest(url+"?"+"api=pd"+"&cmd=ban&uuid="+(string)uuid+"&banned=1",[HTTP_METHOD, "GET",HTTP_VERBOSE_THROTTLE, FALSE,HTTP_BODY_MAXLENGTH, 16384],"");
    llRegionSayTo(uuid,apiChan,"banned");
}
unban(key uuid)// grab info about person
{
    llHTTPRequest(url+"?"+"api=pd"+"&cmd=unban&uuid="+(string)uuid,[HTTP_METHOD, "GET",HTTP_VERBOSE_THROTTLE, FALSE,HTTP_BODY_MAXLENGTH, 16384],"");
}
key process3;
key process4;
key process5;
key process6;
//sysvariables

string acname;
string acfrom;
string acxp;
string acinfo;

key owner;
float volume = 0.4;
string oldlevel;
integer infotext = TRUE;
string firstname;
string lastname;
string displayname;
string gender;
string body;
integer boobs;
string bits;
string orientation;
string rpstyle;
string longtime;
integer financial;
string race;
string role;
string discord;
string flickr;
string kinks;
string taboo;
string info;
integer rape;
integer search;
string picture;
integer active;
integer isadmin;
integer xp = 0;
integer banned;
list otherusers;
string level;
string customr;
string customt;
list rewards;
//generators

integer timestamp;
integer random_integer(integer min, integer max)
{
    return min + (integer)(llFrand(max - min + 1));
}

string getKey(string req)//find avkeys
{
    if(llStringLength(req) < 3)
    {
        return NULL_KEY;
    }
    req = llToLower(req);
    list keyNames;
    list temp;
    list agents = llGetAgentList(AGENT_LIST_REGION , []); 
    integer x = 0;
    integer y = llGetListLength(agents);
    while(x<y)
    {   
        list t = llParseString2List(llToLower(llKey2Name(llList2String(agents,x))),[" "],[]);
        temp = [llList2String(t,0) +"|"+ llList2String(agents,x) ] + temp;   
        ++x;
    }
    keyNames = llListSort(temp,1,TRUE); 
    x = 0;
    y = llGetListLength(keyNames);
    while(x<y) 
    {
        if(llSubStringIndex(llList2String(keyNames,x),req) != -1)
        {
            list a = llParseString2List(llList2String(keyNames,x), ["|"] ,[]);
            return llList2String(a,1); 
        }
        ++x;
    }
    return NULL_KEY; 
}

integer listener;
integer channel;
string menustate;
string menutext;
list diaList;
integer keytoint(string inkey)
{
    return (integer)("0x" + llGetSubString(llMD5String(inkey,0), 0, 7));    
}
textbox(key user,string text,integer chan,string status)
{
    llListenRemove(listener);
    listener = llListen(channel,"",owner,"");
    menustate = status;
    llTextBox(user,text,chan);
}
integer menuindex;
list order_buttons(list buttons)
{
     return llList2List(buttons, -3, -1) + llList2List(buttons, -6, -4) +
    llList2List(buttons, -9, -7) + llList2List(buttons, -12, -10);
}
DialogPlus(key avatar, string message, list buttons, integer channel, integer CurMenu)
{
    llListenRemove(listener);
    listener = llListen(channel,"",owner,"");
    message = llGetSubString(message,0,511);
    if (llGetListLength(buttons) >12){
    list lbut = buttons;
    list Nbuttons = [];
    if(CurMenu == -1)
    {
        CurMenu = 0;
        menuindex = 0;
    }
        if((Nbuttons = (llList2List(buttons, (CurMenu * 9), ((CurMenu * 9) + 8)) + ["<<<","Main", ">>>"])) == ["<<<","Main", ">>>"])
        DialogPlus(avatar, message, lbut, channel, menuindex = 0);
        else
        {
            llDialog(avatar, message,  order_buttons(Nbuttons), channel);
        }
    }
    else
    {
        llDialog(avatar, message,  order_buttons(buttons), channel);
    }
}
string maketext()
{
    string text;
    text += "Displayname: " +       llGetDisplayName(owner) +"\n";
            text += "XP: " +        (string)xp+"\n";
            text += "Species: " +   race +"\n";
            text += "Gender: " +    gender +"\n";
            text += "Role: "+       role+"\n";
    return text;
}
mainmenu()
{
    menustate = "";
    menutext = "--- Main Menu ---\n"+maketext()+"
    Give Rewards to others
    Check your rewards
    Check and share your profile
    Search other players
    Scan other players on your region
    Options change your profile";
    diaList = [];
    if(isadmin == 1)
    {
        diaList += ["SpecialReward","Admin"];
    }
    if(isadmin == 2)
    {
        diaList += ["SpecialReward","Superadmin"];
    }
    if(xp > 4999 && isadmin != 1 && isadmin != 2)
    {
        menutext +="\n Unlocked SpecialRewards";
        diaList+=["SpecialReward"];
    }
    diaList += ["Group","Website","Give Reward","My Rewards","My Profile","Search","Scan","Options"];
    if(owner == "a6e77bf0-63af-47f2-a784-bc58f1876dcf"||owner =="1b3578ad-253a-44ed-8205-898e34e5bdf6")
    {
        diaList+=["Reset"];
    }
    DialogPlus(owner,menutext,diaList,channel,menuindex=0);
}
options()
{
    menustate = "options";
    menutext = "--- Options Menu ---
    You can change details of your account
    or delete your account
    Above 5000 xp you can create special rewards";
    diaList = [];
    if(infotext)
    {
       diaList += ["Text Off"]; 
    }
    else if(!infotext)
    {
       diaList += ["Text On"]; 
    }
    if(isadmin == 1)
    {
        diaList += ["CreateReward","DelReward"];
    }
    if(isadmin == 2)
    {
        diaList += ["CreateReward","DelReward"];
    }
    if(xp > 4999 && isadmin != 1 && isadmin != 2)
    {
        diaList+=["CreateReward","DelReward"];
    }
    diaList += ["Change","Delete Account","Main"]; 
    //diaList += ["Test","Scan","Change"];
    DialogPlus(owner,menutext,diaList,channel,menuindex=0);
}
adminmenu()
{
    menutext = "--- Admin menu ---";
    diaList=["Ban","CreateReward"];
    DialogPlus(owner,menutext,diaList,channel,menuindex=0);
}
supermenu()
{
    menutext = "--- SuperAdmin menu ---";
    diaList=["Ban","CreateReward","MakeAdmin"];
    DialogPlus(owner,menutext,diaList,channel,menuindex=0);
}
change()
{
    menutext = "Pick your change";
    diaList=["picture","gender","body","boobs","bits","orientation","rpstyle","longtime","financial","species","discord","flickr","kinks","taboo","info","rape","searchable"];
    DialogPlus(owner,menutext,diaList,channel,menuindex=0);
}
key targetid;
giveac(key id)
{
    targetid = id;
    menutext = "Give a Reward";
    menustate = "gimme";
    diaList=rewards;
    DialogPlus(owner,menutext,diaList,channel,menuindex=0);
}
default
{
    attach(key AvatarKey)
    {
        if(AvatarKey)
        {
            llListenRemove(apiL);
            apiL = llListen(apiChan,"","","");
            owner = llGetOwner();
            llRequestPermissions(owner,PERMISSION_ATTACH);
            channel = keytoint(owner)+6657;
            llOwnerSay("Checking your accountdata!");
            getdata();
        }
        else
        {
            llWhisper(displayChan,"");
        }
    }
    changed(integer c)
    {
        if(c & CHANGED_OWNER)
        {
            llOwnerSay("loading...");
            llResetScript();
        }
        if(c & CHANGED_REGION)
        {
            
        }
        if(c & CHANGED_TELEPORT)
        {

        }
    }
    run_time_permissions(integer perm)
    {
        if(perm & PERMISSION_ATTACH)
        {
            //needed for detach
        }
    }
    state_entry()
    {
        llListenRemove(apiL);
        apiL = llListen(apiChan,"","","");
        owner = llGetOwner();
        llRequestPermissions(owner,PERMISSION_ATTACH);
        channel = keytoint(owner)+6657;
        llRegionSayTo(owner,0,llGetScriptName()+ " " +(string)llGetFreeMemory() + " bytes of free memory");
        llOwnerSay("Checking your accountdata!");
        getdata();
    }
    touch_start(integer total_number)
    {
        if(active)
        {
            menutext = maketext();
            mainmenu();
        }
        else
        {
            llOwnerSay("YOUR ACCOUNT IS NOT AVTIVE! YOU NEED TO REGISTER");
        }
        
    }
    listen(integer chan,string name,key id,string msg)
    {
        if(chan == apiChan)
        {
            list cmd = llParseString2List(msg,["#"],[]);
            //llOwnerSay(msg);
            if(llList2String(cmd,0) == "ping")
            {
                llRegionSayTo(id,apiChan,"pong");
            }
            else if(llList2String(cmd,0) == "banned")
            {
                llOwnerSay("YOU HAVE BEEN BANNED");
                llDetachFromAvatar();
            }
            else if(llList2String(cmd,0) == "pong")
            {
                if(menustate == "scan"||menustate == "give"||menustate == "givespec"||menustate == "banscan"||menustate == "adminscan")
                {
                    list temp = llParseString2List(llKey2Name(llGetOwnerKey(id)),[" "],[]);
                    otherusers += [llList2String(temp,0)];
                }
            }
            else if(llList2String(cmd,0)== "getxp")
            {
                llRegionSayTo(id,apiChan,(string)xp);
            }
            else if(llList2String(cmd,0)== "xp+")
            {
                xp = xp+llList2Integer(cmd,1);
                llOwnerSay("You gain "+llList2String(cmd,1)+"XP");
                llWhisper(displayChan,"gotxp");
                llTriggerSound("faf97922-21fa-db04-336a-adbbc0a16e1b",volume);
                llHTTPRequest(url+"?"+"api=pd"+"&cmd=changexp"+"&uuid="+(string)owner+"&xp="+(string)xp,[HTTP_METHOD, "GET",HTTP_VERBOSE_THROTTLE, FALSE,HTTP_BODY_MAXLENGTH, 16384],"");
                llSleep(0.4);
                getdata();
            }
            else if(llList2String(cmd,0)== "xp-")
            {
                 
                if(xp-llList2Integer(cmd,1) < 1)
                {
                   llOwnerSay("Not enough xp");
                }
                else
                {
                    xp = xp-llList2Integer(cmd,1);
                    llOwnerSay("You lost "+llList2String(cmd,1)+"xp");
                    llHTTPRequest(url+"?"+"api=pd"+"&cmd=changexp"+"&uuid="+(string)owner+"&xp="+(string)xp,[HTTP_METHOD, "GET",HTTP_VERBOSE_THROTTLE, FALSE,HTTP_BODY_MAXLENGTH, 16384],"");
                    llSleep(0.4);
                }
                getdata();
            }
            else if(llList2String(cmd,0)== "achievement+")
            {
                acname=llList2String(cmd,1);
                acfrom=llList2String(cmd,2);
                acxp=llList2String(cmd,3);
                acinfo=llList2String(cmd,4);
                if((llGetUnixTime()-timestamp) > (limit-1))
                {
                    targetid=llGetOwnerKey(id);
                    menustate = "accept";
                    menutext = "--- Do you accept the reward? ---\n from: "+llGetDisplayName(targetid)+"\n "+ acname;
                    diaList=["Yes","No"];
                    DialogPlus(owner,menutext,diaList,channel,menuindex=0);
                    
                }
                else if((llGetUnixTime()-timestamp)<limit)
                {
                    string minutes = (string)((limit-(llGetUnixTime()-timestamp))/60)+" Minutes";
                    if(llGetOwnerKey(id) != owner)
                    llRegionSayTo(llGetOwnerKey(id),0,"Sorry but I cant receive your achievement: "+acinfo + " I have to wait another " +minutes);
                }
            }
        }
        if(chan==channel)
        {
            //general
            if(msg == ">>>")
            {
                DialogPlus(owner,menutext,diaList,channel,++menuindex);
            }
            else if(msg == "<<<")
            {
                DialogPlus(owner,menutext,diaList,channel,--menuindex);
            }
            else if(msg == "Reset")
            {
                llResetScript();
            }
            else if(msg == "Group")
            {
                llLoadURL(owner,"Join Mond-Keks.de Group","secondlife:///app/group/ef8e3856-381b-d0d3-86fb-91e83e5f59ac/about");;
            }
            else if(msg == "Website")
            {
                llLoadURL(owner,"Visit the Mond-Keks website","http://mond-keks.de/doku.php?id=slfap2");
            }
            else if(msg == "Options")
            {
                options();
            }
            else if (msg == "My Rewards")
            {
                llLoadURL(owner,"Show me my rewards","http://www.mond-keks.de/fap2/reward.php?uuid="+(string)owner);
            }
            else if (msg == "My Profile")
            {
                llLoadURL(owner,"Show me my Fap2 Profile","http://www.mond-keks.de/fap2/profile.php?uuid="+(string)owner);
            }
            else if (msg == "Search")
            {
                llLoadURL(owner,"Show me all users","http://www.mond-keks.de/fap2");
            }
            else if(msg == "Text Off")
            {
                infotext = FALSE;
                llSetText("",<1,1,1>,1);
            }
            else if(msg == "Text On")
            {
                infotext = TRUE;
                llSetText("XP: " +(string)xp +" "+level,<1,1,1>,1);
            }
            else if(msg == "Delete Account")
            {
                menustate = "delete";
                menutext = "--- Do you really want to delete your account? ---
                ALL DATA WILL BE LOST!";
                diaList=["Yes","No"];
                DialogPlus(owner,menutext,diaList,channel,menuindex=0);
            }
            else if(msg == "Main")
            {
                mainmenu();
            }
            else if(msg == "Give Reward")
            {
                menustate = "give";
                otherusers = [];
                llRegionSay(apiChan,"ping");
                llSetTimerEvent(3);
            }
            else if(msg == "SpecialReward")
            {
                menustate = "givespec";
                otherusers = [];
                llRegionSay(apiChan,"ping");
                llSetTimerEvent(3);
            }
            else if(msg == "Scan")
            {
                menustate = "scan";
                otherusers = [];
                llRegionSay(apiChan,"ping");
                llSetTimerEvent(3);
            }
            else if(msg == "Ban")
            {
                menustate = "banscan";
                otherusers = [];
                llRegionSay(apiChan,"ping");
                llSetTimerEvent(3);
            }
            else if(msg == "MakeAdmin")
            {
                menustate = "adminscan";
                otherusers = [];
                llRegionSay(apiChan,"ping");
                llSetTimerEvent(3);
            }
            else if(msg == "Change")
            {
                change();
            }
            else if(msg == "Admin")
            {
                adminmenu();
            }
            else if(msg == "Superadmin")
            {
                supermenu();
            }
            else if(msg == "gender")
            {
                menustate = "gender";
                diaList=["male","maleherm","female","shemale","trans","non-binary"];
                DialogPlus(owner,"Are you wearing boobs?",diaList,channel,menuindex=0);
            }
            else if(msg == "body")
            {
                textbox(owner,"Body: Masculine, Athletic, Slim, Curvy, extra Curvy, etcetera.",channel,"body");
            }
            else if(msg == "boobs")
            {
                menustate = "boobs";
                diaList=["Yes","No"];
                DialogPlus(owner,"Are you wearing boobs?",diaList,channel,menuindex=0);
            }
            else if(msg == "bits")
            {
                textbox(owner,"Bits: Cock, Vagina, Both(Herm), Other(for example: Cloaka).",channel,"bits");
            }
            else if(msg == "picture")
            {
                textbox(owner,"Please enter a UUID ur URL of a picture you want to be displayed on your profile",channel,"picture");
            }
            else if(msg == "orientation")
            {
                textbox(owner,"Sexual Orientation: straight, gay, Everything that breathes...",channel,"orientation");
            }
            else if(msg == "rpstyle")
            {
                textbox(owner,"Style of Roleplay: Poseballing, Short Roleplay, Long Roleplay.\nMutliple choices possible.",channel,"rpstyle");
            }
            else if(msg == "longtime")
            {
                menustate = "longtime";
                diaList=["Yes","No","Already have one"];
                DialogPlus(owner,"You are searching for a long time relationship?",diaList,channel,menuindex=0);
            }
            else if(msg == "financial")
            {
                menustate = "financial";
                diaList=["Yes","No"];
                DialogPlus(owner,"Do you have any financial interest i.E. escort",diaList,channel,menuindex=0);
            }
            else if(msg == "species")
            {
                textbox(owner,"Tell us your species",channel,"race");
            }
            else if(msg == "discord")
            {
                textbox(owner,"Can someone reach you on discord? Your discount accountname?",channel,"discord");
            }
            else if(msg == "flickr")
            {
                textbox(owner,"Do you have a flickr account",channel,"flickr");
            }
            else if(msg == "kinks")
            {
                textbox(owner,"Tell us about your kinks",channel,"kinks");
            }
            else if(msg == "taboo")
            {
                textbox(owner,"Tell us your taboos. Leave empty for none",channel,"taboo");
            }
            else if(msg == "info")
            {
                textbox(owner,"Tell us your taboos. Leave empty for none",channel,"info");
            }
            else if(msg == "rape")
            {
                menustate = "rape";
                diaList=["Yes","No"];
                DialogPlus(owner,"Are others able to rape you?",diaList,channel,menuindex=0);
            }
            else if(msg == "searchable")
            {
                menustate = "search";
                diaList=["Yes","No"];
                DialogPlus(owner,"Do you want to be searchable from our database?",diaList,channel,menuindex=0);
            }
            else if(msg == "CreateReward")
            {
                textbox(owner,"please enter a name for your custom reward",channel,"custom");
            }
            else if(msg == "DelReward")
            {
                menustate = "delreward";
                process6 = llHTTPRequest(url+"?"+"api=pd"+"&cmd=getspec&uuid="+(string)owner,[HTTP_METHOD, "GET",HTTP_VERBOSE_THROTTLE, FALSE,HTTP_BODY_MAXLENGTH, 16384],"");
            }
            else
            {
                if(menustate == "custom")
                {
                    if(msg == "")
                    {
                        llOwnerSay("You need a unique name for your reward!");
                        mainmenu();
                    }
                    else
                    {
                        customr = msg;
                        textbox(owner,"please enter a UUID from SL or a direct link to a picture on the web",channel,"custom2");
                    }
                }
                else if(menustate == "delreward")
                {
                    process5 = llHTTPRequest(url+"?"+"api=rw"+"&cmd=delspecreward&uuid="+(string)owner+"&name="+llEscapeURL(msg),[HTTP_METHOD, "GET",HTTP_VERBOSE_THROTTLE, FALSE,HTTP_BODY_MAXLENGTH, 16384],"");
                }
                else if(menustate == "accept")
                {
                    if(msg=="Yes")
                    {
                        timestamp = llGetUnixTime();
                        llRegionSayTo(targetid,0,llGetDisplayName(owner)+": Thank you! I accepted the reward "+acname);
                        llWhisper(displayChan,"gotreward");
                        llTriggerSound("faf97922-21fa-db04-336a-adbbc0a16e1b",volume);
                        process3 = llHTTPRequest(url+"?"+"api=ac"
                        +"&cmd=setac"
                        +"&uuid="+(string)owner
                        +"&acname="+acname
                        +"&acfrom="+acfrom
                        +"&acinfo="+$acinfo
                        +"&acxp="+acxp,[HTTP_METHOD, "GET",HTTP_VERBOSE_THROTTLE, FALSE,HTTP_BODY_MAXLENGTH, 16384],"");
                    }
                    if(msg=="No")
                    {
                        llRegionSayTo(targetid,0,"Your reward was not accepted");
                    }
                }
                else if(menustate == "custom2")
                {
                    if(msg == "")
                    {
                        llOwnerSay("You need a picture for your reward!");
                        mainmenu();
                    }
                    else
                    {
                        customt = msg;
                        textbox(owner,"please enter a custom message for the reward",channel,"custom3");
                    }

                    
                }
                else if(menustate == "custom3")
                {
                    if(msg == "")
                    {
                        llOwnerSay("You need a unique name for your reward!");
                        mainmenu();
                    }
                    else
                    process5=llHTTPRequest(url+"?"+"api=rw"+"&cmd=addspecreward"+"&picture="+llEscapeURL(customt)+"&name="+llEscapeURL(customr)+"&text="+llEscapeURL(msg)+"&uuid="+(string)owner,[HTTP_METHOD, "GET",HTTP_VERBOSE_THROTTLE, FALSE,HTTP_BODY_MAXLENGTH, 16384],"");
                    
                    llOwnerSay("Sending your special reward to the server");
                    mainmenu();
                }
                else if(menustate == "gimme")
                {
                    llRegionSayTo(targetid,apiChan, "achievement+#"+msg+"#"+llGetDisplayName(owner)+"#"+"random"+"#");
                }
                else if(menustate == "gender")
                {
                    gender = llEscapeURL(llToLower(msg));
                    llHTTPRequest(url+"?"+"api=pd"+"&cmd=changegender"+"&uuid="+(string)owner+"&gender="+(string)gender,[HTTP_METHOD, "GET",HTTP_VERBOSE_THROTTLE, FALSE,HTTP_BODY_MAXLENGTH, 16384],"");
                    change();
                }
                else if(menustate == "picture")
                {
                    picture = msg;
                    llHTTPRequest(url+"?"+"api=pd"+"&cmd=changepicture"+"&uuid="+(string)owner+"&picture="+(string)picture,[HTTP_METHOD, "GET",HTTP_VERBOSE_THROTTLE, FALSE,HTTP_BODY_MAXLENGTH, 16384],"");
                }
                else if(menustate == "race")
                {
                    race = llEscapeURL(llToLower(msg));
                    llHTTPRequest(url+"?"+"api=pd"+"&cmd=changerace"+"&uuid="+(string)owner+"&race="+(string)race,[HTTP_METHOD, "GET",HTTP_VERBOSE_THROTTLE, FALSE,HTTP_BODY_MAXLENGTH, 16384],"");
                    change();
                }
                else if(menustate == "body")
                {
                    body = llEscapeURL(llToLower(msg));
                    llHTTPRequest(url+"?"+"api=pd"+"&cmd=changebody"+"&uuid="+(string)owner+"&body="+(string)body,[HTTP_METHOD, "GET",HTTP_VERBOSE_THROTTLE, FALSE,HTTP_BODY_MAXLENGTH, 16384],"");
                    change();
                }
                else if(menustate == "boobs")
                {
                    if(msg == "Yes")
                        boobs = 1;
                    if(msg == "No")
                        boobs = 0;
                    llHTTPRequest(url+"?"+"api=pd"+"&cmd=changeboobs"+"&uuid="+(string)owner+"&boobs="+(string)boobs,[HTTP_METHOD, "GET",HTTP_VERBOSE_THROTTLE, FALSE,HTTP_BODY_MAXLENGTH, 16384],"");
                    change();
                }
                else if(menustate == "bits")
                {
                    bits = llEscapeURL(llToLower(msg));
                    llHTTPRequest(url+"?"+"api=pd"+"&cmd=changebits"+"&uuid="+(string)owner+"&bits="+(string)bits,[HTTP_METHOD, "GET",HTTP_VERBOSE_THROTTLE, FALSE,HTTP_BODY_MAXLENGTH, 16384],"");
                    change();
                }
                else if(menustate == "orientation")
                {
                    orientation = llEscapeURL(llToLower(msg));
                    llHTTPRequest(url+"?"+"api=pd"+"&cmd=changeorientation"+"&uuid="+(string)owner+"&orientation="+(string)orientation,[HTTP_METHOD, "GET",HTTP_VERBOSE_THROTTLE, FALSE,HTTP_BODY_MAXLENGTH, 16384],"");
                    change();
                }
                else if(menustate == "rpstyle")
                {
                    rpstyle = llEscapeURL(llToLower(msg));
                    llHTTPRequest(url+"?"+"api=pd"+"&cmd=changerpstyle"+"&uuid="+(string)owner+"&rpstyle="+(string)rpstyle,[HTTP_METHOD, "GET",HTTP_VERBOSE_THROTTLE, FALSE,HTTP_BODY_MAXLENGTH, 16384],"");
                    change();
                }
                else if(menustate == "kinks")
                {
                    kinks = llEscapeURL(llToLower(msg));
                    llHTTPRequest(url+"?"+"api=pd"+"&cmd=changekinks"+"&uuid="+(string)owner+"&kinks="+(string)kinks,[HTTP_METHOD, "GET",HTTP_VERBOSE_THROTTLE, FALSE,HTTP_BODY_MAXLENGTH, 16384],"");
                    change();
                }
                else if(menustate == "taboo")  
                {
                    taboo = llEscapeURL(llToLower(msg));
                    llHTTPRequest(url+"?"+"api=pd"+"&cmd=changetaboo"+"&uuid="+(string)owner+"&taboo="+(string)taboo,[HTTP_METHOD, "GET",HTTP_VERBOSE_THROTTLE, FALSE,HTTP_BODY_MAXLENGTH, 16384],"");
                    change();
                }
                else if(menustate == "info")  
                {
                    info = llEscapeURL(llToLower(msg));
                    llHTTPRequest(url+"?"+"api=pd"+"&cmd=changeinfo"+"&uuid="+(string)owner+"&info="+(string)info,[HTTP_METHOD, "GET",HTTP_VERBOSE_THROTTLE, FALSE,HTTP_BODY_MAXLENGTH, 16384],"");
                    change();
                }
                else if(menustate == "flickr") 
                {
                    flickr = llEscapeURL(llToLower(msg));
                    llHTTPRequest(url+"?"+"api=pd"+"&cmd=changeflickr"+"&uuid="+(string)owner+"&flickr="+(string)flickr,[HTTP_METHOD, "GET",HTTP_VERBOSE_THROTTLE, FALSE,HTTP_BODY_MAXLENGTH, 16384],"");
                    change();

                }
                else if(menustate == "discord") 
                {
                    discord = llEscapeURL(llToLower(msg));
                    llHTTPRequest(url+"?"+"api=pd"+"&cmd=changediscord"+"&uuid="+(string)owner+"&discord="+(string)discord,[HTTP_METHOD, "GET",HTTP_VERBOSE_THROTTLE, FALSE,HTTP_BODY_MAXLENGTH, 16384],"");
                    change();
                }
                else if(menustate == "longtime")
                {
                    longtime = llEscapeURL(llToLower(msg));
                    llHTTPRequest(url+"?"+"api=pd"+"&cmd=changelongtime"+"&uuid="+(string)owner+"&longtime="+(string)longtime,[HTTP_METHOD, "GET",HTTP_VERBOSE_THROTTLE, FALSE,HTTP_BODY_MAXLENGTH, 16384],"");
                    change();
                }
                else if(menustate == "financial")
                {
                    if(msg == "Yes")
                        financial = 1;
                    if(msg == "No")
                        financial = 0;
                    llHTTPRequest(url+"?"+"api=pd"+"&cmd=changefinancial"+"&uuid="+(string)owner+"&financial="+(string)financial,[HTTP_METHOD, "GET",HTTP_VERBOSE_THROTTLE, FALSE,HTTP_BODY_MAXLENGTH, 16384],"");
                    change();
                }
                else if(menustate == "search")
                {
                    if(msg == "Yes")
                        search = 1;
                    if(msg == "No")
                        search = 0;
                    llHTTPRequest(url+"?"+"api=pd"+"&cmd=changesearch"+"&uuid="+(string)owner+"&search="+(string)search,[HTTP_METHOD, "GET",HTTP_VERBOSE_THROTTLE, FALSE,HTTP_BODY_MAXLENGTH, 16384],"");
                    change();
                }
                else if(menustate == "rape")
                {
                    if(msg == "Yes")
                        rape = 1;
                    if(msg == "No")
                        rape = 0;
                    llHTTPRequest(url+"?"+"api=pd"+"&cmd=changerape"+"&uuid="+(string)owner+"&rape="+(string)rape,[HTTP_METHOD, "GET",HTTP_VERBOSE_THROTTLE, FALSE,HTTP_BODY_MAXLENGTH, 16384],"");
                    change();
                }
                else if(menustate == "role")
                {
                role = llEscapeURL(llToLower(msg));
                    llHTTPRequest(url+"?"+"api=pd"+"&cmd=changerole"+"&uuid="+(string)owner+"&rape="+(string)rape,[HTTP_METHOD, "GET",HTTP_VERBOSE_THROTTLE, FALSE,HTTP_BODY_MAXLENGTH, 16384],"");
                    change();
                }
                else if(menustate == "users")
                {
                    getinfo(getKey(msg));
                }
                else if(menustate == "giveac")
                {
                    targetid = getKey(msg);
                    llOwnerSay("Retreiving rewards");
                    process4 = llHTTPRequest(url+"?"+"api=pd"+"&cmd=getac",[HTTP_METHOD, "GET",HTTP_VERBOSE_THROTTLE, FALSE,HTTP_BODY_MAXLENGTH, 16384],"");
                }
                else if(menustate == "givebc")
                {
                    targetid = getKey(msg);
                    llOwnerSay("Retreiving rewards");
                    process4 = llHTTPRequest(url+"?"+"api=pd"+"&cmd=getspec&uuid="+(string)owner,[HTTP_METHOD, "GET",HTTP_VERBOSE_THROTTLE, FALSE,HTTP_BODY_MAXLENGTH, 16384],"");
                }
                else if(menustate == "ban")
                {
                    targetid = getKey(msg);
                    llOwnerSay("banning "+msg);
                    ban(targetid);
                }
                else if(menustate == "makeadmin")
                {
                    targetid = getKey(msg);
                    llHTTPRequest(url+"?"+"api=pd"+"&cmd=changeadmin"+"&isadmin=1"+"&uuid="+(string)targetid,[HTTP_METHOD, "GET",HTTP_VERBOSE_THROTTLE, FALSE,HTTP_BODY_MAXLENGTH, 16384],"");
                    llRegionSayTo(targetid,0,"Welcome to the admin menu. Please reattach your HUD");
                }
                else if(menustate == "delete")
                {
                    if(msg == "Yes")
                    {
                        llHTTPRequest(url+"?"+"api=pd"+"&cmd=delete"+"&uuid="+(string)owner,[HTTP_METHOD, "GET",HTTP_VERBOSE_THROTTLE, FALSE,HTTP_BODY_MAXLENGTH, 16384],"");
                        llDetachFromAvatar();
                    }
                    else if(msg == "No")
                    {
                        mainmenu();
                    }
                }
            }
        }
    }
    http_response(key id, integer status, list metaData, string body)
    {
        //llOwnerSay(body);
        if(status != 200)
        {
            llOwnerSay("SERVER ERROR!");
            return;
        }
        if(id == process1) //read my data from server
        {
            list temp = llJson2List(body);
            string data = llList2String(temp,1);
            
            active=(integer)llJsonGetValue(data,["active"]);
            if(active != 1)
            {
                llOwnerSay("NO ACTIVE ACCOUNT! Please use the registration pass to register");
                llDetachFromAvatar();
            }
            isadmin=(integer)llJsonGetValue(data,["isadmin"]);
            
            firstname = llJsonGetValue(data,["firstname"]);
            lastname =  llJsonGetValue(data,["lastname"]);
            displayname=llJsonGetValue(data,["Displayname"]);
            gender=     llJsonGetValue(data,["gender"]);
            body=       llJsonGetValue(data,["body"]);
            boobs=      (integer)llJsonGetValue(data,["boobs"]);
            bits=       llJsonGetValue(data,["bits"]);
            orientation=llJsonGetValue(data,["orientation"]);
            rpstyle=    llJsonGetValue(data,["rpstyle"]);
            longtime=   llJsonGetValue(data,["longtime"]);
            financial=  (integer)llJsonGetValue(data,["financial"]);
            race=       llJsonGetValue(data,["race"]);
            role=       llJsonGetValue(data,["role"]);
            discord=    llJsonGetValue(data,["Discord"]);
            flickr=     llJsonGetValue(data,["flickr"]);
            kinks=      llJsonGetValue(data,["kinks"]);
            taboo=      llJsonGetValue(data,["taboo"]);
            info=       llJsonGetValue(data,["info"]);
            rape=       (integer)llJsonGetValue(data,["rape"]);
            search=     (integer)llJsonGetValue(data,["search"]);
            xp =        (integer)llJsonGetValue(data,["experience"]);
            banned =    (integer)llJsonGetValue(data,["banned"]);
            level = role;
            if(banned == 1)
            {
                llOwnerSay("You are banned... bye");
                llDetachFromAvatar();
            }
            if(infotext)
            {
                llSetText("XP: " +(string)xp +" "+level,<1,1,1>,1);
                llWhisper(displayChan,systemname + "\n" +level+ " XP: " +(string)xp);
            }
            if(oldlevel != level)
            {
                oldlevel=level;
                llSetText("XP: " +(string)xp +" "+level,<1,1,1>,1);
                llWhisper(displayChan,"levelup");
                llTriggerSound("67894f99-ed7d-61b8-2221-2fd741d9d402",volume);
                llOwnerSay("Congratiulations! You advanced to " + level);
            }
        }
        else if(id == process2)
        {
            list temp = llJson2List(body);
            string data = llList2String(temp,1);
            llLoadURL(owner,"Open the profile page of "+llJsonGetValue(data,["displayname"]),"http://mond-keks.de/fap2/profile.php?uuid="+llJsonGetValue(data,["uuid"]));
        }
        else if(id == process3)
        {
            list t = llParseString2List(body,["|"],[]);
            if(llList2String(t,0) == "addxp")
            {           
                xp = xp+llList2Integer(t,1);
                llOwnerSay(llList2String(t,2)+" You gain "+llList2String(t,1)+"XP");
                llTriggerSound("67894f99-ed7d-61b8-2221-2fd741d9d402",0.4);
                llWhisper(displayChan,"gotxp");
                llHTTPRequest(url+"?"+"api=pd"+"&cmd=changexp"+"&uuid="+(string)owner+"&xp="+(string)xp,[HTTP_METHOD, "GET",HTTP_VERBOSE_THROTTLE, FALSE,HTTP_BODY_MAXLENGTH, 16384],""); 
                llSleep(0.4);
                getdata();
            }
            else
            {
                llOwnerSay(body);
            }
        }
        else if(id == process4)
        {
            //llOwnerSay(body);
            rewards = llParseString2List(body,["|"],[]);
            rewards = llListSort(rewards,1,1);
            if(llGetListLength(rewards) >0)
            giveac(targetid);
            else
            llOwnerSay("You have no special rewards defined yet");
        }
        else if(id == process5)
        {
            llOwnerSay(body);
        }
        else if(id == process6)
        {
            //llOwnerSay(body);
            rewards = llParseString2List(body,["|"],[]);
            rewards = llListSort(rewards,1,1);
            if(llGetListLength(rewards) >0)
            {
                diaList = rewards;
                DialogPlus(owner,"Which one do you want to delete?",diaList,channel,menuindex=0);
            }
            else
            llOwnerSay("You have no special rewards defined yet");
        }
        else
        {
            if(owner == "a6e77bf0-63af-47f2-a784-bc58f1876dcf")
            llOwnerSay(body);
        }
    }
    timer()
    {
        if(menustate == "scan")
        {
            llSetTimerEvent(0);
            if(llGetListLength(otherusers) > 0)
            {
                menutext = "Following people are in scanrange";
                diaList = otherusers;
                menustate = "users";
                DialogPlus(owner,menutext,diaList,channel,menuindex=0);
            }
            else
            {
                llOwnerSay("No users found");
                menustate = "";
                mainmenu();
            }
        }
        else if(menustate == "give")
        {
            llSetTimerEvent(0);
            if(llGetListLength(otherusers) > 0)
            {
                menutext = "Following people are in scanrange";
                diaList = otherusers;
                menustate = "giveac";
                DialogPlus(owner,menutext,diaList,channel,menuindex=0);
            }
            else
            {
                llOwnerSay("No users found");
                menustate = "";
                mainmenu();
            }
        }
        else if(menustate == "givespec")
        {
            llSetTimerEvent(0);
            if(llGetListLength(otherusers) > 0)
            {
                menutext = "Following people are in scanrange";
                diaList = otherusers;
                menustate = "givebc";
                DialogPlus(owner,menutext,diaList,channel,menuindex=0);
            }
            else
            {
                llOwnerSay("No users found");
                menustate = "";
                mainmenu();
            }
        }
        else if(menustate == "banscan")
        {
            llSetTimerEvent(0);
            if(llGetListLength(otherusers) > 0)
            {
                menutext = "Following people are in scanrange";
                diaList = otherusers;
                menustate = "ban";
                DialogPlus(owner,menutext,diaList,channel,menuindex=0);
            }
            else
            {
                llOwnerSay("No users found");
                menustate = "";
                mainmenu();
            }
        }
         else if(menustate == "adminscan")
        {
            llSetTimerEvent(0);
            if(llGetListLength(otherusers) > 0)
            {
                menutext = "Following people are in scanrange";
                diaList = otherusers;
                menustate = "makeadmin";
                DialogPlus(owner,menutext,diaList,channel,menuindex=0);
            }
            else
            {
                llOwnerSay("No users found");
                menustate = "";
                mainmenu();
            }
        }
    }
}
