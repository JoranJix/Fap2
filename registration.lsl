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

string url = "http://www.mond-keks.de/fap2/data2.php";//?api=undress&cmd=register&data=test2";
string systemname = "FAP2 0.01 A";

key process1;



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
integer xp = 0;

//

key owner;
integer listener;
integer channel;
string menustate;
integer keytoint(string inkey)
{
    return (integer)("0x" + llGetSubString(llMD5String(inkey,0), 0, 7));    
}
dialogminimal(key user,string text,list dialog,integer chan,string status)
{
    llListenRemove(listener);
    listener = llListen(channel,"",owner,"");
    menustate = status;
    llDialog(user,text,dialog,chan);
}
textbox(key user,string text,integer chan,string status)
{
    llListenRemove(listener);
    listener = llListen(channel,"",owner,"");
    menustate = status;
    llTextBox(user,text,chan);
}
default
{
    attach(key AvatarKey)
    {
        if(AvatarKey)
        {
            llResetScript();
        }
    }
    state_entry()
    {
        owner = llGetOwner();
        llRequestPermissions(owner,PERMISSION_ATTACH);
        list t = llParseString2List(llKey2Name(owner),[" "],[]);
        firstname = llList2String(t,0);
        lastname = llList2String(t,1);
        displayname = llEscapeURL(llGetDisplayName(owner));
    }
    run_time_permissions(integer perm)
    {
        if(perm & PERMISSION_ATTACH)
        {
            
        }
    }
    
    touch_start(integer total_number)
    {
       channel = keytoint(owner)+6647;
       dialogminimal(owner,"This is the registration for FAP2 RP\n"+
       "Your data will be saved to our server for later use\n"+
       "with the HUD and nother services related to the system\n"+"After the registration process you can delete this pass."+
       "It will be of no use\n"+
       "Uncompleted registrations will not be shown in search\nand get removed.\n"+
       "If you wish to delete your account, you can do so from the HUD later on.\n"+
       "For more information visit:\n"+
       "http://mond-keks.de/doku.php?id=slfap2"
       ,["Register"],channel,"start");
    }
    listen(integer chan,string name,key id,string msg)
    {
        if(menustate == "start")
        {
            if(msg == "Register")
            {
                process1 = llHTTPRequest(url+"?"+"api=pd"+"&cmd=register"+
                "&uuid="+(string)owner+
                "&firstname="+firstname+
                "&lastname="+lastname+
                "&displayname="+displayname,[HTTP_METHOD, "GET",HTTP_VERBOSE_THROTTLE, FALSE,HTTP_BODY_MAXLENGTH, 16384],"");
                dialogminimal(owner,"First we would like your know your gender.\nThis will be changable later",["male","maleherm","female","shemale","trans","non-binary"],channel,"gender");
            }
        }
        else if(menustate == "gender")
        {
            gender = llEscapeURL(llToLower(msg));
            
            process1 = llHTTPRequest(url+"?"+"api=pd"+"&cmd=changegender"+"&uuid="+(string)owner+"&gender="+(string)gender,[HTTP_METHOD, "GET",HTTP_VERBOSE_THROTTLE, FALSE,HTTP_BODY_MAXLENGTH, 16384],"");
            
            textbox(owner,"Species Family: Furry, Human, Fantasy (with Skin, like elves and Kitsunes), Manga/Anime (Usually Kemono's with m3 Heads and so on), Feral (not Anthro), Reptile (incl. Dragons), Other.\nThis will be changable later",channel,"race");
        }
        else if(menustate == "race")
        {
            race = llEscapeURL(llToLower(msg));
            process1 = llHTTPRequest(url+"?"+"api=pd"+"&cmd=changerace"+"&uuid="+(string)owner+"&race="+(string)race,[HTTP_METHOD, "GET",HTTP_VERBOSE_THROTTLE, FALSE,HTTP_BODY_MAXLENGTH, 16384],"");
            textbox(owner,"Body: Masculine, Athletic, Slim, Curvy, extra Curvy, etcetera.\nThis will be changable later",channel,"body");
        }
        else if(menustate == "body")
        {
            body = llEscapeURL(llToLower(msg));
            process1 = llHTTPRequest(url+"?"+"api=pd"+"&cmd=changebody"+"&uuid="+(string)owner+"&body="+(string)body,[HTTP_METHOD, "GET",HTTP_VERBOSE_THROTTLE, FALSE,HTTP_BODY_MAXLENGTH, 16384],"");
            dialogminimal(owner,"Are you wearing boobs? This will be changable later",["Yes","No"],channel,"boobs");
        }
        else if(menustate == "boobs")
        {
            if(msg == "Yes")
                boobs = 1;
            if(msg == "no")
                boobs = 0;
            process1 = llHTTPRequest(url+"?"+"api=pd"+"&cmd=changeboobs"+"&uuid="+(string)owner+"&boobs="+(string)boobs,[HTTP_METHOD, "GET",HTTP_VERBOSE_THROTTLE, FALSE,HTTP_BODY_MAXLENGTH, 16384],"");
            textbox(owner,"Bits: Cock, Vagina, Both(Herm), Other(for example: Cloaka).\nThis will be changable later",channel,"bits");
        }
        else if(menustate == "bits")
        {
            bits = llEscapeURL(llToLower(msg));
            process1 = llHTTPRequest(url+"?"+"api=pd"+"&cmd=changebits"+"&uuid="+(string)owner+"&bits="+(string)bits,[HTTP_METHOD, "GET",HTTP_VERBOSE_THROTTLE, FALSE,HTTP_BODY_MAXLENGTH, 16384],"");
            textbox(owner,"Sexual Orientation: straight, gay, Everything that breathes...\nThis will be changable later",channel,"orientation");
        }
        else if(menustate == "orientation")
        {
            orientation = llEscapeURL(llToLower(msg));
            process1 = llHTTPRequest(url+"?"+"api=pd"+"&cmd=changeorientation"+"&uuid="+(string)owner+"&orientation="+(string)orientation,[HTTP_METHOD, "GET",HTTP_VERBOSE_THROTTLE, FALSE,HTTP_BODY_MAXLENGTH, 16384],"");
            textbox(owner,"Style of Roleplay: Poseballing, Short Roleplay, Long Roleplay.\nMutliple choices possible.\nThis will be changable later",channel,"rpstyle");
        }
        else if(menustate == "rpstyle")
        {
            rpstyle = llEscapeURL(llToLower(msg));
            process1 = llHTTPRequest(url+"?"+"api=pd"+"&cmd=changerpstyle"+"&uuid="+(string)owner+"&rpstyle="+(string)rpstyle,[HTTP_METHOD, "GET",HTTP_VERBOSE_THROTTLE, FALSE,HTTP_BODY_MAXLENGTH, 16384],"");
            textbox(owner,"Tell us some of your kinks.\nThis will be changable later",channel,"kinks");
        }
        else if(menustate == "kinks")
        {
            kinks = llEscapeURL(llToLower(msg));
            process1 = llHTTPRequest(url+"?"+"api=pd"+"&cmd=changekinks"+"&uuid="+(string)owner+"&kinks="+(string)kinks,[HTTP_METHOD, "GET",HTTP_VERBOSE_THROTTLE, FALSE,HTTP_BODY_MAXLENGTH, 16384],"");
            textbox(owner,"Tell us your taboos.\nThis will be changable later",channel,"taboo");
        }
        else if(menustate == "taboo")  
        {
            taboo = llEscapeURL(llToLower(msg));
            process1 = llHTTPRequest(url+"?"+"api=pd"+"&cmd=changetaboo"+"&uuid="+(string)owner+"&taboo="+(string)taboo,[HTTP_METHOD, "GET",HTTP_VERBOSE_THROTTLE, FALSE,HTTP_BODY_MAXLENGTH, 16384],"");
            textbox(owner,"You have a flickr account?\nPlease enter link or simply write no\nThis will be changable later",channel,"flickr");
        }
        else if(menustate == "flickr") 
        {
            flickr = llEscapeURL(llToLower(msg));
            process1 = llHTTPRequest(url+"?"+"api=pd"+"&cmd=changeflickr"+"&uuid="+(string)owner+"&flickr="+(string)flickr,[HTTP_METHOD, "GET",HTTP_VERBOSE_THROTTLE, FALSE,HTTP_BODY_MAXLENGTH, 16384],"");
            textbox(owner,"You have a discord account?\nPlease enter your accountname or simply write no\nThis will be changable later",channel,"discord");
        }
        else if(menustate == "discord") 
        {
            discord = llEscapeURL(llToLower(msg));
            process1 = llHTTPRequest(url+"?"+"api=pd"+"&cmd=changediscord"+"&uuid="+(string)owner+"&discord="+(string)discord,[HTTP_METHOD, "GET",HTTP_VERBOSE_THROTTLE, FALSE,HTTP_BODY_MAXLENGTH, 16384],"");
            dialogminimal(owner,"Longtime Relation?\n(Family or Partnership for example)",["Yes","No","Already in one"],channel,"longtime");
        }
        else if(menustate == "longtime")
        {
            longtime = llEscapeURL(llToLower(msg));
            process1 = llHTTPRequest(url+"?"+"api=pd"+"&cmd=changelongtime"+"&uuid="+(string)owner+"&longtime="+(string)longtime,[HTTP_METHOD, "GET",HTTP_VERBOSE_THROTTLE, FALSE,HTTP_BODY_MAXLENGTH, 16384],"");
            dialogminimal(owner,"Financial interest?",["Yes","No"],channel,"financial");
        }
        else if(menustate == "financial")
        {
            if(msg == "Yes")
                financial = 1;
            if(msg == "No")
                financial = 0;
            process1 = llHTTPRequest(url+"?"+"api=pd"+"&cmd=changefinancial"+"&uuid="+(string)owner+"&financial="+(string)financial,[HTTP_METHOD, "GET",HTTP_VERBOSE_THROTTLE, FALSE,HTTP_BODY_MAXLENGTH, 16384],"");
            dialogminimal(owner,"Do you want your account to be shown in search?",["Yes","No"],channel,"search");
        }
        else if(menustate == "search")
        {
            if(msg == "Yes")
                search = 1;
            if(msg == "No")
                search = 0;
            process1 = llHTTPRequest(url+"?"+"api=pd"+"&cmd=changesearch"+"&uuid="+(string)owner+"&search="+(string)search,[HTTP_METHOD, "GET",HTTP_VERBOSE_THROTTLE, FALSE,HTTP_BODY_MAXLENGTH, 16384],"");
            dialogminimal(owner,"Can other players rape you?",["Yes","No"],channel,"rape");
        }
        else if(menustate == "rape")
        {
            if(msg == "Yes")
                rape = 1;
            else if(msg == "No")
                rape = 0;
            process1 = llHTTPRequest(url+"?"+"api=pd"+"&cmd=changerape"+"&uuid="+(string)owner+"&rape="+(string)rape,[HTTP_METHOD, "GET",HTTP_VERBOSE_THROTTLE, FALSE,HTTP_BODY_MAXLENGTH, 16384],"");
            textbox(owner,"Add a picture UUID or URL?\nThis will be dieplayed on your profile page\nThis will be changable later",channel,"picture");
            
        }
        else if(menustate == "picture")
        {
            process1 = llHTTPRequest(url+"?"+"api=pd"+"&cmd=changepicture"+"&uuid="+(string)owner+"&picture="+(string)msg,[HTTP_METHOD, "GET",HTTP_VERBOSE_THROTTLE, FALSE,HTTP_BODY_MAXLENGTH, 16384],"");
            dialogminimal(owner,"Registering now! If you press No, all your data will be deleted",["Ok","No"],channel,"finalize");
        }
        else if(menustate == "finalize")
        {
            if(msg == "No")
            {
                process1 = llHTTPRequest(url+"?"+"api=pd"+"&cmd=delete"+"&uuid="+(string)owner,[HTTP_METHOD, "GET",HTTP_VERBOSE_THROTTLE, FALSE,HTTP_BODY_MAXLENGTH, 16384],"");
                llDetachFromAvatar();
                return;
            }
            else if(msg == "Ok")
            {
                process1 = llHTTPRequest(url+"?"+"api=pd"+"&cmd=changeactive"+"&uuid="+(string)owner+"&active="+"1"+"&firstname="+(string)firstname+"&lastname="+(string)lastname,[HTTP_METHOD, "GET",HTTP_VERBOSE_THROTTLE, FALSE,HTTP_BODY_MAXLENGTH, 16384],"");
                
                
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
        if(body == "active")
        {
            llOwnerSay("Your account is now activated!");
            if(owner != "a6e77bf0-63af-47f2-a784-bc58f1876dcf")
            {
                llRemoveInventory(llGetScriptName());
            }
        }
    }
    
}
