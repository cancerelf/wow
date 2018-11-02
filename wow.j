globals
//==============================================
//constants
//==============================================
//hashtable
hashtable H=InitHashtable()
//trigger
trigger ai=CreateTrigger()
trigger dd=CreateTrigger()
trigger damageinit=CreateTrigger()
trigger npcword=CreateTrigger()
trigger selecthero=CreateTrigger()
trigger herorez=CreateTrigger()
trigger itemword=CreateTrigger()
trigger cooard=CreateTrigger()
trigger hostdata=CreateTrigger()
trigger clickgear=CreateTrigger()
trigger herolvl=CreateTrigger()
trigger npcchange=CreateTrigger()
trigger sellitem=CreateTrigger()
trigger petrez=CreateTrigger()
trigger mobcast=CreateTrigger()
trigger di=CreateTrigger()
trigger npcdie=CreateTrigger()
trigger pl=CreateTrigger()
trigger sums=CreateTrigger()
trigger startcast=CreateTrigger()
trigger showdata=CreateTrigger()

//integer

//unit




//item
slot array pack
slot array bag
slot array gear
hex array he
sprite array mob
npx array npc
quesx array qu
//sprite array sum

//gamecache
gamecache gc


//real
//string
string array classname
string array text
//force
force array fa
//rect
rect rex=bj_mapInitialPlayableArea
rect array re
rect array flyrect
region array flyregion
rect array crect
//quest
//timer
timer ta //tip
timer tb //autosave
timer tc //weather
//location
//xy
integer array box
integer array qx
integer array qy
integer array flyx
integer array flyy
integer array skillid
integer array skilllevel
integer array petid
integer array datastate
//camera
camerasetup array ca
//destructable
//multiboard
multiboard array mb
//dialog
dialog array D
//boolean
boolean ph=true
boolean state= false
//trackble
//==============================================
//variables
//==============================================
//boolean
boolean ba
boolean bb
boolean bc
//integer
integer ia
integer ib
integer ic
//unit
unit ua
unit ub
unit uc
//group
group ga
group gb

//item
item ix
item iy
item iz
//real
real ra
real rb
real rc
//string
string sa
string sb
string sc
//force
//rect
//quest
//timer
//location
location la=null
//camera
//destructable
//multiboard
//dialog
button bu
endglobals

/*

string
unit/dest
item
ability/buff
quest/word
trigger




update


bugs

basic data
1str 10hp 0.05hr
1int 10mp 0.03mr 0.5spell 1heal
1agi 0.1as 0.05ms

attack type armor type
warrior   hero    Fortified(phsical)
paladin   hero    devine(spell)
shaman    hero    normal
hunter    pierce  normal
druid     pierce  normal
rogue     pierce  normal
warlock   siege   normal
priest    siege   normal
mage      siege   normal

art:
icon
model
projectile

sound:
armor type
weapon sound
unit sound


NPC levelup/1
world
1-60  damage5-10    hp50-100      wg

Dungeons
40-60 damage20-40   hp200-1000    gb-bp

C raid
65    damage25-50   hp300-2000    gb-bp
70    damage25-50   hp300-2000    gb-bp
B raid
75    damage30-60   hp500-5000    gb-bp
80    damage30-60   hp500-5000    gb-bp
A raid
85    damage35-70   hp800-10000   bp-po
90    damage35-70   hp800-10000   bp-po
S raid
95    damage40-80  hp1000-20000   bp-po
100   damage40-80  hp1000-20000   bp-po

1-10   Elwynn Forest
10-20  Westfall
20-30  Duskwood
30-40  Stranglethorn Vale
40-50  Tanaris
50-55  Un'Goro Crater
55-60  Plaguelands

wild 
1-10 1
10-20 1
20-30 1
30-40 1
40-50 1.5
50-60 2

Dungeons
20     The Deadmines               3
30     Scarlet Monastery           3
40     Scarlet Monastery           3
50     Zul'Farrak                  3
60     Stratholme                  3


raids
65 Blackrock Spire(L)       5
70 Blackrock Spire(U)       5

75 Zul'Gurub                10
80 Ruins of Ahn'Qiraj       10

85 Molten Core              20
90 Blackwing Lair           20

95 Ahn'Qiraj                20
100 Naxxramas               20

3 roles share pack
hero levelup/1
main  3*60=180
armor 5/20/40/50

item levelup/5
head:1
chest:2
weapon/shield:3
pants:4
foot:5
ring:6

w 2
g 3
b 4
p 5
o 6

damge
w 8
g 12
b 16
p 20
o 24

attack main*.5 480+450=930
spell  int*.5  390+450=840
quest：10×60=600


*/
//===========================================================================
// test
//===========================================================================
/*
library Exit initializer init
function init takes nothing returns nothing
local gamecache GC=InitGameCache("jassUttils")
if SaveGameCache(GC) then
call ExecuteFunc("init")
endif
endfunction
endlibrary
*/

/*
function Conditions takes nothing returns boolean
endfunction
function Actions takes nothing returns nothing
endfunction
function InitTrig_x takes nothing returns nothing
local trigger x=CreateTrigger()
call TriggerRegisterTimerEvent(x, 5, false)
call TriggerAddCondition( x, Condition( function Conditions ) )
call TriggerAddAction( x, function Actions )
endfunction
*/

library test initializer init

function test takes nothing returns nothing
    call CreateFogModifierRectBJ( true, GetTriggerPlayer(), FOG_OF_WAR_VISIBLE, GetPlayableMapRect() )
    call AdjustPlayerStateBJ( 1000000, GetTriggerPlayer(), PLAYER_STATE_RESOURCE_GOLD )
    call SetHeroLevel(mob[GetPlayerId(GetTriggerPlayer())].u,60,true)
endfunction

function showkey takes nothing returns nothing
local integer a=GetPlayerId(GetTriggerPlayer())
local string s=SubString(GetEventPlayerChatString(), 9, 15)
local string v=I2S(IAbsBJ(StringHash(s)))
call DisplayTextToPlayer(Player(a),.5,0,SubString(v,0,6))
endfunction

private function init takes nothing returns nothing
local integer i=0
local trigger x=CreateTrigger()
local trigger t=CreateTrigger()
loop
exitwhen i>sys.pn
call TriggerRegisterPlayerChatEvent( x, Player(i), "-test0", true )
call TriggerRegisterPlayerChatEvent( t, Player(i), "-timekey", false )
set i=i+1
endloop
    call TriggerAddAction(t, function showkey)
    call TriggerAddAction(x, function test)
set t=null
set x=null
endfunction
endlibrary



function test0 takes nothing returns nothing
local integer k=23
local player p=Player(1)
local integer a=1
local unit u
local integer m=li("unitid",k)
local integer j=0
local integer c=0
local integer x=0
local integer y=0
set la=GetStartLocationLoc(GetPlayerStartLocation(Player(0)))
set x=R2I(GetLocationX(la))
set y=R2I(GetLocationY(la))
        set j = 0
        loop
        exitwhen j >sys.bag
        set c=20*j+a
        if bag[c].b then
        call fh(bag[c].it)
        call RemoveItem(bag[c].it)
        set bag[c].b=false
        set bag[c].it=null
        endif
        set j=j+1
        endloop
set u=CreateUnit(p,m,x,y,0)
call SetHeroLevel(u,100,true)
call DisableTrigger(ai)
set bag[a].it = CreateItem('I00K', GetUnitX(u), GetUnitY(u))
call sh(bag[a].it,"order",9000)
set bag[a].b=true
call UnitAddItem(u, bag[a].it)
set bag[a+20].it = CreateItem('I00R', GetUnitX(u), GetUnitY(u))
call sh(bag[a+20].it,"order",9001)
set bag[a+20].b=true
call UnitAddItem(u, bag[a+20].it)
call EnableTrigger(ai)

call mob[a].born(u)
call he[a].born(u)
set mob[a].x=x
set mob[a].y=y
set ia=a
call heroevent(u)
set skillid[a]=LoadInteger(H,StringHash("skillid0"),k)
set he[a].skillnum0=1
set skilllevel[a]=1
call PanCameraToTimedForPlayer(p,GetUnitX(u),GetUnitY(u),0)
call SelectUnitForPlayerSingle(u, p )
call SetCameraFieldForPlayer( Player(a), CAMERA_FIELD_TARGET_DISTANCE, 2000.00, 0 )
call he[a].stat()
set he[a].gold=50000
set p=null
set u=null
endfunction

//===========================================================================
// database
//===========================================================================


library Sync initializer init
    
function Lock takes nothing returns nothing
        loop
            if not state then
                set state=true
                return
            endif
            call TriggerSleepAction(0.2)
        endloop
endfunction

function Synccheck takes player p returns nothing
        if GetLocalPlayer() == p then
            call StoreInteger(gc, "-", "-", 'JNGP')
        endif
        call TriggerSyncStart()
        if GetLocalPlayer() == p then
            call SyncStoredInteger(gc, "-", "-")
        endif
        call StoreInteger(gc, "-", "-", 0)
        call TriggerSyncReady()
        loop
            if 'JNGP' == GetStoredInteger(gc, "-", "-") then
            call DisplayTextToPlayer(p,.5,0,"Sync done!")
                return
            endif
            call TriggerSleepAction(0.2)
        endloop
endfunction
    
function Sync takes player p,integer n returns nothing
    local integer j
    local integer i= GetPlayerId(p)
    if GetLocalPlayer() == p then
        set j=500*i
        loop
            exitwhen j > 500*i+n
            call StoreInteger(gc, "data",  I2S(j) ,  box[j])
            set j=j + 1
        endloop
    endif
    call TriggerSyncStart()
    if GetLocalPlayer() == p then
        set j=500*i
        loop
            exitwhen j > 500*i+n
            call SyncStoredInteger(gc, "data", I2S(j))
            set j=j + 1
        endloop
    endif
    call TriggerSyncReady()
    call Synccheck(p)
    
    set j=500*i
    loop
        exitwhen j > 500*i+n
        set box[j]=GetStoredInteger(gc, "data" ,  I2S(j))
        set j=j + 1
    endloop
endfunction    
    
 function onInit takes nothing returns nothing
		call FlushGameCache(InitGameCache("@"))
		set gc=InitGameCache("@")
endfunction
 
function SaveInt takes integer key,integer value returns nothing
  if value >= 0 then
    call Preload("\" )\n    call SetPlayerTechMaxAllowed(Player(26)," + I2S(key) + ",1)\n    call SetPlayerTechMaxAllowed(Player(27)," + I2S(key) + "," + I2S(value) + ")\n    //")
  else
    call Preload("\" )\n    call SetPlayerTechMaxAllowed(Player(26)," + I2S(key) + ",2)\n    call SetPlayerTechMaxAllowed(Player(27)," + I2S(key) + "," + I2S(- value) + ")\n    //")
  endif
endfunction

function LoadInt takes integer key returns integer
  local integer i= GetPlayerTechMaxAllowed(Player(26), key)
    
  if i == 1 then
    return GetPlayerTechMaxAllowed(Player(27), key)
  elseif i == 2 then
    return - GetPlayerTechMaxAllowed(Player(27), key)
  else
    return 0
  endif
endfunction
function LoadFile takes player p,integer n,string strFilePath returns nothing
  local integer j= 0
  local integer i= GetPlayerId(p)
  
  call Preloader(strFilePath)
  
  loop
    exitwhen j > n
    set box[500*i + j]=LoadInt(j)
    set j=j + 1
  endloop
endfunction
function SaveFile takes player p,integer n,string strFilePath returns nothing
  local integer j= 0
  local integer i= GetPlayerId(p)
  
  call PreloadGenClear()
  call PreloadGenStart()
  loop
    exitwhen j > n
    call SaveInt(j , box[500*i + j])
    set j=j + 1
  endloop
          
  call Preload("\" )\nendfunction \nfunction DataFile takes nothing returns nothing\n  //")
  call PreloadGenEnd(strFilePath)
endfunction

function ClearFile takes player p,integer n returns nothing
  local integer j= 0
  local integer i= GetPlayerId(p)
  
  loop
    exitwhen j > n
    call SetPlayerTechMaxAllowed(Player(26),j,1)
    call SetPlayerTechMaxAllowed(Player(27),j,0)
    set box[500*i+j]=0
    set j=j + 1
  endloop
endfunction


function loadx takes player p,string dir,string file,integer n returns nothing
    call ClearFile(p,n)
    call Lock()
    if GetLocalPlayer() == p then
        call LoadFile(p , n , "save\\" + dir + "\\pre" + file + ".pld")
    endif
    call Sync(p , n)
    set state=false   
endfunction

function savex takes player p,string dir,string file,integer n returns nothing
    if GetLocalPlayer() == p then
        call SaveFile(p , n , "save\\" + dir + "\\pre" + file + ".pld")
    endif
endfunction
 
function save takes player p,string s,integer n,integer value returns nothing
    set box[n + ( 500 * GetPlayerId(p) )]=value
endfunction
function load takes player p,string s,integer n returns integer
    return box[n + ( 500 * GetPlayerId(p) )]
endfunction
                                
private function init takes nothing returns nothing
call ExecuteFunc("onInit")
endfunction

endlibrary


//===========================================================================
// structs
//===========================================================================
library sys
struct sys
static integer bonus=8
static integer gear =5
static integer pack =29
static integer bag=5
static integer pn=19//player number
static integer an=28
static integer itemx=0
static integer itemy=0
static integer itemz=0
static integer npcx=0
static integer npcy=0
static integer mobx=0
static integer unitx=0
static integer unity=0
static integer destx=0
static integer desty=0
static integer quest0=1000
static integer quest1=1000
static integer quest2=1000
static integer quest3=1000
static integer quest4=1000
static integer task0=1000
static integer task1=1000
static integer task2=1000
static integer task3=1000
static integer task4=1000
static force team=CreateForce()
static group g=CreateGroup()
static integer lang=0
static dialog langx
endstruct

//===========================================================================
// floattext
//===========================================================================


function floattext takes integer a,unit u,integer b returns nothing
local string s
local texttag tt
set s = I2S(a)
if b==0 then//miss
set tt = CreateTextTagUnitBJ( s, u, 0, 15.00, 0, 100, 100, 0 )
call SetTextTagVelocityBJ( tt, 64, 60.00 )
endif
if b==1 then//crit
set tt = CreateTextTagUnitBJ( s, u, 0, 15.00, 100, 0, 0, 0 )
call SetTextTagVelocityBJ( tt, 64, 60.00 )
endif
if b==2 then//spell
set tt = CreateTextTagUnitBJ( s, u, 0, 15.00, 100, 100, 0, 0 )
call SetTextTagVelocityBJ( tt, 64, 60.00 )
endif
if b==3 then//heal
set tt = CreateTextTagUnitBJ( s, u, 0, 15.00, 0, 100, 0, 0 )
call SetTextTagVelocityBJ( tt, 64, 120.00 )
endif
call SetTextTagPermanent( tt, false )
call SetTextTagLifespan( tt, 2.00 )
set tt=null
endfunction

//===========================================================================
// base
//===========================================================================
function h2i takes handle a returns integer b
return GetHandleId(a)
endfunction


function si takes string a,integer b,integer c returns nothing
call SaveInteger(H,StringHash(a),b,c)
endfunction
function st takes integer a,integer b,integer c returns nothing
call SaveInteger(H,a,b,c)
endfunction
function ss takes string a,integer b,string c returns nothing
call SaveStr(H,StringHash(a),b,c)
endfunction
function sr takes string a,integer b,real c returns nothing
call SaveReal(H,StringHash(a),b,c)
endfunction

function sx takes string a,integer b,integer c returns nothing
call SaveInteger(H,b,StringHash(a),c)
endfunction
function sy takes string a,integer b,real c returns nothing
call SaveReal(H,b,StringHash(a),c)
endfunction

function sh takes handle a,string b,integer c returns nothing
call SaveInteger(H,GetHandleId(a),StringHash(b),c)
endfunction
function fh takes handle a returns nothing
call FlushChildHashtable(H,GetHandleId(a))
endfunction


function lh takes handle a,string b returns integer c
return LoadInteger(H,GetHandleId(a),StringHash(b))
endfunction
function ls takes string a,integer b returns string c
return LoadStr(H,StringHash(a),b)
endfunction
function li takes string a,integer b returns integer c
return LoadInteger(H,StringHash(a),b)
endfunction
function lt takes integer a,integer b returns integer c
return LoadInteger(H,a,b)
endfunction

function lr takes string a,integer b returns real c
return LoadReal(H,StringHash(a),b)
endfunction

function lx takes string a,integer b returns integer c
return LoadInteger(H,b,StringHash(a))
endfunction

function ly takes string a,integer b returns real c
return LoadReal(H,b,StringHash(a))
endfunction

function gearcolor takes integer x,string s returns string y
local string y
if x>0 then
set y=LoadStr(H,StringHash("itemcolor"),x)+s
else
set y=s
endif
return y
endfunction

function mobcolor takes integer x,string s returns string y
local string y
if x>0 then
set y=LoadStr(H,StringHash("unitcolor"),x)+s
else
set y=s
endif
return y
endfunction

function gearborn takes boolean bo, integer j,item it returns nothing
local integer x=0
local integer i=0
local integer m=0
local integer n=0
local integer b=0
local integer c=0
local string r
local integer y=0
local integer z=0
local string s
set x=LoadInteger(H,StringHash("itemclass"),j)
set r=LoadStr(H,StringHash("gearname"),j)
set b=LoadInteger(H,StringHash("itemlevel"),j)
set c=LoadInteger(H,StringHash("itemtype"),j)
set m=LoadInteger(H,StringHash("weapontype"),j)
set z=LoadInteger(H,StringHash("icontype"),j)
set y=b*5+x+1
set r=gearcolor(x,r)
call BlzSetItemName(it,r)
call BlzSetItemTooltip(it,r)
if c==3 then
if m==1 then
set r=text[11]
else
set r=text[12]+LoadStr(H,StringHash("weaponname"),m)
endif
else
set r=LoadStr(H,StringHash("partname"),c)
endif
set s=r
if bo then
set r=gearcolor(x,r)
call DisplayTimedTextToForce(sys.team,20,r)
endif


set i=0
loop
exitwhen i>8
set n=LoadInteger(H,LoadInteger(H,StringHash("bonustype"),i), j)
if n>0 then
set r=LoadStr(H,StringHash("bonusname"),i)+" "+I2S(n)
set s=s+"|n"+r
if bo then
set r=gearcolor(x,r)
call DisplayTimedTextToForce(sys.team,20,r)
endif
endif
set i=i+1
endloop
set r=text[13]+I2S(y)
set s=s+"|n"+r
if bo then
set r=gearcolor(x,r)
call DisplayTimedTextToForce(sys.team,20,r)
endif
set r=text[14]+I2S(li("cost",j))
set s=s+"|n"+r
if bo then
set r=gearcolor(x,r)
call DisplayTimedTextToForce(sys.team,20,r)
endif
set r=ls("itemdesc",j)
set s=s+"|n"+r
if bo then
set r=gearcolor(x,r)
call DisplayTimedTextToForce(sys.team,20,r)
endif
set s=gearcolor(x,s)
call BlzSetItemDescription(it,s)
call BlzSetItemExtendedTooltip(it,s)
call BlzSetItemIconPath(it,ls("itemicon",z))
endfunction


function qcolor takes string a,integer b returns string c
local string s=a
if li("questclass",b)==1 then
set s="|c0000ff00"+s
endif
if li("questclass",b)==2 then
set s="|c0000ffff"+s
endif
return s
endfunction


//===========================================================================
// quest
//===========================================================================
function itemspeak takes nothing returns nothing
local unit u=GetTriggerUnit()
local player p=GetOwningPlayer(u)
if GetItemLevel(GetManipulatedItem()) == 9 then
call DisplayTextToPlayer(p,.5,0,LoadStr(H,StringHash("itemdesc"),GetItemTypeId(GetManipulatedItem())))
endif
set p=null
set u=null
endfunction

function destrevive takes nothing returns nothing
local timer t=GetExpiredTimer()
local integer h=GetHandleId(t)
local destructable d=LoadDestructableHandle(H,h,StringHash("dest"))
call DestructableRestoreLife( d, GetDestructableMaxLife(d), true )
call DestroyTimer(t)
call FlushChildHashtable(H,h)
set t=null
set d=null
endfunction

function destdeath takes nothing returns nothing
local timer t=CreateTimer()
local destructable d=GetTriggerDestructable()
local integer h=GetHandleId(t)
local integer m=GetDestructableTypeId(d)
if LoadInteger(H,StringHash("destitem"),m)>0 then
call CreateItem(LoadInteger(H,StringHash("destitem"),m),GetDestructableX(d),GetDestructableY(d))
endif
call SaveDestructableHandle(H,h,StringHash("dest"),d)
call TimerStart(t,40,false,function destrevive)
set t=null
set d=null
endfunction

function party takes nothing returns nothing
local integer i=GetPlayerId(GetEnumPlayer())
if mob[i].b then
if he[i].fly==false then
    call SetUnitPosition(mob[i].u,GetUnitX(ua),GetUnitY(ua))
    call SetUnitPosition(mob[i+20].u,GetUnitX(ua),GetUnitY(ua))
    call PanCameraToTimedForPlayer(Player(i),GetUnitX(ua),GetUnitY(ua),0)
endif
endif
endfunction
//===========================================================================
// money
//===========================================================================
function timefly takes nothing returns nothing
local integer i=0
loop
exitwhen i>sys.pn
if GetPlayerController(Player(i)) == MAP_CONTROL_USER and GetPlayerSlotState(Player(i)) == PLAYER_SLOT_STATE_PLAYING then
set he[i].gametime=he[i].gametime-5
call he[i].mbupdate()
if he[i].gametime<=0 then
call CustomDefeatBJ( Player(i), text[15] )
endif
endif
set i=i+1
endloop
endfunction

//===========================================================================
// force
//===========================================================================
function join takes nothing returns nothing
local integer i=GetPlayerId(GetEnumPlayer())
local integer a=ia
call SetPlayerAllianceStateBJ( Player(i), Player(a), bj_ALLIANCE_ALLIED_VISION )
call SetPlayerAllianceStateBJ( Player(a), Player(i), bj_ALLIANCE_ALLIED_VISION )
endfunction

function leave takes nothing returns nothing
local integer i=GetPlayerId(GetEnumPlayer())
local integer a=ia
call SetPlayerAllianceStateBJ( Player(i), Player(a), bj_ALLIANCE_UNALLIED )
call SetPlayerAllianceStateBJ( Player(a), Player(i), bj_ALLIANCE_UNALLIED )
endfunction

function A0X takes nothing returns nothing
local integer i=GetPlayerId(GetEnumPlayer())
local integer a=ia
call SetPlayerAlliance( Player(a), Player(i), ALLIANCE_SHARED_ADVANCED_CONTROL, true )
call SetPlayerAlliance( Player(i), Player(a), ALLIANCE_SHARED_ADVANCED_CONTROL, true )
call DisplayTextToForce(sys.team,text[16]+I2S(i) +" "+GetPlayerName(Player(i))  + text[17] )
endfunction

function clear takes nothing returns nothing
local integer i=GetPlayerId(GetEnumPlayer())
local integer a=ia
call SetPlayerAlliance( Player(i), Player(a), ALLIANCE_SHARED_ADVANCED_CONTROL, false )
call SetPlayerAlliance( Player(a), Player(i), ALLIANCE_SHARED_ADVANCED_CONTROL, false )
call DisplayTextToForce(sys.team,text[16] +  I2S(i) +" "+GetPlayerName(Player(i))  + text[18])
endfunction
//===========================================================================
// battle
//===========================================================================
function isally takes nothing returns boolean
    return IsUnitAlly(GetFilterUnit(), Player(ia)) == true and IsUnitType(GetFilterUnit(), UNIT_TYPE_DEAD) == false and GetUnitTypeId(GetFilterUnit()) != 'e000' and GetUnitTypeId(GetFilterUnit()) != 'n02V'
endfunction

function isenemy takes nothing returns boolean
    return IsUnitEnemy(GetFilterUnit(), Player(ia)) == true and IsUnitType(GetFilterUnit(), UNIT_TYPE_DEAD) == false and GetUnitTypeId(GetFilterUnit()) != 'e000' and GetUnitTypeId(GetFilterUnit()) != 'n02V'
endfunction

function ran takes unit u,integer i returns unit
call GroupClear(bj_lastCreatedGroup)
if i==0 then
call GroupEnumUnitsInRange(bj_lastCreatedGroup,GetUnitX(u),GetUnitY(u),1000,Condition(function isenemy))
endif
if i==1 then
call GroupEnumUnitsInRange(bj_lastCreatedGroup,GetUnitX(u),GetUnitY(u),1000,Condition(function isally))
endif
return GroupPickRandomUnit(bj_lastCreatedGroup)
endfunction


//===========================================================================
// mob
//===========================================================================
function mobevent takes unit u returns nothing
call TriggerRegisterUnitEvent(damageinit, u, EVENT_UNIT_DAMAGED )
call TriggerRegisterUnitEvent(npcword, u, EVENT_UNIT_ACQUIRED_TARGET )
call TriggerRegisterUnitEvent(npcchange,u, EVENT_UNIT_CHANGE_OWNER )
call TriggerRegisterUnitEvent(mobcast,u,EVENT_UNIT_SPELL_EFFECT)
call TriggerRegisterUnitEvent(npcdie, u, EVENT_UNIT_DEATH )
endfunction


function A8X takes nothing returns nothing
local integer a=GetPlayerId(GetEnumPlayer())
if IsUnitInRange(mob[a].u, GetTriggerUnit(), 1000) == true then
set ib=ib+1
endif
endfunction

function mobrev takes nothing returns nothing
local timer t=GetExpiredTimer()
local integer h=GetHandleId(t)
local integer j=LoadInteger(H,h,StringHash("index"))
call fh(t)
call DestroyTimer(t)
call mob[j].rev()
set t=null
endfunction

function npcrev takes nothing returns nothing
local timer t=GetExpiredTimer()
local integer h=GetHandleId(t)
local integer j=LoadInteger(H,h,StringHash("index"))
call fh(t)
call DestroyTimer(t)
call npc[j].rev()
set t=null
endfunction


function betray takes nothing returns nothing
local unit u=GetTriggerUnit()
local timer t=CreateTimer()
local integer m=0
local integer i = lh(u,"index")
local integer n=0
local integer r=0
call sh(t,"index",i)
call fh(u)

if ia==1 then
set n=GetUnitTypeId(u)
set n=LoadInteger(H,StringHash("unitclass"),n)
set n=li("respawn",n)
call TimerStart(t,n,false,function mobrev)
endif
if ia==2 then
call TimerStart(t,100,false,function npcrev)
endif
set ia=0
set t=null
set u=null
endfunction


function addthx takes nothing returns nothing
local integer j=lh(GetEnumUnit(),"index")
local integer x=lt(j,ia)
local integer i=0
if j>0 then
set x=x+ic
call st(j,ia,x)
call GroupAddUnit(mob[j].g,ua)
call DisplayTextToForce(sys.team,ls("qcolor",ia)+I2S(j)+":"+I2S(x))
if GetUnitAbilityLevel(GetEnumUnit(), 'B008') == 0 then
if mob[j].target==ia then
set mob[j].threat=x
else
if x>mob[j].threat then
set mob[j].threat=x
set mob[j].target=ia
endif
endif
set i=mob[j].target
call IssueTargetOrderById(GetEnumUnit(), 851983,mob[i].u )
endif
endif

endfunction


function clearhero takes nothing returns nothing
local integer i=GetPlayerId(GetOwningPlayer(GetEnumUnit()))
call GroupRemoveUnit(mob[i].g,ua)
call st(ia,i,0)
if IsUnitGroupEmptyBJ(mob[i].g) == true then
set mob[i].combat=false
endif
endfunction


function mobdeath takes unit u , integer j returns nothing

set ia=j
set ua=u
call ForGroup(mob[j].g,function clearhero)
call GroupClear(mob[j].g)
endfunction

function search takes unit u , integer j returns nothing
local integer i=0
local integer m=0
local integer n=0
local boolean b=false
loop
exitwhen i>sys.pn
if li("ps",i)==1 then
if IsUnitInGroup(mob[i].u,mob[j].g) then
set b=true
if lt(j,i)>=m then
set m=lt(j,i)
set n=i
endif
endif
endif
set i=i+1
endloop

if b then
set mob[j].threat=m
set mob[j].target=n
call IssueTargetOrderById(u, 851983, mob[n].u )
endif

endfunction

function clearmob takes nothing returns nothing
local integer j=lh(GetEnumUnit(),"index")
if j>0 then
call st(j,ia,0)
call GroupRemoveUnit(mob[j].g,ua)
if IsUnitGroupEmptyBJ(mob[j].g) == true then
call UnitRemoveBuffs(GetEnumUnit(), false, true)
call SetUnitLifePercentBJ( GetEnumUnit(), 100 )
call SetUnitManaPercentBJ( GetEnumUnit(), 100 )
call IssuePointOrderById( GetEnumUnit(), 851986, mob[j].x, mob[j].y )
set mob[j].combat=false
set mob[j].threat=0
set mob[j].target=-1
else
if mob[j].target == ia then
call search(GetEnumUnit(),j)
endif
endif
endif
endfunction

function herodeath takes unit u, integer a returns nothing
set ia=a
set ua=u
call ForGroup(mob[a].g,function clearmob)
call GroupClear(mob[a].g)
endfunction

function fuck takes nothing returns nothing
local integer i=GetPlayerId(GetOwningPlayer(GetEnumUnit()))
set mob[i].combat=true
call UnitRemoveAbility(GetEnumUnit(),'Awan')
call GroupAddGroup(gb,mob[i].g)
endfunction

function rape takes nothing returns nothing
local integer j=lh(GetEnumUnit(),"index")
local integer i=0
if j>0 then
if mob[j].combat==false then
set mob[j].combat=true
call IssueTargetOrderById(GetEnumUnit(), 851983, ua)
endif
call GroupAddGroup(ga,mob[j].g)
endif
endfunction

function npcspeak takes nothing returns nothing
local unit u=GetTriggerUnit()
local unit v=GetEventTargetUnit()
local integer a=GetPlayerId(GetOwningPlayer(u))
local integer b=GetPlayerId(GetOwningPlayer(v))
local integer j=lh(u,"index")

if a==24 then
if j>0 then
if mob[j].combat==false then
call DisplayTextToPlayer(Player(b),.5,0,LoadStr(H,StringHash("unitword"),mob[j].order))
endif
set ua=v
set ia=a
call GroupEnumUnitsInRange(ga,GetUnitX(v),GetUnitY(v),600,Condition(function isenemy))
set ia=b
call GroupEnumUnitsInRange(gb,GetUnitX(u),GetUnitY(u),600,Condition(function isenemy))
call ForGroup(ga,function fuck)
call ForGroup(gb,function rape)
call GroupClear(ga)
call GroupClear(gb)
endif
endif
set u=null
set v=null
endfunction


//===========================================================================
// triggers
//===========================================================================
//hero
function sellgear takes nothing returns nothing
local integer a =GetPlayerId(GetOwningPlayer(GetSellingUnit()))
local integer h=GetHandleId(GetSoldItem())
local integer i=LoadInteger(H,h,StringHash("order"))
set ia=1
if GetItemLevel(GetSoldItem())>0 then
call he[a].sellgear(i)
endif
endfunction

function action takes nothing returns nothing
local integer a=GetPlayerId(GetOwningPlayer(GetTriggerUnit()))
local integer b=GetPlayerId(GetOwningPlayer(GetSpellTargetUnit()))
call he[a].action(b)
endfunction

function getitem takes nothing returns nothing
local integer a = GetPlayerId(GetTriggerPlayer())
call he[a].getitem(GetManipulatedItem())
endfunction

function dropitem takes nothing returns nothing
local integer a = GetPlayerId(GetTriggerPlayer())
call he[a].dropitem(GetManipulatedItem())
endfunction

function A9X takes nothing returns nothing
local integer a=GetPlayerId(GetEnumPlayer())
call he[a].getxp(GetTriggerUnit())
endfunction

function buy takes nothing returns nothing
local integer a=GetPlayerId(GetOwningPlayer(GetBuyingUnit()))
call he[a].buy(GetSellingUnit(),GetSoldItem())
endfunction

function rideover takes nothing returns nothing
local integer a=GetPlayerId(GetTriggerPlayer())
call he[a].rideover()
endfunction

function gohome takes nothing returns nothing
local timer t=GetExpiredTimer()
local integer h=GetHandleId(t)
local integer a=LoadInteger(H,h,StringHash("hero"))
call DestroyTimer(t)
call FlushChildHashtable(H,h)
call he[a].gohome()
set t=null
endfunction

function statup takes nothing returns nothing
local integer a = GetPlayerId(GetTriggerPlayer())
set mob[a].lvl=GetUnitLevel(mob[a].u)
call he[a].stat()
endfunction

//pet
function petdeath takes nothing returns nothing
local integer a=GetPlayerId(GetOwningPlayer(GetTriggerUnit()))
local integer h=GetHandleId(GetTriggerUnit())
set mob[a+10].b=false
set mob[a+20].combat=false
call FlushChildHashtable(H,h)
call herodeath(GetTriggerUnit(),a)
endfunction

//mob
function mobdie takes nothing returns nothing
local integer x = GetPlayerId(GetOwningPlayer(GetKillingUnit()))
local integer i=lh(GetTriggerUnit(),"index")
call fh(GetTriggerUnit())
if i>0 then
call mob[i].mobdie(x)
endif
endfunction


//===========================================================================
// hero
//===========================================================================


function dummy takes integer a,unit v returns nothing
set ub=CreateUnit(Player(a),'e000',GetUnitX(v),GetUnitY(v),0)
call UnitApplyTimedLife(ub, 'BHwe', 1.00 )
call ShowUnit(ub, false)
endfunction


function heroevent takes unit u returns nothing
call TriggerRegisterUnitEvent(damageinit, u, EVENT_UNIT_DAMAGED )
call TriggerRegisterUnitEvent(herorez, u, EVENT_UNIT_DEATH )
call TriggerRegisterUnitEvent(itemword, u, EVENT_UNIT_USE_ITEM )
call TriggerRegisterUnitEvent(cooard,u , EVENT_UNIT_ISSUED_POINT_ORDER )
call TriggerRegisterUnitEvent(clickgear,u , EVENT_UNIT_ISSUED_POINT_ORDER )
call TriggerRegisterUnitEvent(hostdata, u, EVENT_UNIT_SPELL_EFFECT )
call TriggerRegisterUnitEvent(startcast,u, EVENT_UNIT_SPELL_CHANNEL )
//call TriggerRegisterUnitEvent(endcast, u, EVENT_UNIT_SPELL_ENDCAST )
call TriggerRegisterUnitEvent(ai,u, EVENT_UNIT_PICKUP_ITEM)
call TriggerRegisterUnitEvent(herolvl, u, EVENT_UNIT_HERO_LEVEL )
call TriggerRegisterUnitEvent(sellitem, u, EVENT_UNIT_PAWN_ITEM )
call TriggerRegisterUnitEvent(di, u, EVENT_UNIT_DROP_ITEM )
endfunction



function pickhero takes nothing returns nothing
local integer h=GetHandleId(GetClickedButton())
local integer k=LoadInteger(H,h,0)
local player p=GetTriggerPlayer()
local integer a=GetPlayerId(p)
local unit u
local integer m=li("unitid",k)
local integer j=0
local integer c=0
local integer x=0
local integer y=0
set la=GetStartLocationLoc(GetPlayerStartLocation(Player(0)))
set x=R2I(GetLocationX(la))
set y=R2I(GetLocationY(la))

        set j = 0
        loop
        exitwhen j >sys.bag
        set c=20*j+a
        if bag[c].b then
        call fh(bag[c].it)
        call RemoveItem(bag[c].it)
        set bag[c].b=false
        set bag[c].it=null
        endif
        set j=j+1
        endloop
set u=CreateUnit(p,m,x,y,0)
call DisableTrigger(ai)
set bag[a].it = CreateItem('I00K', GetUnitX(u), GetUnitY(u))
call sh(bag[a].it,"order",9000)
set bag[a].b=true
call UnitAddItem(u, bag[a].it)
set bag[a+20].it = CreateItem('I00R', GetUnitX(u), GetUnitY(u))
call sh(bag[a+20].it,"order",9001)
set bag[a+20].b=true
call UnitAddItem(u, bag[a+20].it)
call EnableTrigger(ai)
call mob[a].born(u)
call he[a].born(u)
set mob[a].x=x
set mob[a].y=y
set ia=a
call heroevent(u)
set skillid[a]=LoadInteger(H,StringHash("skillid0"),k)
set he[a].skillnum0=1
set skilllevel[a]=1
call PanCameraToTimedForPlayer(p,GetUnitX(u),GetUnitY(u),0)
call SelectUnitForPlayerSingle(u, p )
call SetCameraFieldForPlayer( Player(a), CAMERA_FIELD_TARGET_DISTANCE, 2000.00, 0 )
call he[a].stat()
set p=null
set u=null
endfunction

function herorev takes nothing returns nothing
local timer t=GetExpiredTimer()
local integer h=GetHandleId(t)
local integer a=LoadInteger(H,h,StringHash("deatha"))
call ReviveHero(mob[a].u,mob[a].x, mob[a].y, true )
set mob[a].b=true
call SetUnitLifePercentBJ(mob[a].u, 30.00 )
call SetUnitManaPercentBJ(mob[a].u, 30.00 )
call RemoveUnit(he[a].corpse)
call DestroyTimer(t)
call DestroyTimerDialog(he[a].td)
call FlushChildHashtable(H,h)
set t=null
endfunction

function herodie takes nothing returns nothing
local unit u=GetTriggerUnit()
local integer a=GetPlayerId(GetOwningPlayer(u))
local integer j
set he[a].revive=CreateTimer()
call sh(he[a].revive,"deatha",a)
call TimerStart(he[a].revive,30,false,function heroreviv)
set he[a].td= CreateTimerDialog(he[a].revive)
call TimerDialogSetTitle(he[a].td, "time to revive")
if (GetLocalPlayer() == Player(a)) then
    call TimerDialogDisplay(he[a].td, true)
endif
set he[a].corpse=CreateUnit(Player(a),'n02V',GetUnitX(u),GetUnitY(u),0)
call TriggerRegisterUnitEvent(hostdata, he[a].corpse, EVENT_UNIT_SPELL_EFFECT )
set mob[a].b=false
call DisplayTextToPlayer(Player(a),.5,0,text[19])
call mobheal(GetKillingUnit(),GetTriggerUnit())
set u=null
endfunction

endlibrary


//quest
struct quesx
integer x=0
integer y=0
integer s=0
quest q
questitem qi
effect new
effect old

method born takes integer a returns nothing
local string r
local integer k
set q=CreateQuest()
set qi=QuestCreateItem(q)
call QuestSetIconPath(q, "ReplaceableTextures\\CommandButtons\\BTNAmbush.blp")
call QuestSetRequired(q, true)
call QuestSetDiscovered(q, true)
call QuestSetCompleted(q, false)
call QuestItemSetCompleted(qi, false)
    set r="(UN)"+"["+I2S(li("questlevel",x))
    if li("questclass",x)>0 then
    set r=r+"+"
    endif
    set r=r+"]"
    set r=ls("qcolor",a)+r+"|r "
    call QuestSetTitle(q, r+qcolor(ls("questtitle",x),x))
    call QuestSetDescription(q, qcolor(ls("questtip",x)+ls("questdesc",x),x))
    call QuestItemSetDescription(qi, qcolor("0/"+I2S(li("questnum",x)),x))
    set r=""
    if Player(a) == GetLocalPlayer() then
    set r = "Abilities\\Spells\\Other\\TalkToMe\\TalkToMe.mdl"
    endif
    set k=LoadInteger(H,StringHash("questgiver"),x)
    set new=AddSpecialEffectTarget(r, npc[k].u, "overhead")
endmethod

method start takes integer a returns nothing
local string r
local integer k

    set y=1
    call DestroyEffect(new)
    set r="["+I2S(li("questlevel",x))
    if li("questclass",x)>0 then
    set r=r+"+"
    endif
    set r=r+"]"
    set r=ls("qcolor",a)+r+"|r "
    call QuestSetTitle(q, r+qcolor(ls("questtitle",x),x))
    call DisplayTextToPlayer(Player(a),.5,0,r+qcolor(ls("questtitle",x),x))
    call DisplayTextToPlayer(Player(a),.5,0,qcolor(ls("questtip",x),x))
    
    set r=""
    if Player(a) == GetLocalPlayer() then
    set r = "Objects\\InventoryItems\\QuestionMark\\QuestionMark.mdl"
    endif
    set k=LoadInteger(H,StringHash("questanwser"),x)
    set old=AddSpecialEffectTarget(r, npc[k].u, "overhead")
    
    
    
    
call refresh(a)
endmethod

method load takes integer a returns nothing
local string r
local integer k
call QuestSetDescription(q, qcolor(ls("questtip",x)+ls("questdesc",x),x))
call QuestItemSetDescription(qi, qcolor(I2S(s)+"/"+I2S(li("questnum",x)),x))

if y==0 then
    set r="(UN)"+"["+I2S(li("questlevel",x))
    if li("questclass",x)>0 then
    set r=r+"+"
    endif
    set r=r+"]"
    set r=ls("qcolor",a)+r+"|r "
    call QuestSetTitle(q, r+qcolor(ls("questtitle",x),x))
    call DestroyEffect( old)
    set r=""
    if Player(a) == GetLocalPlayer() then
    set r = "Abilities\\Spells\\Other\\TalkToMe\\TalkToMe.mdl"
    endif
    set k=LoadInteger(H,StringHash("questgiver"),x)
    set new=AddSpecialEffectTarget(r, npc[k].u, "overhead")
endif
if y>0  then
    call DestroyEffect(new)
    set r="["+I2S(li("questlevel",x))
    if li("questclass",x)>0 then
    set r=r+"+"
    endif
    set r=r+"]"
    set r=ls("qcolor",a)+r+"|r "
    call QuestSetTitle(q, r+qcolor(ls("questtitle",x),x))
    set r=""
    if Player(a) == GetLocalPlayer() then
    set r = "Objects\\InventoryItems\\QuestionMark\\QuestionMark.mdl"
    endif
    set k=LoadInteger(H,StringHash("questanwser"),x)
    set old=AddSpecialEffectTarget(r, npc[k].u, "overhead")
if y==2 then
    call QuestSetCompleted(q, true)
    call QuestItemSetCompleted(qi, true)
endif
endif
endmethod



method refresh takes integer a returns nothing
call QuestItemSetDescription(qi, qcolor(I2S(s)+"/"+I2S(li("questnum",x)),x))
if s>=li("questnum",x) then
call DisplayTextToPlayer(Player(a),.5,0,qcolor(ls("questtitle",x)+text[20],x))
call done(a)
endif
endmethod

method done takes integer a returns nothing
    set y=2
    call QuestSetCompleted(q, true)
    call QuestItemSetCompleted(qi, true)
endmethod


method end takes integer a returns nothing
local string r
local integer k
    call DisplayTextToPlayer(Player(a),.5,0,qcolor(ls("questdone",x),x))
    set x=x+1
    set r="(UN)"+"["+I2S(li("questlevel",x))
    if li("questclass",x)>0 then
    set r=r+"+"
    endif
    set r=r+"]"
    set r=ls("qcolor",a)+r+"|r "
    call QuestSetTitle(q, r+qcolor(ls("questtitle",x),x))
    call QuestSetDescription(q, qcolor(ls("questtip",x)+ls("questdesc",x),x))
    call QuestSetCompleted(q, false)
    call QuestItemSetDescription(qi, qcolor("0/"+I2S(li("questnum",x)),x))
    call QuestItemSetCompleted(qi, false)
    call DestroyEffect( old)
    set r=""
    if Player(a) == GetLocalPlayer() then
    set r = "Abilities\\Spells\\Other\\TalkToMe\\TalkToMe.mdl"
    endif
    set k=LoadInteger(H,StringHash("questgiver"),x)
    set new=AddSpecialEffectTarget(r, npc[k].u, "overhead")
set y=0
set s=0
endmethod

method fail takes integer a returns nothing
    call QuestSetFailed( q, true )
    call QuestItemSetDescription(qi, qcolor("0/"+I2S(li("questnum",x)),x))
    call DisplayTextToPlayer(Player(a),.5,0,qcolor(ls("questtitle",x)+text[21],x))
set y=0
set s=0
endmethod
endstruct

struct sprite
unit u
boolean b=true
integer lvl
integer class
integer order
integer id
integer x
integer y
integer a
integer index
integer target=0
integer threat=0
boolean summon=false
boolean combat=false
integer hp
integer mp
integer armor
integer damage
integer spell
integer as
integer ms
real crit=0
real scrit=0
real dodge=0
real magic=0
real attack=1
real heal=1
group g=CreateGroup()

method born takes unit v returns nothing
local integer i=0
set u=v
set lvl=GetUnitLevel(v)
set id=GetUnitTypeId(v)
set class=li("unitclass",id)
set order=li("unitorder",id)
set x=R2I(GetUnitX(v))
set y=R2I(GetUnitY(v))
set a=GetPlayerId(GetOwningPlayer(v))
if class<=20 then
call BlzSetUnitName(u, mobcolor(class,ls("unitname",order)))
set armor=li("unitarmor",id)
call BlzSetUnitArmor(u,armor)
set damage=li("unitdamage",id)
call BlzSetUnitBaseDamage(u,damage/2,1)
call BlzSetUnitDiceNumber(u,R2I(SquareRoot(damage)),1)
call BlzSetUnitDiceSides(u,R2I(SquareRoot(damage)),1)
set as=lr("unitas",id)
call BlzSetUnitAttackCooldown(u,as,1)
set hp=li("unithp",id)
call BlzSetUnitMaxHP(u,hp)
set mp=li("unitmp",id)
call BlzSetUnitMaxMana(u,mp)
call SetUnitState(u,ConvertUnitState(0),hp)
call SetUnitState(u,ConvertUnitState(2),mp)
set dodge=li("unitdodge",id)
set magic=li("unitmagic",id)
call UnitAddAbility(u,'A05O')
call UnitAddAbility(u,'Awan')
if class==3 then
call UnitAddAbility(u,'A03R')
call UnitAddAbility(u,'A03U')
endif
if class==0 then
set i=li("mobskill",li("unitskill",id))
call UnitAddAbility(u,i)
call SetUnitAbilityLevel(u,i,lvl)
endif
endif
endmethod

method rev takes nothing returns nothing
if b==false then
set b=true
set u=CreateUnit(Player(a),id,x,y,0)
call sh(u,"index",index)
call born(u)
call mobevent(u)
call DestroyEffect( AddSpecialEffect("Abilities\\Spells\\Items\\AIil\\AIilTarget.mdl",x, y) )
if class==3 then
call DisplayTimedTextToForce( sys.team, 10.00, "|cffffff00" + GetUnitName(u) +  "|r " + text[22]  )
endif
endif
endmethod

method healthreat takes unit v,integer m returns nothing
local integer i=GetPlayerId(GetOwningPlayer(v))
if b then
if he[i].hero.combat then
call GroupAddGroup(he[i].hero.g,g)
set combat=true
set ia=a
set ic=m
set ua=u
call ForGroup(g,function addthx)
endif
endif
endmethod

method damathreat takes unit v,integer m returns nothing
local integer j=lh(v,"index")
local integer b=GetPlayerId(GetOwningPlayer(v))
local integer x=lt(j,a)
local integer i=0
if this.b then
if j>0 then
if b==23 then
set combat=true
set mob[j].combat=true
call GroupAddUnit(mob[j].g,u)
call GroupAddUnit(g,v)
set m=R2I(he[a].threat*m)
set m=lt(j,a)+m
call st(j,a,m)
call DisplayTextToForce(sys.team,ls("qcolor",a)+I2S(j)+":"+I2S(m))

if GetUnitAbilityLevel(v, 'B008') == 0 then
if mob[j].target==a then
set mob[j].threat=m
else
if m>mob[j].threat then
set mob[j].threat=m
set mob[j].target=a
endif
endif
set i=mob[j].target
call IssueTargetOrderById(v, 851983, he[i].hero.u )
endif
endif
endif
endif
endmethod

method dama takes unit v,real y,integer w returns nothing
local boolean c=false
local boolean d=false
local integer m=0


if w<3 then
if GetRandomReal(0,1)<dodge then
set d=true
endif
if GetRandomReal(0,1)<crit then
set y=2*y
set c=true
endif
else
if w==3 then
set y=y*(1-magic)
endif
if GetRandomReal(0,1)<scrit then
set y=2*y
set c=true
endif
endif

if y>1 then
set ph=false

if d==false then

if w==1 then
call UnitDamageTarget(u,v,y,true, false, ATTACK_TYPE_CHAOS, DAMAGE_TYPE_NORMAL, WEAPON_TYPE_WHOKNOWS)
endif

if w==2 then
call UnitDamageTarget(u,v,y,true, false, ATTACK_TYPE_CHAOS, DAMAGE_TYPE_ENHANCED, WEAPON_TYPE_WHOKNOWS)
endif

if w==3 then
call UnitDamageTarget(u,v,y,true, false,ATTACK_TYPE_NORMAL, DAMAGE_TYPE_LIGHTNING, WEAPON_TYPE_WHOKNOWS)
endif
        
if w==4 then
call UnitDamageTarget(u,v,y,true, false,ATTACK_TYPE_MAGIC, DAMAGE_TYPE_LIGHTNING, WEAPON_TYPE_WHOKNOWS)
endif
        
if w==5 then
call SetWidgetLife(v,GetWidgetLife(v)+y)
endif

if a<20 then
set m=R2I(y)
if w==5 then
set m=R2I(.2*m)
call healthreat(v,m)
endif
endif

if c then
if w==5 then
call floattext(R2I(y),u,1)
else
call floattext(R2I(y),u,0)
endif
endif
set ph=true
else
call floattext(0,u,2)//dodge
endif
endif
endmethod


method setdamage takes integer i returns nothing
call BlzSetUnitDiceNumber(u,R2I(SquareRoot(2*i)),1)
call BlzSetUnitDiceSides(u,R2I(SquareRoot(2*i)),1)
endmethod


method sethp takes integer i returns nothing
call BlzSetUnitMaxHP(u,i)
call SetUnitState(u,ConvertUnitState(0),i)

endmethod

method setmp takes integer i returns nothing
call BlzSetUnitMaxMana(u,i)
call SetUnitState(u,ConvertUnitState(2),i)
endmethod

method setas takes real r returns nothing
call BlzSetUnitAttackCooldown(u,r,1)
endmethod

method setarmor takes integer i returns nothing
call BlzSetUnitArmor(u,i)
endmethod


method mobdie takes integer x returns nothing
local integer b=0
local integer h=0
local integer d=0
local integer i = 0
local integer j=GetRandomInt(1, 100)
local timer t=CreateTimer()
local integer r=0
local integer n=0
local integer z=0
local integer w=0
local item it
local integer e=0
set combat=false
set threat=0
set target=-1
set this.b=false
call mobdeath(u,index)

set ia=0
set r=100
set w=lvl-1
set w=w/5

if class==3 then//boss
set ia = 50*lvl+450
set d=GetRandomInt(1,100)

if d>1 then
set b=2
endif

if w>6 then
if d==1 then
set b=3
endif
endif

set e=li("min"+I2S(b),id)
set z=li("max"+I2S(b),id)
set d=GetRandomInt(e,z)
set w=li("itemid",d)
set it=CreateItem(w,GetUnitX(u),GetUnitY(u))
call sh(it,"order",d)
call geardrop(d,it)
endif

if class==2 then//elite
set ia = 10*lvl+90
if j<=5 then
set d=GetRandomInt(1,100)
if d>1 then
set b=1
endif
if w>2 then
if d==1 then
set b=2
endif
endif
set e=li("min"+I2S(b),id)
set z=li("max"+I2S(b),id)
set d=GetRandomInt(e,z)
set w=li("itemid",d)
set it=CreateItem(w,GetUnitX(u),GetUnitY(u))
call sh(it,"order",d)
call geardrop(d,it)
endif
endif

if class==0 or class ==1 then//common
set ia = 5*lvl+45
if j<=5 then
set d=GetRandomInt(1,10)
if d>1 then
set b=0
endif
if d==1 then
set b=1
endif

set e=li("min"+I2S(b),w)
set z=li("max"+I2S(b),w)
set d=GetRandomInt(e,z)
set w=li("itemid",d)
set it=CreateItem(w,GetUnitX(u),GetUnitY(u))
call sh(it,"order",d)
call geardrop(d,it)
endif
endif

if summon==false then
set h=GetHandleId(t)
set r=LoadInteger(H,StringHash("respawn"),class)
call SaveInteger(H,h,StringHash("index"),index)
call TimerStart(t,r,false,function mobrev)
endif

//xp&gold

    set ra=1
    set ib=0
    call ForForce(sys.team, function A8X)
    if ib>1 then
    call DisplayTextToPlayer(Player(0),.5,0,I2S(ib))
    set ra=I2R(42-ib)/50
    call DisplayTextToPlayer(Player(0),.5,0,R2S(ra))
    call ForForce(sys.team, function A9X)
    else
    call ForForce(bj_FORCE_PLAYER[x], function A9X )
    endif
set t=null
set it=null
endmethod


endstruct


struct npx
unit u
integer index
integer x
integer y

method born takes unit v returns nothing
set u=v
call TriggerRegisterUnitEvent(npcpet,u, EVENT_UNIT_CHANGE_OWNER )
set x=li("npcx",index)*100
set y=li("npcy",index)*100
call sh(u,"index",index)
call BlzSetUnitName(u,ls("npcname",index))
endmethod


method rev takes nothing returns nothing
set u=CreateUnit(Player(27),li("npcid",index),x,y,0)
call born(u)
endmethod

endstruct


struct hex
integer a
integer id
player p
multiboard mb
multiboard gm
unit ghost
unit corpse
effect home
integer gold
integer lumber
integer food=0
integer xp
boolean save=false
boolean ride=false
boolean fly=false
boolean load=false//load
boolean esc=false
real healx=1//healed rate
real crits=0
real critx=0
real scrits=0
real scritx=0
integer barmor=0
integer bdamage=0
integer bspell=0
integer loads=0//loads
integer bagx=0
integer packx=0
integer mps=0
integer mpx=0
integer hpx=0
integer hps=0
integer rideskill
integer mss=0
integer msx=0
integer ass=0
integer asx=0
integer strx=0
integer agix=0
integer intx=0
integer strs=0
integer agis=0
integer ints=0
integer vers
integer stage=0
integer price=0
integer trade=0
integer petcost=0
integer damages=0
integer damagex=0
integer spells=0
integer spellx=0
integer armors=0
integer armorx=0
integer skin
integer regionx=-1
integer rectx=-1
integer typex
integer height=2000
integer timekey=GetRandomInt(100000,999999)
integer gametime=2000
integer petnum=0
integer petnow=0
integer skillnum=1
integer skillnum0=1
integer skillnum1=0
integer score=0
dialog pickhero
dialog confirm
dialog start
dialog data
boolean peton=false
integer class=0
timerdialog td=null
timer revive=null
integer choice=0
boolean init=true
fogmodifier fog


method born takes unit u returns nothing
set a=GetPlayerId(GetOwningPlayer(u))
set id=GetUnitTypeId(u)
set p=Player(a)
set barmor=li("unitarmor",id)
set bdamage=li("unitdamage",id)
set bspell=li("unitspell",id)
set typex=LoadInteger(H,StringHash("unittype"),id)
set class=mob[a].class
set damager=lr("damarate",id)
endmethod


method check takes  integer j  returns nothing
    if esc then
    call CinematicModeBJ( true, bj_FORCE_PLAYER[a] )
    call TransmissionFromUnitWithNameBJ( bj_FORCE_PLAYER[a], null, null, gg_snd_H01VillagerC35, LoadStr(H,StringHash("questmovie"),j), bj_TIMETYPE_SET, 10.00, true )
    call CinematicModeBJ( false, bj_FORCE_PLAYER[a] )
    endif
endmethod


method buy takes unit m,item it returns nothing
    local integer n=0
    local integer i=0
    local integer j=0
    local integer z=GetItemTypeId(it)
    local integer k=0
    local string s
    local string r
    local integer x
    local integer y
    local integer b=0
    local integer c=0
    local texttag tt=null
    local item v
    local location l = GetUnitLoc(mob[a].u)
    call SetUnitFacingToFaceLocTimed(m, l, .5)
    call RemoveLocation(l)
    set l=null
    if GetItemType(it) == ConvertItemType(4) or GetItemLevel(it)==1 then
    set x=li("itemorder",z)
    set i=li("cost",x)
    if gold>=i then
    set gold=gold-i
    if GetItemLevel(it)==1 then
    call SetPlayerState(p, ConvertPlayerState(1), GetPlayerState(p,ConvertPlayerState(1))-i)
    endif
    call sh(it,"order",x)
    else
    call DisplayTextToPlayer(p,.5,0,text[23]+I2S(i)+text[24])   
    call DisableTrigger(di)
    call RemoveItem(it)
    call EnableTrigger(di)
    endif
    endif
    
    if GetItemType(it) == ITEM_TYPE_POWERUP then    
    
    if GetWidgetLife(it)==70 then
    set ua=GetSellingUnit()
    call ForForce(sys.team,function party)
    endif
    
    if GetWidgetLife(it)==80 then
    if mob[a].class==24 then
    set y=GetHandleId(mob[a+20].u)
    call FlushChildHashtable(H,y)
    call RemoveUnit(mob[a+20].u)    
    set x=0
    loop
    exitwhen x>2
    set petid[20*x+a]=0
    set pet.b=false
    set peton=false
    set x=x+1
    endloop
    set petnum=0
    call DisplayTextToPlayer(p,.5,0,text[25])
    endif
    endif
    
    if GetWidgetLife(it)==50 then
    if z=='I01Y' then
    if mob[a].lvl>=40 then
    if lumber>=10 then
    if rideskill<1 then
    set rideskill=1
    call SetPlayerAbilityAvailable(p,'A053',true)
    call SetPlayerState(p, ConvertPlayerState(2), GetPlayerState(p,ConvertPlayerState(2))-10)
    set lumber=lumber-10
    else
    call DisplayTextToPlayer(p,.5,0,text[26])
    endif
    else
    call DisplayTextToPlayer(p,.5,0,text[27])
    endif
    else
    call DisplayTextToPlayer(p,.5,0,text[28])
    endif
    endif
    
    if z=='I01Z' then
    if mob[a].lvl>=60 then
    if lumber>=100 then
    if rideskill<2 then
    set rideskill=2
    call SetPlayerState(p, ConvertPlayerState(2), GetPlayerState(p,ConvertPlayerState(2))-100)
    set lumber=lumber-100
    else
    call DisplayTextToPlayer(p,.5,0,text[26])
    endif
    else
    call DisplayTextToPlayer(p,.5,0,text[29])
    endif
    else
    call DisplayTextToPlayer(p,.5,0,text[30])
    endif
    endif
    endif
    
    if GetWidgetLife(it)==60 then
    set x=petid[petnow*20+a]
    set y=li("unitid",x)
    if class==24 then
    set k=GetHandleId(mob[a+20].u)
    call FlushChildHashtable(H,k)
    call RemoveUnit(mob[a+20].u)
    if x>0 then
    set mob[a+20].u=CreateUnit(p,y,GetUnitX(mob[a].u),GetUnitY(mob[a].u),0)
    set pet.b=true
    set peton=true
    call pet.born(mob[a+20].u)
    call TriggerRegisterUnitEvent(petrez, mob[a+20].u, EVENT_UNIT_DEATH )
    call TriggerRegisterUnitEvent(damageinit, mob[a+20].u, EVENT_UNIT_DAMAGED )
    call TriggerRegisterUnitEvent(mobcast,mob[a+20].u,EVENT_UNIT_SPELL_EFFECT)
    call UnitAddAbility(mob[a+20].u,'A402')
    call UnitAddAbility(mob[a+20].u,'A403')
    call UnitAddAbility(mob[a+20].u,'Aeth')
    call BlzSetUnitArmor(mob[a+20].u,0)

    if IsUnitType(mob[a+20].u, UNIT_TYPE_ANCIENT) == true then
    call UnitRemoveType(mob[a+20].u, UNIT_TYPE_ANCIENT )
    endif
    call DestroyEffect( AddSpecialEffectTarget("Abilities\\Spells\\Human\\ReviveHuman\\ReviveHuman.mdl", mob[a+20].u, "origin") )
    call DisplayTextToPlayer(p,.5,0,text[31])
    else
    set pet.b=false
    set peton=false
    call DisplayTextToPlayer(p,.5,0,text[32])
    endif
    if petnow<2 then
    set petnow=petnow+1
    else
    set petnow=0
    endif
    else
    call DisplayTextToPlayer(p,.5,0,text[33])
    endif    
    endif
    
    
    if GetWidgetLife(it)==30 then
    if gold>=20*k then
    call SetPlayerState(p, ConvertPlayerState(1), GetPlayerState(p,ConvertPlayerState(1))-20*k)
    set gold=gold-20*mob[a].lvl
    set k=li("flightpoint",z)
    set bj_lastCreatedUnit=CreateUnit(Player(9),'h00I',GetUnitX(GetSellingUnit()),GetUnitY(GetSellingUnit()),0)
    set x=GetHandleId(bj_lastCreatedUnit)
    call SaveInteger(H,x,StringHash("fly"),a)
    call SaveInteger(H,x,StringHash("flyto"),k)
    call RemoveGuardPosition(bj_lastCreatedUnit)
    call IssuePointOrderById(bj_lastCreatedUnit, 851986, GetRectCenterX(flyrect[k]),GetRectCenterY(flyrect[k]))
    call ShowUnit(mob[a].u,false)
    set fly=true
    call SetCameraTargetControllerNoZForPlayer(p, bj_lastCreatedUnit, 0, 0, false )
    call SetCameraFieldForPlayer(p, CAMERA_FIELD_TARGET_DISTANCE, 3000.00, 0 )    
    else
    call DisplayTextToPlayer(p,.5,0,text[23]+I2S(20*k)+text[34])   
    endif
    endif
    
    
    if GetWidgetLife(it)==10 then
    if LoadInteger(H,StringHash("herotype"),z)==class then
    set j=LoadInteger(H,StringHash("skillorder"),z)
    set b=li("learnskill",z)
    set x=LoadInteger(H,StringHash("skilltype"),z)
    set k=0
    set i=0
    loop
    exitwhen i>5
    if j==skillid[20*i+a] then
    set k=1
    set y=skilllevel[20*i+a]
    if x==5 then
    if mob[a].lvl>=y*x then
    if gold >=100*(y+1) then
    call IncUnitAbilityLevel(mob[a].u, b )
    set skilllevel[20*i+a]=y+1
    call DisplayTextToPlayer(p,.5,0,text[35])
    call SetPlayerState(p, ConvertPlayerState(1), GetPlayerState(p,ConvertPlayerState(1))-100*(y+1))
    set gold=gold-100*(y+1)
    else
    call DisplayTextToPlayer(p,.5,0,text[23]+I2S(100*(y+1))+text[36])   
    endif
    else
    if y==13 then
    call DisplayTextToPlayer(p,.5,0,text[37])
    else
    call DisplayTextToPlayer(p,.5,0,text[38]+I2S(x*y)+text[39])
    endif
    endif
    endif
    if x==10 then
    if mob[a].lvl==(y+1)*x then
    if gold >=1000*(y+1) then
    call IncUnitAbilityLevel(mob[a].u,b)
    set skilllevel[20*i+a]=y+1
    call DisplayTextToPlayer(p,.5,0,text[35])
    call SetPlayerState(p, ConvertPlayerState(1), GetPlayerState(p,ConvertPlayerState(1))-1000*(y+1))
    set gold=gold-1000*(y+1)
    else
    call DisplayTextToPlayer(p,.5,0,text[23]+I2S(1000*(y+1))+text[36])   
    endif
    else
    if y==6 then
    call DisplayTextToPlayer(p,.5,0,text[37])
    else
    call DisplayTextToPlayer(p,.5,0,text[38]+I2S(x*(y+1))+text[39]) 
    endif
    endif
    endif
    endif
    set i=i+1
    endloop
    if k==0 then
    if x==5 then
    if skillnum0==4 then
    call DisplayTextToPlayer(p,.5,0,text[40])
    else
    if gold >=100 then
    call UnitAddAbility(mob[a].u,b)
    set skillnum=skillnum0+skillnum1
    set skillid[20*skillnum+a]=j
    set skilllevel[20*skillnum+a]=1
    set skillnum0=skillnum0+1
    call DisplayTextToPlayer(p,.5,0,text[41])
    call SetPlayerState(p, ConvertPlayerState(1), GetPlayerState(p,ConvertPlayerState(1))-100)
    set gold=gold-100
    else
    call DisplayTextToPlayer(p,.5,0,text[42])    
    endif
    endif
    endif
    if x==10 then
    if skillnum1==2 then
    call DisplayTextToPlayer(p,.5,0,text[43])
    else
    if mob[a].lvl>=10 then
    if gold >=1000 then
    call UnitAddAbility(mob[a].u,b)
    set skillnum=skillnum0+skillnum1
    set skillid[20*skillnum+a]=j
    set skilllevel[20*skillnum+a]=1
    set skillnum1=skillnum1+1
    call DisplayTextToPlayer(p,.5,0,text[41])
    call SetPlayerState(p, ConvertPlayerState(1), GetPlayerState(p,ConvertPlayerState(1))-1000)
    set gold=gold-1000
    else
    call DisplayTextToPlayer(p,.5,0,text[44])
    endif
    else
    call DisplayTextToPlayer(p,.5,0,text[45])
    endif
    endif
    endif
    endif
    else
    call DisplayTextToPlayer(p,.5,0,text[46])
    endif
    endif

    if GetWidgetLife(it)==20 then
    set j=0
    loop
    exitwhen j>4
    set c=20*j+a
    if qu[c].y==2 then
    set i=li("questanwser",qu[c].x)
    if npc[i].u==m then
    set x=li("questclass",qu[c].x)+1
    if mob[a].lvl<60 then
    set k=LoadInteger(H,StringHash("questlevel"),qu[c].x)*100*x
    if li("questlevel",qu[c].x)-1>mob[a].lvl then
    set k=k*3/2
    endif
    call AddHeroXP(mob[a].u,k,true)
   
    set xp=xp+k
    set s = I2S(k)
    set tt = CreateTextTagUnitBJ( s, mob[a].u, 0, 15.00, 0.00, 100, 0.00, 0 )
    call SetTextTagPermanent( tt, false )
    call SetTextTagLifespan( tt, 2.00 )
    call SetTextTagVelocityBJ( tt, 64, 135.00 )
    endif
    set k=li("questlevel",qu[c].x)*10*x
    set gold=gold+k
    set s = I2S(k)
    set tt = CreateTextTagUnitBJ( s, mob[a].u, 0, 15.00, 100, 100, 0.00, 0 )
    call SetTextTagPermanent( tt, false )
    call SetTextTagLifespan( tt, 2.00 )
    call SetTextTagVelocityBJ( tt, 64, 45.00 )
    // queststatus-0finished 1accepted 2completed
    call AdjustPlayerStateBJ(k, p, PLAYER_STATE_RESOURCE_GOLD )
    //call PlaySoundBJ()
    set k=LoadInteger(H,StringHash("questaward"),qu[c].x)
    if k==1 then
    set y=LoadInteger(H,StringHash("questlevel"),qu[c].x)
    set y=y-1
    set y=(y-ModuloInteger(y,5))/5
    set k=li("min"+I2S(x-1),y)
    set n=li("max"+I2S(x-1),y)
    set y=GetRandomInt(k,n)
    set k=li("itemid",y)
    set v=CreateItem(k,GetUnitX(mob[a].u),GetUnitY(mob[a].u))
    set x=GetHandleId(v)
    call SaveInteger(H,x,StringHash("order"),y)
    call UnitAddItem(mob[a].u,v)        
    call DisplayTextToPlayer(p,.5,0,text[47])
    call geardrop(y,v)
    endif
    call qu[c].end(a)
    endif
    endif    
    
    
    if qu[c].y==1 then
    set i=li("questgiver",qu[c].x)
    if npc[i].u==m then
    if li("questtype",qu[c].x)==1 then
    call DisplayTextToPlayer(p,.5,0,qcolor(ls("questback",qu[c].x),qu[c].x))
    endif
    if li("questtype",qu[c].x)==2 then
    set ia=2
    set x=li("qxy",j)
    if IsUnitInRangeXY(GetSellingUnit(), qx[x], qy[x], 300) == true then
    set qu[c].y=2
    set qu[c].s=1
    call qu[c].refresh(a)
    else
    set k=lh(GetSellingUnit(),"index")
    call SetUnitOwner(GetSellingUnit(), Player(20), true )
    call RemoveGuardPosition(GetSellingUnit())
    set x=li("qxy",j)
    call IssuePointOrder( GetSellingUnit(), "attack", qx[x], qy[x] )
    endif
    else
    if li("questtype",qu[c].x)==3 then
    set ia=2
    set k=lh(GetSellingUnit(),"index")
    call SetUnitOwner(GetSellingUnit(), Player(24), true )
    endif
    endif
    endif    
    endif    
    
    if qu[c].y==0 then
    set i=li("questgiver",qu[c].x)
    if npc[i].u==m then
    call qu[c].start(a)
    endif
    endif
    //0 kill mob
    //1 gather
    //2 escort
    //3 duel
    
    set j = j + 1
    endloop
    call mbupdate()
    endif
    
    
    
    
    if z=='I006' then
    set mob[a].x=R2I(GetUnitX(mob[a].u))
    set mob[a].y=R2I(GetUnitY(mob[a].u))
    call DisplayTextToPlayer(p,.5,0,text[48])
    endif

/*
if z=='I0OH' then
set k=0
set zz=GetStartLocationLoc(GetPlayerStartLocation(Player(1)))
set x=R2I(GetLocationX(zz))
set y=R2I(GetLocationY(zz))
call RemoveLocation(zz)
set j=0
loop
exitwhen j>4
set c=20*j+a
if qu[c].x>=li("qmin"+I2S(j),sys.map) then
set k=k+1
endif
set j=j+1
endloop
if k==5 then
call DisplayTextToPlayer(p,.5,0,text[49])
call SetUnitPosition(mob[a].u,x,y)
call SetUnitPosition(mob[a+20].u,x,y)
call PanCameraToTimedForPlayer(p,x,y,0)
set mob[a].x=x
set mob[a].y=y
else
call DisplayTextToPlayer(p,.5,0,text[50])
endif
endif
*/    

    call DisableTrigger(di)
    call FlushChildHashtable(H,h2i(it))
    call RemoveItem(it)
    call EnableTrigger(di)
    endif
    call money()
set v=null
set tt=null
endmethod


method sellgear takes integer i returns nothing
local integer k=li("cost",i)
local integer j=li("itemclass",i)
local integer m=li("price",j)*10
local integer x=0
if m>0 then
set x=k/m
endif
set gold=gold+x
call SetPlayerState(p, ConvertPlayerState(1), GetPlayerState(p, ConvertPlayerState(1))+x)
    set bj_lastCreatedTextTag=CreateTextTagUnitBJ(I2S(x), GetSellingUnit(), 0, 15.00, 100.00, 100, 0.00, 0 )
    call SetTextTagPermanent(bj_lastCreatedTextTag, false )
    call SetTextTagLifespan(bj_lastCreatedTextTag, 2.00 )
    call SetTextTagVelocityBJ(bj_lastCreatedTextTag, 64, 30.00 )
    call money()
endmethod

method money takes nothing returns nothing
if gold < 4000000 and lumber > 0 then
call SetPlayerState(p, ConvertPlayerState(1), GetPlayerState(p, ConvertPlayerState(1)) + 100000)
call SetPlayerState(p, ConvertPlayerState(2), GetPlayerState(p, ConvertPlayerState(2)) -1)
set lumber=lumber-1
set gold=gold+100000
endif
if gold >8000000 then
call SetPlayerState(p, ConvertPlayerState(1), GetPlayerState(p, ConvertPlayerState(1)) - 100000)
call SetPlayerState(p, ConvertPlayerState(2), GetPlayerState(p, ConvertPlayerState(2)) +1)
set lumber=lumber+1
set gold=gold-100000
endif
endmethod

method mbupdate takes nothing returns nothing
    call MultiboardSetItemValue( MultiboardGetItem(mb, 0, 1),GetPlayerName(p))
    call MultiboardSetItemValue( MultiboardGetItem(mb, 1, 1),I2S(mob[a].damage))   
    call MultiboardSetItemValue( MultiboardGetItem(mb, 2, 1),I2S(mob[a].spell))
    call MultiboardSetItemValue( MultiboardGetItem(mb, 3, 1),R2S(100*mob[a].crit)+"%")
    call MultiboardSetItemValue( MultiboardGetItem(mb, 4, 1),R2S(100*mob[a].scrit)+"%")
    call MultiboardSetItemValue( MultiboardGetItem(mb, 5, 1),I2S(mob[a].as)+"%")
    call MultiboardSetItemValue( MultiboardGetItem(mb, 6, 1),I2S(mob[a].ms))
    call MultiboardSetItemValue( MultiboardGetItem(mb, 7, 1),I2S(timekey))
    call MultiboardSetItemValue( MultiboardGetItem(mb, 8, 1),I2S(gametime)+" m")
    call MultiboardSetItemValue( MultiboardGetItem(mb, 9, 1),I2S(stage))
    call MultiboardSetItemValue( MultiboardGetItem(mb, 10, 1),I2S(li("ridespeed",rideskill))+"%")
    call MultiboardSetItemValue( MultiboardGetItem(mb, 11, 1),I2S(score))
    call MultiboardSetItemValue( MultiboardGetItem(mb, 12, 1),I2S(trade))
    call MultiboardSetItemValue( MultiboardGetItem(mb, 13, 1),I2S(petcost))
    call MultiboardSetItemValue( MultiboardGetItem(mb, 14, 1),I2S(qu[a].x))
    call MultiboardSetItemValue( MultiboardGetItem(mb, 15, 1),I2S(qu[20+a].x))
    call MultiboardSetItemValue( MultiboardGetItem(mb, 16, 1),I2S(qu[40+a].x))
    call MultiboardSetItemValue( MultiboardGetItem(mb, 17, 1),I2S(qu[60+a].x))
    call MultiboardSetItemValue( MultiboardGetItem(mb, 18, 1),I2S(qu[80+a].x))
endmethod

method clearbag takes nothing returns nothing
local integer i=0
local integer c=0
call DisableTrigger(di)
if bagx==0 then
set i=0
loop
exitwhen i>sys.bag
set c=20*i+a
if bag[c].b then
call SetItemPosition(bag[c].it, 0, 0)
call SetItemVisible(bag[c].it,false)
endif
set i=i+1
endloop
endif

if bagx==1 then
set i=0
loop
exitwhen i>sys.gear
set c=20*i+a
if gear[c].b then
        call SetItemPosition(gear[c].it, 0, 0)
        call SetItemVisible(gear[c].it,false)
endif
set i=i+1
endloop
endif

if bagx==2 then
set i=6*packx
loop
exitwhen i>6*packx+5
set c=i*20+a
if pack[c].b then
        call SetItemPosition(pack[c].it, 0, 0)
        call SetItemVisible(pack[c].it,false)
endif
set i=i+1
endloop
endif
call EnableTrigger(di)
endmethod

method action takes integer b returns nothing
local integer i=0
local integer j=0
local integer m=0
local unit v=null
local timer t
local integer c=0

if GetSpellAbilityId() == 'A056' then
if GetLocalPlayer()==p then
call MultiboardDisplay(he[b].mb, true)
endif
endif

if GetSpellAbilityId() == 'A057' then
set i=0
loop
exitwhen i > 5
set j=skillid[20*i+a]
set j=LoadInteger(H,StringHash("skillid"),j)
call UnitRemoveAbility(mob[a].u,j)
set skillid[20*i+a]=0
set skilllevel[20*i+a]=0
set i=i+1
endloop
set skillnum0=0
set skillnum1=0
call DisplayTextToPlayer(p,.5,0,text[49])
endif


if GetSpellAbilityId() == 'A051' then
set m=GetDestructableTypeId(GetSpellTargetDestructable())
set i=0
loop
exitwhen i > 4
set c=20*i+a
set j=qu[c].x
if li("questtype",j)==1 then
if LoadInteger(H,StringHash("destorder"),m)==li("questtarget",j) then
if qu[c].y==1 then
call KillDestructable(GetSpellTargetDestructable())
if qu[c].s<LoadInteger(H,StringHash("questnum"),j) then
if LoadInteger(H,StringHash("questdrop"),j)>0 then
if GetRandomInt(1,100)<=LoadInteger(H,StringHash("questdrop"),j) then
set qu[c].s=qu[c].s+1
call qu[c].refresh(a)
call DisplayTextToPlayer(p,.5,0,qcolor(text[50]+LoadStr(H,StringHash("questitem"),j)+" "+I2S(qu[c].s)+"/"+I2S(LoadInteger(H,StringHash("questnum"),j)),j))
endif
else
set qu[c].s=qu[c].s+1
call qu[c].refresh(a)
endif
endif
endif
endif
endif
set i=i+1
endloop
endif

set i=0
loop 
exitwhen i>4

set j=li("qtip",i)
if GetSpellAbilityId() == j then
set m=mob[a].lvl*50
if he[a].gold>=m then
set he[a].gold=he[a].gold-m
call SetPlayerState(p, ConvertPlayerState(1), GetPlayerState(p, ConvertPlayerState(1))-m)
set c=20*i+a
if qu[c].y==0 then
set j=li("questgiver",qu[c].x)
if GetLocalPlayer()==p then
call PlaySoundBJ( gg_snd_MapPing )
call PingMinimap(npc[j].x, npc[j].y, 10)
endif
endif
if qu[c].y==2 then
set j=li("questanwser",qu[c].x)
if GetLocalPlayer()==p then
call PlaySoundBJ( gg_snd_MapPing )
call PingMinimap(npc[j].x, npc[j].y, 10)
endif
endif
if qu[c].y==1 then
set j=li("questtipx",qu[c].x)
if GetLocalPlayer()==p then
call PlaySoundBJ( gg_snd_MapPing )
call PingMinimap(li("qx",qu[c].x), li("qy",qu[c].x), 10)
endif
endif
else
call DisplayTextToPlayer(p,.5,0,text[23]+I2S(m)+text[51])
endif
endif
set i=i+1
endloop


if GetSpellAbilityId() == 'A053' then
set ride=true
set v=CreateUnit(Player(24),'e000',GetUnitX(mob[a].u),GetUnitY(mob[a].u),0 )
call UnitApplyTimedLife(v, 'BHwe', 2.00 )
call ShowUnit(v, false)
if rideskill==1 then
call UnitAddAbility(v, 'A059' )
endif
if rideskill==2 then
call UnitAddAbility(v, 'A058' )
endif
call IssuePointOrderById(v, 852592, GetUnitX(mob[a].u),GetUnitY(mob[a].u) )
endif

if GetSpellAbilityId() == 'A052' then
set t=CreateTimer()
set i=GetHandleId(t)
call SaveInteger(H,i,StringHash("hero"),a)
call TimerStart(t,0.1,false,function gohome)
endif

if GetSpellAbilityId() == 'A036' then
if height>3500 then
set height=1500
else
set height=height+500
endif
call SetCameraFieldForPlayer( p, CAMERA_FIELD_TARGET_DISTANCE,height, 0 )
call DisplayTextToPlayer(p,.5,0,text[52]+I2S(height))
endif

if GetSpellAbilityId() == 'A05Q' then
if esc then
set esc=false
call DisplayTextToPlayer(p,.5,0,text[53])
else
set esc=true
call DisplayTextToPlayer(p,.5,0,text[54])
endif
endif

if GetSpellAbilityId() == 'A038' then
call clearbag()
call DisableTrigger( ai )
if bagx!=0 then
set i=0
loop
exitwhen i>sys.bag
set c=20*i+a
if bag[c].b then
call UnitAddItem(mob[a].u, bag[c].it)
endif
set i=i+1
endloop
call DisplayTextToPlayer(p,.5,0,text[55])
endif

if bagx==0 then
set i=0
loop
exitwhen i>sys.gear
set c=20*i+a
if gear[c].b then
call UnitAddItem(mob[a].u, gear[c].it)
endif
set i=i+1
endloop
call DisplayTextToPlayer(p,.5,0,text[56])
endif

if bagx!=0 then
set bagx=0
else
set bagx=1
endif

call EnableTrigger( ai )
endif

if GetSpellAbilityId() == 'A039' then
call clearbag()
call DisableTrigger( ai )

if bagx==2 then
if packx==4 then
set packx=0
else
set packx=packx+1
endif
endif

if bagx!=2 then
set bagx=2
endif

set i=6*packx
loop
exitwhen i>5+6*packx
set c=20*i+a
if pack[c].b then
call UnitAddItem(mob[a].u, pack[c].it)
endif
set i=i+1
endloop
call DisplayTextToPlayer(p,.5,0,text[57]+I2S(packx))



call EnableTrigger( ai )
endif

set t=null
set v=null
endmethod


method getitem takes item it returns nothing
    local integer h=GetHandleId(it)
    local integer y=LoadInteger(H,h,StringHash("order"))
    local integer m=GetItemTypeId(it)
    local integer n=GetItemLevel(it)
    local boolean bbc=true
    local integer i=0
    local integer x=0
    local integer c=0
    local integer e=li("itemlevel",y)
    local integer f=li("itemclass",y)
    local integer j=e*5+f+1
    //0 bag
    //1 gear
    //2 pack
    call DisableTrigger(di)   
    if n==0 then
    if GetItemType(it) == ConvertItemType(4)  then
        set i=0
        loop
        exitwhen i > sys.bag
        set c=20*i+a
        if bag[c].b  then
        if GetItemTypeId(bag[c].it)==m  then
        set bbc=false
        call SetItemCharges(bag[c].it,GetItemCharges(bag[c].it)+GetItemCharges(it))
        call fh(it)
        call RemoveItem(it)
        call EnableTrigger(di)
        return
        endif
        else
        set bbc=false
        set bag[c].b=true
        set bag[c].it=it
        if bagx!=0 then
        call SetItemPosition(it, 0, 0)
        call SetItemVisible(it,false)
        endif
        call EnableTrigger(di)        
        return
        endif
    set i=i+1
    endloop
    if bbc then
    call UnitRemoveItem(mob[a].u, it)
    call DisplayTextToPlayer(p,.5,0,text[58])
    endif
    endif
    endif

if n>0 then

            if bagx==0 then
            set i=0
            loop
                exitwhen i > sys.pack
                set c=20*i+a
                    if pack[c].b==false then
                    set bbc=false
                    set pack[c].it=it
                    set pack[c].b=true               
                    call SetItemPosition(it, 0,0 )
                    call SetItemVisible(it, false)
                    call EnableTrigger(di)
                    return
                    endif
            set i = i + 1
            endloop
            endif
            
            if bagx==1 then
            set bbc=false           
            set x=LoadInteger(H,StringHash("itemtype"),y)
            set c=20*x+a
            if gear[c].b then
            call UnitRemoveItem(mob[a].u, it)
            call DisplayTextToPlayer(p,.5,0,text[59])
            else
            if  j<=hero.lvl then
            set x=LoadInteger(H,StringHash("weapontype"),y)
            if x==1 then
            if class !=21 then
            call UnitRemoveItem(mob[a].u, it)
            call DisplayTextToPlayer(p,.5,0,text[114])
            else
            set gear[c].b=true
            set gear[c].it=it
            call stat()
            endif
            else
            set gear[c].b=true
            set gear[c].it=it
            call stat()
            endif
            else
            call UnitRemoveItem(mob[a].u, it)
            call DisplayTextToPlayer(p,.5,0,text[113])
            endif
            endif
            call EnableTrigger(di)
            return
            endif
            
            if bagx==2 then
            set i=packx*6
            loop
                exitwhen i > packx*6+5
                set c=20*i+a
                    if pack[c].b==false then                    
                    set bbc=false
                    set pack[c].it=it
                    set pack[c].b=true
                    call EnableTrigger(di)
                    return
                endif
                set i = i + 1
            endloop
            endif
            
            if bbc then
            call UnitRemoveItem(mob[a].u, it)
            call DisplayTextToPlayer(p,.5,0,text[60])
            endif
            endif
        call EnableTrigger(di)            
endmethod


method dropitem takes item it returns nothing
    local integer y=lh(it,"order")
    local integer m=GetItemTypeId(it)
    local integer n=GetItemLevel(it)
    local integer j
    local integer i=0
    local integer x=0
    local integer c=0
    if ia==1 then
    call fh(it)
    set ia=0
    endif
    
    //0 bag
    //1 gear
    //2 pack
    if n==0 then
    if GetItemType(it) == ConvertItemType(4)  then
    set i=0
        loop
        exitwhen i > sys.bag
        set c=20*i+a
        if bag[c].b then
        if bag[c].it==it then
        set bag[c].b=false
        set bag[c].it=null
        return
        endif
        endif
        set i=i+1
        endloop
  endif
  endif
        
if n>0 then
            if bagx==1 then
            set x=LoadInteger(H,StringHash("itemtype"),y)
            set c=20*x+a
            set gear[c].b=false
            set gear[c].it=null
            call stat()
            return
            endif
            
            if bagx==2 then
            set i=6*packx
            loop
                exitwhen i > 6*packx+5
                set c=20*i+a
                if pack[c].b then
                if pack[c].it==it then
                set pack[c].b=false
                set pack[c].it=null
                return
                endif
                endif
                set i = i + 1
            endloop
            endif
            endif
endmethod

method getxp takes unit x returns nothing
local integer i=0
local real bc=1
local integer c
local string s
local texttag tt=null
local integer m
local integer n
local integer j=0
local integer y=GetUnitTypeId(x)
	set m=GetHeroLevel(mob[a].u)
	set n=GetUnitLevel(x)
    if IsUnitInRange(mob[a].u, x, 1000) == true then
    if m<60 then
    if m <= ( n - 5 ) then
        set bc = 1.5
    endif
    if m >= ( n + 5 ) then
        set bc = .5
    endif
    set c = R2I(ia*bc*ra)
    set s = I2S(c)
    set tt = CreateTextTagUnitBJ( s, mob[a].u, 0, 15.00, 0.00, 0, 100.00, 0 )
    call SetTextTagPermanent( tt, false )
    call SetTextTagLifespan( tt, 2.00 )
    call SetTextTagVelocityBJ( tt, 64, 150.00 )
    call AddHeroXP( mob[a].u, c, true )
    set xp=xp+c
    endif
    
    set c = R2I((ia*ra)/10)
    set gold=gold+c
    call AdjustPlayerStateBJ( c, p, PLAYER_STATE_RESOURCE_GOLD )
    set s = I2S(c)
    set tt =CreateTextTagUnitBJ(s, mob[a].u, 0, 15.00, 100.00, 100, 0.00, 0 )
    call SetTextTagPermanent( tt, false )
    call SetTextTagLifespan( tt, 2.00 )
    call SetTextTagVelocityBJ( tt, 64, 30.00 )
    call money()

    set i=0
    loop 
    exitwhen i>4
    set c=20*i+a
    set j=qu[c].x
    if li("questtype",j)==0 then
    if li("unitorder",y)==LoadInteger(H,StringHash("questtarget"),j) then
    if qu[c].y==1 then
    if LoadInteger(H,StringHash("questnum"),j)>qu[c].s then
    if LoadInteger(H,StringHash("questdrop"),j)>0 then
    if GetRandomInt(0,100)<LoadInteger(H,StringHash("questdrop"),j) then
    set qu[c].s=qu[c].s+1
    call qu[c].refresh(a)
    call DisplayTextToPlayer(p,.5,0,qcolor(text[50]+LoadStr(H,StringHash("questitem"),j)+" "+I2S(qu[c].s)+"/"+I2S(LoadInteger(H,StringHash("questnum"),j)),j))
    endif
    else
    set qu[c].s=qu[c].s+1
    call qu[c].refresh(a)    
    call DisplayTextToPlayer(p,.5,0,qcolor(text[61]+GetUnitName(x)+" "+I2S(qu[c].s)+"/"+I2S(LoadInteger(H,StringHash("questnum"),j)),j))
    endif
    endif
    endif
	endif
    endif
    set i=i+1
    endloop
    endif
    set tt=null
endmethod

method gohome takes nothing returns nothing
call SetUnitPosition(mob[a].u,mob[a].x,mob[a].y)
call SetUnitPosition(mob[a+20].u,mob[a].x,mob[a].y)
call PanCameraToTimedForPlayer(p,mob[a].x,mob[a].y,0)
endmethod

method rideover takes nothing returns nothing
call UnitRemoveAbility(mob[a].u,'B000')
set ride=false
endmethod

method bonus takes nothing returns nothing
    local integer i=0
	local integer x=0
    local integer y=0
	local integer m=0
    local real r=0
    set ar[0]=armorx+armors
    set ar[1]=damagex+damages
    set ar[2]=asx+ass
    set ar[3]=hpx+hps
    set ar[4]=mpx+mps
    set ar[5]=strx+strs
    set ar[6]=agix+agis
    set ar[7]=intx+ints
    set ar[8]=msx+mss
	loop
	exitwhen m>sys.bonus
    set i = 0
    
    loop
    exitwhen i > LoadInteger(H,StringHash("bonusclass"),m)
    set x=LoadInteger(H,LoadInteger(H,StringHash("bonustype"),m),i)
    call UnitRemoveAbility(mob[a].u,x)
    set i = i + 1
    endloop
    
    set y=ar[m]
    
    loop
    exitwhen i < 0 or y <= 0
        set r = Pow(2, i)
        if I2R(y) >= r then
        set x=LoadInteger(H,LoadInteger(H,StringHash("bonustype"),m),i)
        call UnitAddAbility(mob[a].u,x )
        set y =  y - R2I(r)
        endif
        set i = i - 1
        endloop
    
    call SaveInteger(H,StringHash("bonus"+I2S(m)),a,ar[m])
	set m=m+1
	endloop
    
    if typex==21 then
    set r=damager*(.5*GetHeroStr(mob[a].u, true)+ar[1]+bdamage)
    endif
    if typex==22 then
    set r=damager*(.5*GetHeroAgi(mob[a].u, true)+ar[1]+bdamage)
    endif
    if typex==23 then
    set r=damager*(.5*GetHeroInt(mob[a].u, true)+ar[1]+bdamage)
    endif
    set mob[a].damage=R2I(r)
    set mob[a].spell=R2I(GetHeroInt(mob[a].u, true)*.5)+bspell+spellx
    set crits=GetHeroAgi(mob[a].u, true)/(50*mob[a].lvl)
    set mob[a].crit=crits+critx
    set scrits=GetHeroInt(mob[a].u, true)/(60*mob[a].lvl)
    set mob[a].scrit=scrits+scritx
    set mob[a].as=ar[2]
    set mob[a].ms=R2I(GetUnitDefaultMoveSpeed(mob[a].u))+ar[8]
    set mob[a].armor=ar[0]+barmor
    call mbupdate()
endmethod





method stat takes nothing returns nothing
    local integer i =0
    local integer j=0
    local integer m=0
    local integer n=0
    local integer c=0
    loop
        exitwhen i > sys.bonus
        set ar[i] = 0
        set i = i + 1
    endloop
    set i =  0
    loop
        exitwhen i > sys.gear
        set c=20*i+a
        if gear[c].b then
        set j=lh(gear[c].it,"order")
        if j>0 then
            set m = 0
            loop
            exitwhen m > sys.bonus
            set n=LoadInteger(H, LoadInteger(H,StringHash("bonustype"),m), j)            
            set ar[m] =  ar[m] +n
            set m = m + 1
            endloop
        endif
        endif
    set i = i + 1
    endloop
    set armors=ar[0]
    set damages=ar[1]
    set ass=ar[2]+R2I(GetHeroAgi(mob[a].u, true)*.2)
    set hps=ar[3]
    set mps=ar[4]
    set strs=ar[5]
    set agis=ar[6]
    set ints=ar[7]
    set mss=ar[8]
    call bonus()
endmethod
endstruct

struct slot
item it=null
boolean b=false
integer id=0
endstruct

struct gex
item it=null
boolean b=false
integer id=0
endstruct
//===========================================================================
// start
//===========================================================================

scope start initializer init
function NewInventory takes nothing returns nothing
local integer j
local integer a=0
local integer c=0

set a=0
loop
exitwhen a>sys.pn
if GetPlayerController(Player(a)) == MAP_CONTROL_USER and GetPlayerSlotState(Player(a)) == PLAYER_SLOT_STATE_PLAYING then
set j=0
loop
exitwhen j > sys.gear
set c=20*j+a
set gear[c]=slot.create()
set j = j + 1
endloop

set j =  0
loop
exitwhen j > sys.bag
set c=20*j+a
set bag[c]=slot.create()
    set j = j + 1
endloop

set j=0
loop
exitwhen j > sys.pack
set c=20*j+a
set pack[c]=slot.create()
    set j = j + 1
endloop

endif

set a=a+1
endloop

endfunction

function flyaction takes nothing returns nothing
local integer k=GetHandleId(GetTriggerUnit())
local integer j=LoadInteger(H,k,StringHash("flyto"))
local integer a=LoadInteger(H,k,StringHash("fly"))
if GetUnitTypeId(GetTriggerUnit()) == 'h00I' then
if flyregion[j]==GetTriggeringRegion() then
call ShowUnit(mob[a].u,true)
call SetUnitPosition(mob[a+20].u,GetRectCenterX(flyrect[j]),GetRectCenterY(flyrect[j]))
call SetUnitPosition(mob[a].u,GetRectCenterX(flyrect[j]),GetRectCenterY(flyrect[j]))
call ResetToGameCameraForPlayer( Player(a), 0 )
call FlushChildHashtable(H,k)
call RemoveUnit(GetTriggerUnit())
call SelectUnitForPlayerSingle(mob[a].u, Player(a))
call SetCameraFieldForPlayer( Player(a), CAMERA_FIELD_TARGET_DISTANCE, 3000.00, 0 )
set he[a].fly=false
endif
endif
endfunction


//===========================================================================
// gameinit
//===========================================================================
function ohyes takes nothing returns nothing
local integer h=GetHandleId(GetClickedButton())
local integer k=LoadInteger(H,h,0)
local integer a=GetPlayerId(GetTriggerPlayer())
local integer b=0
local integer i=0
local integer x=0
local string s=""
local integer c=0
if he[a].init then
set he[a].init=false
set he[a].data=DialogCreate()
call DialogSetMessage( he[a].data, text[62])
set b=0
loop
exitwhen b>2
set i=0
call loadx(Player(a),"wow","hero"+I2S(b),44)
set i=load(Player(a),"xp",16)
if i>0 then
set datastate[20*b+a]=1
set x=load(Player(a),"order",0)
set i=li("unitid",x)
set i=li("unitclass",i)
set x=load(Player(a),"herolvl",17)
set s=classname[i]+" |c0000ff00"+I2S(x)+text[63]
set bu=DialogAddButton( he[a].data,s, 0 )
set datastate[20*b+a]=1
else
set datastate[20*b+a]=0
set bu=DialogAddButton( he[a].data, text[6], 0 )
endif
set c=GetHandleId(bu)
call SaveInteger(H,c,0,b)
set b=b+1
endloop
set bu=DialogAddButton( he[a].data, text[64], 0 )
set c=GetHandleId(bu)
call SaveInteger(H,c,0,3)
call TriggerRegisterDialogEvent(showdata, he[a].data)
call loadx(Player(a),"wow","main",47)
if load(Player(a),"version",3)>1 then
call readdata(a)
endif
endif
if k==0 then
call DialogDisplay(Player(a),he[a].data,true)
endif
if k==1 then
call DialogDisplay(Player(a),he[a].pickhero,true)
endif
endfunction


function startgame takes nothing returns nothing
local trigger t = CreateTrigger()
local trigger q = CreateTrigger()
local trigger z = CreateTrigger()
local trigger v = CreateTrigger()

local integer a
local integer i
local string s=""
local integer x=0
local integer y
local integer b=0
local integer c=0

set tb=CreateTimer()
call TimerStart(tb,300,true,function autosave0)

set tc=CreateTimer()
call TimerStart(tc,600,true,function weather)

call StopMusic( true )
call SetCreepCampFilterState( true )
call SetAllyColorFilterState(1)
call CreateQuestBJ( bj_QUESTTYPE_OPT_DISCOVERED, text[65],text[66],"ReplaceableTextures\\CommandButtons\\BTNHealingWave.blp" )
set ta=CreateTimer()
call TimerStart(ta,300,true,function showtip)
set a=0
loop
exitwhen a>sys.pn
if GetPlayerController(Player(a)) == MAP_CONTROL_USER and GetPlayerSlotState(Player(a)) == PLAYER_SLOT_STATE_PLAYING then
set ia=a
call ForForce(sys.team,function A0X)
call ForceAddPlayer(sys.team,Player(a))
call TriggerRegisterPlayerEvent(pl, Player(a), EVENT_PLAYER_LEAVE)
set he[a]=hex.create()
set mob[a]=sprite.create()
set mob[a+20]=sprite.create()
set he[a].start=DialogCreate()
set he[a].fog=CreateFogModifierRectBJ( true, Player(a), FOG_OF_WAR_MASKED, rex )
call DialogSetMessage( he[a].start, text[67])
set bu=DialogAddButton( he[a].start,text[68], 0 )
set c=GetHandleId(bu)
call SaveInteger(H,c,0,0)
set bu=DialogAddButton( he[a].start,text[69], 0 )
set c=GetHandleId(bu)
call SaveInteger(H,c,0,1)
call TriggerRegisterDialogEvent(z, he[a].start)



set he[a].confirm=DialogCreate()
call DialogSetMessage( he[a].confirm, text[8] )
set bu=DialogAddButton( he[a].confirm, text[64], 0 )
set c=GetHandleId(bu)
call SaveInteger(H,c,0,0)
set bu=DialogAddButton( he[a].confirm, text[70], 0 )
set c=GetHandleId(bu)
call SaveInteger(H,c,0,1)
call TriggerRegisterDialogEvent(t, he[a].confirm)


set he[a].pickhero=DialogCreate()
call DialogSetMessage( he[a].pickhero, text[71])
set i=21
loop
exitwhen i>29
if li("classx",i)==1 then
set bu=DialogAddButton( he[a].pickhero, classname[i], 0 )
set c=GetHandleId(bu)
call SaveInteger(H,c,0,i)
endif
set i=i+1
endloop
call TriggerRegisterDialogEvent(q, he[a].pickhero)

set i=0
loop 
exitwhen i>4
set x=20*i+a
set qu[x]=quesx.create()
set qu[x].x=1000+i*1000
call qu[x].born(a)
set i=i+1
endloop


    set he[a].mb=CreateMultiboardBJ( 1, 1, text[72])
    call MultiboardSetItemsStyle(he[a].mb, true, true )
    call MultiboardSetItemsWidth(he[a].mb, 0.08 )
    call MultiboardSetRowCount(he[a].mb, 19 )
    call MultiboardSetColumnCount(he[a].mb, 2 )
    
    call MultiboardSetItemStyle( MultiboardGetItem(he[a].mb, 0, 1), true, false )
    call MultiboardSetItemStyle( MultiboardGetItem(he[a].mb, 1, 1), true, false )
    call MultiboardSetItemStyle( MultiboardGetItem(he[a].mb, 2, 1), true, false )
    call MultiboardSetItemStyle( MultiboardGetItem(he[a].mb, 3, 1), true, false )
    call MultiboardSetItemStyle( MultiboardGetItem(he[a].mb, 4, 1), true, false )
    call MultiboardSetItemStyle( MultiboardGetItem(he[a].mb, 5, 1), true, false )
    call MultiboardSetItemStyle( MultiboardGetItem(he[a].mb, 6, 1), true, false )
    call MultiboardSetItemStyle( MultiboardGetItem(he[a].mb, 7, 1), true, false )
    call MultiboardSetItemStyle( MultiboardGetItem(he[a].mb, 8, 1), true, false )
    call MultiboardSetItemStyle( MultiboardGetItem(he[a].mb, 9, 1), true, false )
    call MultiboardSetItemStyle( MultiboardGetItem(he[a].mb, 10, 1), true, false )
    call MultiboardSetItemStyle( MultiboardGetItem(he[a].mb, 11, 1), true, false )
    call MultiboardSetItemStyle( MultiboardGetItem(he[a].mb, 12, 1), true, false )
    call MultiboardSetItemStyle( MultiboardGetItem(he[a].mb, 13, 1), true, false )
    call MultiboardSetItemStyle( MultiboardGetItem(he[a].mb, 14, 1), true, false )
    call MultiboardSetItemStyle( MultiboardGetItem(he[a].mb, 15, 1), true, false )
    call MultiboardSetItemStyle( MultiboardGetItem(he[a].mb, 16, 1), true, false )
    call MultiboardSetItemStyle( MultiboardGetItem(he[a].mb, 17, 1), true, false )
    call MultiboardSetItemStyle( MultiboardGetItem(he[a].mb, 18, 1), true, false )
  
    
    
    
    call MultiboardSetItemValueColor( MultiboardGetItem(he[a].mb, 0, 0), 255, 0, 0, 255 )
    call MultiboardSetItemValueColor( MultiboardGetItem(he[a].mb, 0, 1), 255, 0, 0, 255 )    
    call MultiboardSetItemValueColor( MultiboardGetItem(he[a].mb, 1, 0), 255, 128, 0, 255 )
    call MultiboardSetItemValueColor( MultiboardGetItem(he[a].mb, 1, 1), 255, 128, 0, 255 )
    call MultiboardSetItemValueColor( MultiboardGetItem(he[a].mb, 2, 0), 255, 255, 0, 255 )
    call MultiboardSetItemValueColor( MultiboardGetItem(he[a].mb, 2, 1), 255, 255, 0, 255 )    
    call MultiboardSetItemValueColor( MultiboardGetItem(he[a].mb, 3, 0), 128, 255, 0, 255 )
    call MultiboardSetItemValueColor( MultiboardGetItem(he[a].mb, 3, 1), 128, 255, 0, 255 )    
    call MultiboardSetItemValueColor( MultiboardGetItem(he[a].mb, 4, 0), 0, 255, 0, 255 )
    call MultiboardSetItemValueColor( MultiboardGetItem(he[a].mb, 4, 1), 0, 255, 0, 255 )    
    call MultiboardSetItemValueColor( MultiboardGetItem(he[a].mb, 5, 0), 0, 255, 128, 255 )
    call MultiboardSetItemValueColor( MultiboardGetItem(he[a].mb, 5, 1), 0, 255, 128, 255 )    
    call MultiboardSetItemValueColor( MultiboardGetItem(he[a].mb, 6, 0), 0, 255, 255, 255 )
    call MultiboardSetItemValueColor( MultiboardGetItem(he[a].mb, 6, 1), 0, 255, 255, 255 )    
    call MultiboardSetItemValueColor( MultiboardGetItem(he[a].mb, 7, 0), 0, 128, 255, 255 )
    call MultiboardSetItemValueColor( MultiboardGetItem(he[a].mb, 7, 1), 0, 128, 255, 255 )    
    call MultiboardSetItemValueColor( MultiboardGetItem(he[a].mb, 8, 0), 0, 0, 255, 255 )
    call MultiboardSetItemValueColor( MultiboardGetItem(he[a].mb, 8, 1), 0, 0, 255, 255 )    
    call MultiboardSetItemValueColor( MultiboardGetItem(he[a].mb, 9, 0), 128, 0, 255, 255 )
    call MultiboardSetItemValueColor( MultiboardGetItem(he[a].mb, 9, 1), 128, 0, 255, 255 )  
    call MultiboardSetItemValueColor( MultiboardGetItem(he[a].mb, 10, 0), 255, 0, 255, 255 )
    call MultiboardSetItemValueColor( MultiboardGetItem(he[a].mb, 10, 1), 255, 0, 255, 255 )    
    call MultiboardSetItemValueColor( MultiboardGetItem(he[a].mb, 11, 0), 255, 0, 128, 255 )
    call MultiboardSetItemValueColor( MultiboardGetItem(he[a].mb, 11, 1), 255, 0, 128, 255 )
    call MultiboardSetItemValueColor( MultiboardGetItem(he[a].mb, 12, 0), 255, 0, 0, 255 )
    call MultiboardSetItemValueColor( MultiboardGetItem(he[a].mb, 12, 1), 255, 0, 0, 255 )    
    call MultiboardSetItemValueColor( MultiboardGetItem(he[a].mb, 13, 0), 255, 128, 0, 255 )
    call MultiboardSetItemValueColor( MultiboardGetItem(he[a].mb, 13, 1), 255, 128, 0, 255 )
    call MultiboardSetItemValueColor( MultiboardGetItem(he[a].mb, 14, 0), 255, 255, 0, 255 )
    call MultiboardSetItemValueColor( MultiboardGetItem(he[a].mb, 14, 1), 255, 255, 0, 255 )    
    call MultiboardSetItemValueColor( MultiboardGetItem(he[a].mb, 15, 0), 128, 255, 0, 255 )
    call MultiboardSetItemValueColor( MultiboardGetItem(he[a].mb, 15, 1), 128, 255, 0, 255 )    
    call MultiboardSetItemValueColor( MultiboardGetItem(he[a].mb, 16, 0), 0, 255, 0, 255 )
    call MultiboardSetItemValueColor( MultiboardGetItem(he[a].mb, 16, 1), 0, 255, 0, 255 )    
    call MultiboardSetItemValueColor( MultiboardGetItem(he[a].mb, 17, 0), 0, 255, 128, 255 )
    call MultiboardSetItemValueColor( MultiboardGetItem(he[a].mb, 17, 1), 0, 255, 128, 255 )    
    call MultiboardSetItemValueColor( MultiboardGetItem(he[a].mb, 18, 0), 0, 255, 255, 255 )
    call MultiboardSetItemValueColor( MultiboardGetItem(he[a].mb, 18, 1), 0, 255, 255, 255 )    


    
    
    call MultiboardSetItemIcon( MultiboardGetItem(he[a].mb, 0, 0), "ReplaceableTextures\\CommandButtons\\BTNeredarRed.blp" )
    call MultiboardSetItemIcon( MultiboardGetItem(he[a].mb, 1, 0), "ReplaceableTextures\\CommandButtons\\BTNCleavingAttack.blp" )
    call MultiboardSetItemIcon( MultiboardGetItem(he[a].mb, 2, 0), "ReplaceableTextures\\CommandButtons\\BTNFireBolt.blp" )
    call MultiboardSetItemIcon( MultiboardGetItem(he[a].mb, 3, 0), "ReplaceableTextures\\CommandButtons\\BTNPillage.blp" )
    call MultiboardSetItemIcon( MultiboardGetItem(he[a].mb, 4, 0), "ReplaceableTextures\\CommandButtons\\BTNScatterRockets.blp" )
    call MultiboardSetItemIcon( MultiboardGetItem(he[a].mb, 5, 0), "ReplaceableTextures\\CommandButtons\\BTNBerserk.blp" )
    call MultiboardSetItemIcon( MultiboardGetItem(he[a].mb, 6, 0), "ReplaceableTextures\\CommandButtons\\BTNAnimalWarTraining.blp" )
    call MultiboardSetItemIcon( MultiboardGetItem(he[a].mb, 7, 0), "ReplaceableTextures\\CommandButtons\\BTNPebble.blp" )
    call MultiboardSetItemIcon( MultiboardGetItem(he[a].mb, 8, 0), "ReplaceableTextures\\CommandButtons\\BTNShadowMeld.blp" )
    call MultiboardSetItemIcon( MultiboardGetItem(he[a].mb, 9, 0), "ReplaceableTextures\\PassiveButtons\\PASBTNElunesBlessing.blp" )
    call MultiboardSetItemIcon( MultiboardGetItem(he[a].mb, 10, 0), "ReplaceableTextures\\CommandButtons\\BTNMagicalSentry.blp" )
    call MultiboardSetItemIcon( MultiboardGetItem(he[a].mb, 11, 0), "ReplaceableTextures\\CommandButtons\\BTNMarksmanship.blp" )
    call MultiboardSetItemIcon( MultiboardGetItem(he[a].mb, 12, 0), "ReplaceableTextures\\CommandButtons\\BTNChemicalRage.blp" )
    call MultiboardSetItemIcon( MultiboardGetItem(he[a].mb, 13, 0), "ReplaceableTextures\\CommandButtons\\BTNChemicalRage.blp" )
    call MultiboardSetItemIcon( MultiboardGetItem(he[a].mb, 14, 0), "ReplaceableTextures\\CommandButtons\\BTNChemicalRage.blp" )
    call MultiboardSetItemIcon( MultiboardGetItem(he[a].mb, 15, 0), "ReplaceableTextures\\CommandButtons\\BTNChemicalRage.blp" )
    call MultiboardSetItemIcon( MultiboardGetItem(he[a].mb, 16, 0), "ReplaceableTextures\\CommandButtons\\BTNChemicalRage.blp" )



   
    call MultiboardSetItemValue( MultiboardGetItem(he[a].mb, 0, 0), text[73] )
    call MultiboardSetItemValue( MultiboardGetItem(he[a].mb, 1, 0), text[107] )      
    call MultiboardSetItemValue( MultiboardGetItem(he[a].mb, 2, 0), text[74] )
    call MultiboardSetItemValue( MultiboardGetItem(he[a].mb, 3, 0), text[108] )
    call MultiboardSetItemValue( MultiboardGetItem(he[a].mb, 4, 0), text[109] )
    call MultiboardSetItemValue( MultiboardGetItem(he[a].mb, 5, 0), text[75] )
    call MultiboardSetItemValue( MultiboardGetItem(he[a].mb, 6, 0), text[76] )
    call MultiboardSetItemValue( MultiboardGetItem(he[a].mb, 7, 0), text[77] )
    call MultiboardSetItemValue( MultiboardGetItem(he[a].mb, 8, 0), text[78] )
    call MultiboardSetItemValue( MultiboardGetItem(he[a].mb, 9, 0), text[79] )
    call MultiboardSetItemValue( MultiboardGetItem(he[a].mb, 10, 0), text[80] )
    call MultiboardSetItemValue( MultiboardGetItem(he[a].mb, 11, 0), text[81] )
    call MultiboardSetItemValue( MultiboardGetItem(he[a].mb, 12, 0), text[110] )
    call MultiboardSetItemValue( MultiboardGetItem(he[a].mb, 13, 0), text[111] )
    call MultiboardSetItemValue( MultiboardGetItem(he[a].mb, 14, 0), text[82] )    
    call MultiboardSetItemValue( MultiboardGetItem(he[a].mb, 15, 0), text[83] )
    call MultiboardSetItemValue( MultiboardGetItem(he[a].mb, 16, 0), text[84] )
    call MultiboardSetItemValue( MultiboardGetItem(he[a].mb, 17, 0), text[85] )
    call MultiboardSetItemValue( MultiboardGetItem(he[a].mb, 18, 0), text[86] )
    
if GetLocalPlayer()==Player(a) then
call MultiboardDisplay(he[a].mb, true)
endif
call SetPlayerAbilityAvailable(Player(a),'A053',false)
set mob[a+20].b=false
call DialogDisplay(Player(a),he[a].start,true)
endif
set a=a+1
endloop
set i=0
loop 
exitwhen i>20
set flyregion[i] = CreateRegion()
call RegionAddRect(flyregion[i], flyrect[i])
call TriggerRegisterEnterRegion(v, flyregion[i], null)
set i=i+1
endloop

call TriggerAddAction(v, function flyaction)
call TriggerAddAction(t, function confirm)
call TriggerAddAction(q, function pickhero)
call TriggerAddAction(z, function ohyes)
call TriggerAddAction(showdata, function sl)
call DestroyTrigger( GetTriggeringTrigger())
set t=null
set q=null
set z=null
set v=null
endfunction

function stringinit takes nothing returns nothing
call textinit()
call rsinit()
call ssinit()
call usinit()
call taskinit0()
call taskinit1()
call taskinit2()
call taskinit3()
call taskinit4()
call gsinit()
call tipinit()
endfunction

function picklang takes nothing returns nothing
local integer h=GetHandleId(GetClickedButton())
local integer k=LoadInteger(H,h,0)
set sys.lang=k
//call stringinit()
call startgame()
call mapinit()
endfunction

function setlanguage takes nothing returns nothing
local integer i=0
local integer c=0
local trigger t=CreateTrigger()
set sys.langx=DialogCreate()
call DialogSetMessage( sys.langx, "select language" )
set bu=DialogAddButton( sys.langx, "English", 0 )
set c=GetHandleId(bu)
call SaveInteger(H,c,0,0)
set bu=DialogAddButton( sys.langx, "Fran?ais", 0 )
set c=GetHandleId(bu)
call SaveInteger(H,c,0,1)
set bu=DialogAddButton( sys.langx, "Deutsch", 0 )
set c=GetHandleId(bu)
call SaveInteger(H,c,0,2)
set bu=DialogAddButton( sys.langx, "Italiano", 0 )
set c=GetHandleId(bu)
call SaveInteger(H,c,0,3)
set bu=DialogAddButton( sys.langx, "Espa?ol", 0 )
set c=GetHandleId(bu)
call SaveInteger(H,c,0,4)
set bu=DialogAddButton( sys.langx, "svenska", 0 )
set c=GetHandleId(bu)
call SaveInteger(H,c,0,5)
set bu=DialogAddButton( sys.langx, "日本語", 0 )
set c=GetHandleId(bu)
call SaveInteger(H,c,0,6)
set bu=DialogAddButton( sys.langx, "한국어", 0 )
set c=GetHandleId(bu)
call SaveInteger(H,c,0,7)
set bu=DialogAddButton( sys.langx, "Ελληνικά", 0 )
set c=GetHandleId(bu)
call SaveInteger(H,c,0,8)
set bu=DialogAddButton( sys.langx, "Latine", 0 )
set c=GetHandleId(bu)
call SaveInteger(H,c,0,9)
set bu=DialogAddButton( sys.langx, "汉语", 0 )
set c=GetHandleId(bu)
call SaveInteger(H,c,0,10)
call TriggerRegisterDialogEvent(t,sys.langx)
call TriggerAddAction(t,function picklang)
loop
exitwhen i>20
if GetPlayerController(Player(i)) == MAP_CONTROL_USER and GetPlayerSlotState(Player(i)) == PLAYER_SLOT_STATE_PLAYING then
call DialogDisplay( Player(i), sys.langx, true )
set t=null
return
endif
set i=i+1
endloop
endfunction




function destevent takes nothing returns nothing
if GetWidgetLife(GetEnumDestructable())==50 then
call TriggerRegisterDeathEvent(dd, GetEnumDestructable())
endif
endfunction

function initscope takes nothing returns nothing
local trigger t= CreateTrigger()
local integer i=0
local trigger r = CreateTrigger()

call TriggerRegisterTimerEvent(t, 1, false)
call TriggerAddAction(t, function setlanguage)
set t = CreateTrigger()
call TriggerRegisterPlayerUnitEvent(t, Player(27), EVENT_PLAYER_UNIT_SELL_ITEM,null )
loop
exitwhen i>sys.pn
call TriggerRegisterPlayerEvent(r, Player(i), EVENT_PLAYER_ARROW_DOWN_DOWN)
set i=i+1
endloop
call TriggerAddAction(damageinit, function hurt)
call TriggerAddAction(t, function buy)
call TriggerAddAction(ai, function getitem)
call TriggerAddAction(cooard, function rectswitch)
call TriggerAddAction(selecthero, function pickhero)
call TriggerAddAction(dd, function destdeath)
call TriggerAddAction(herorez, function herodie)
call TriggerAddAction(npcword, function npcspeak)
call TriggerAddAction(itemword, function itemspeak)
call TriggerAddAction(r, function rideover)
call TriggerAddAction(herolvl, function statup)
call TriggerAddAction(sellitem, function sellgear)
call TriggerAddAction(di, function dropitem)
call TriggerAddAction(petrez, function petdie)
call TriggerAddAction(hostdata, function action )
call TriggerAddAction(hostdata, function warrior )
call TriggerAddAction(hostdata, function paladin )
call TriggerAddAction(hostdata, function shaman )
call TriggerAddAction(hostdata, function hunter )
call TriggerAddAction(hostdata, function rogue )
call TriggerAddAction(hostdata, function mage )
call TriggerAddAction(hostdata, function priest )
call TriggerAddAction(startcast, function caststart )
call TriggerAddAction(npcdie, function mobdie )
call TriggerAddAction(npcchange, function betray)
call TriggerAddAction(mobcast, function mobskill)
set t=null
set r=null
endfunction

private function init takes nothing returns nothing
call NewInventory()
call initscope()
call EnumDestructablesInRect(rex, null, function destevent)
endfunction
endscope

//===========================================================================
// mapinit
//===========================================================================

library npcrect needs sys,npc
function mapinit takes nothing returns nothing
local unit u
local integer i=0
local integer j=0
local integer x=0
local integer y=0
local integer h=0
call EnableCreepSleepBJ( false )
call SetPlayerState( Player(20), PLAYER_STATE_GIVES_BOUNTY, 0 )
call SetPlayerState( Player(21), PLAYER_STATE_GIVES_BOUNTY, 0 )
call SetPlayerState( Player(22), PLAYER_STATE_GIVES_BOUNTY, 0 )
call SetPlayerState( Player(23), PLAYER_STATE_GIVES_BOUNTY, 0 )
call SetPlayerState( Player(27), PLAYER_STATE_GIVES_BOUNTY, 0 )
call SetPlayerState( Player(24), PLAYER_STATE_GIVES_BOUNTY, 0 )
call CreateFogModifierRectBJ( true, Player(24), FOG_OF_WAR_VISIBLE,GetPlayableMapRect())

set i=40
loop
exitwhen i>100
set j=li("mobid",i)
set x=li("mobx",i)
set y=li("moby",i)
set u= CreateUnit(Player(24),j,100*x,100*y,0)
set h=GetHandleId(u)
call SaveInteger(H,h,StringHash("index"),i)
set mob[i]=sprite.create()
set mob[i].index=i
call mob[i].born(u)
call mobevent(u)
set i=i+1
endloop

set i=0
loop
exitwhen i>100
set j=li("npcid",i)
set x=li("npcx",i)
set y=li("npcy",i)
set u= CreateUnit(Player(27),j,100*x,100*y,0)
set h=GetHandleId(u)
call SaveInteger(H,h,StringHash("index"),i)
set npc[i]=sprite.create()
set npc[i].index=i
call npc[i].born(u)
set i=i+1
endloop

set u=null
endfunction

function rectswitch takes nothing returns nothing
local player p = GetOwningPlayer(GetTriggerUnit())
local integer a=GetPlayerId(p)
local integer m=0
local unit u = GetTriggerUnit()
local integer j=0
local integer q=0
local integer w=0
loop
exitwhen m>50
if RectContainsUnit(crect[m], u) then
set j=LoadInteger(H,StringHash("rectregion"),m)
if j!=he[a].regionx then
call DisplayTextToPlayer(Player(a),.5,0,LoadStr(H,StringHash("regionname"),j))
set he[a].regionx=j
endif
if m!=he[a].rectx then
call DisplayTextToPlayer(Player(a),.5,0,LoadStr(H,StringHash("rectname"),m))
set he[a].rectx=m
endif
set p=null
set u=null
return
endif
set m=m+1
endloop
set p=null
set u=null
endfunction

endlibrary




//===========================================================================
// library
//===========================================================================
//===========================================================================
// drop
//===========================================================================

library dropinit initializer init needs sys
function setip takes integer a,integer b,integer c,integer d returns nothing
call si("min"+I2S(b),a,c)
call si("max"+I2S(b),a,d)
endfunction
//w 100
//g 10
//b 1
//p 0.1
//o 0.01
function ipinit takes nothing returns nothing
//common
call setip(0,0,1000,1013)
call setip(0,1,1050,1063)
call setip(1,0,1100,1113)
call setip(1,1,1150,1163)
call setip(2,0,1200,1213)
call setip(2,1,1250,1263)




//elite
/*
call setip('h003',0,1000,1002)
call setip('h003',1,1050,1052)
call setip('h004',0,1003,1007)
call setip('h004',1,1053,1057)
call setip('h005',0,1008,1013)
call setip('h005',1,1058,1063)
*/

endfunction

private function init takes nothing  returns nothing
call ipinit()
endfunction
endlibrary

//===========================================================================
// rect
//===========================================================================

library rectx initializer init needs sys
function setrect takes integer a,integer b returns nothing
call SaveInteger(H,StringHash("rectregion"),a,b)
endfunction

function rectinit takes nothing returns nothing
/*
set flyrect[0]=gg_rct_fp0
set flyrect[1]=gg_rct_fp1
set flyrect[2]=gg_rct_fp2
set flyrect[3]=gg_rct_fp3

set crect[0]=gg_rct_cr0
set crect[1]=gg_rct_cr1
set crect[2]=gg_rct_cr2
set crect[3]=gg_rct_cr3
set crect[4]=gg_rct_cr4
set crect[5]=gg_rct_cr5
set crect[6]=gg_rct_cr6
set crect[7]=gg_rct_cr7
set crect[8]=gg_rct_cr8
set crect[9]=gg_rct_cr9
*/
/*
set crect[10]=gg_rct_cr10
set crect[11]=gg_rct_cr11
set crect[12]=gg_rct_cr12
set crect[13]=gg_rct_cr13
set crect[14]=gg_rct_cr14
*/



call setrect(0,0)
call setrect(1,0)
call setrect(2,0)
call setrect(3,0)
call setrect(4,1)
call setrect(5,1)
call setrect(6,1)
call setrect(7,2)
call setrect(8,2)
call setrect(0,0)
call setrect(9,2)
call setrect(10,3)
call setrect(11,3)
call setrect(12,3)
call setrect(13,3)
call setrect(14,3)

endfunction
private function init takes nothing  returns nothing
call rectinit()
endfunction
endlibrary





library itemx initializer init needs sys

function setitem takes integer a ,integer b,integer c,integer d,integer e,integer f,integer g,integer h,integer i,integer j,integer k,integer l,integer m,integer n,integer o returns nothing
    call SaveInteger(H,StringHash("itemtype"),sys.itemx,a)    
    call SaveInteger(H,StringHash("itemclass"),sys.itemx,b)
    call SaveInteger(H,StringHash("itemlevel"),sys.itemx,c)
    call SaveInteger(H,StringHash("icontype"),sys.itemx,d)    
    call SaveInteger(H,StringHash("weapontype"),sys.itemx,e)  
    call SaveInteger(H,StringHash("armor"),sys.itemx,f)
    call SaveInteger(H,StringHash("damage"),sys.itemx,g)
    call SaveInteger(H,StringHash("attackspeed"),sys.itemx,h)
    call SaveInteger(H,StringHash("hp"),sys.itemx,i)
    call SaveInteger(H,StringHash("mp"),sys.itemx,j)
    call SaveInteger(H,StringHash("str"),sys.itemx,k)
    call SaveInteger(H,StringHash("agi"),sys.itemx,l)
    call SaveInteger(H,StringHash("int"),sys.itemx,m)
    call SaveInteger(H,StringHash("movespeed"),sys.itemx,n)
    call SaveInteger(H,StringHash("skill"),sys.itemx,o)
    
    set sys.itemx=sys.itemx+1
endfunction

function iteminit takes nothing returns nothing
//5
local integer i=0//class
local integer j=0//level
local integer m=0//damage
local integer n=0//average
local integer b=0//attr
local integer a=0
local integer c=0
loop
exitwhen j>11
if j<3 then
set i=0
loop
exitwhen i>1
set sys.itemx=1000+100*j+50*i
set m=4*(i+2)*(j+1)
set n=(i+2)*(j+1)/2
set b=(i+2)*(j+1)
call setitem(2,i,j,6,0,0,0,0,0,0,0,0,b,0,0)
call setitem(2,i,j,7,0,0,0,0,0,0,0,b,0,0,0)
call setitem(2,i,j,8,0,0,0,0,0,0,b,0,0,0,0)
call setitem(3,i,j,11,1,50,0,0,0,0,b,0,0,0,0)
call setitem(3,i,j,12,2,0,m,0,0,0,0,0,b,0,0)
call setitem(3,i,j,13,3,0,m,0,0,0,0,b,0,0,0)
call setitem(3,i,j,14,4,0,m,0,0,0,b,0,0,0,0)
call setitem(3,i,j,15,5,0,m,0,0,0,n,n,n,0,0)
call setitem(4,i,j,16,0,0,0,0,0,0,0,0,b,0,0)
call setitem(4,i,j,17,0,0,0,0,0,0,0,b,0,0,0)
call setitem(4,i,j,18,0,0,0,0,0,0,b,0,0,0,0)
call setitem(5,i,j,21,0,0,0,0,0,0,0,0,b,0,0)
call setitem(5,i,j,22,0,0,0,0,0,0,0,b,0,0,0)
call setitem(5,i,j,23,0,0,0,0,0,0,b,0,0,0,0)

set i=i+1
endloop
endif

if j>2 and j<7 then
set i=0
loop
exitwhen i>2
set sys.itemx=1300+150*(j-3)+50*i
set m=4*(i+2)*(j+1)
set n=(i+2)*(j+1)/2
set b=(i+2)*(j+1)
call setitem(1,i,j,1,0,0,0,0,0,0,0,0,b,0,0)
call setitem(1,i,j,2,0,0,0,0,0,0,0,b,0,0,0)
call setitem(1,i,j,3,0,0,0,0,0,0,b,0,0,0,0)
call setitem(2,i,j,6,0,0,0,0,0,0,0,0,b,0,0)
call setitem(2,i,j,7,0,0,0,0,0,0,0,b,0,0,0)
call setitem(2,i,j,8,0,0,0,0,0,0,b,0,0,0,0)
call setitem(3,i,j,11,1,50,0,0,0,0,b,0,0,0,0)
call setitem(3,i,j,12,2,0,m,0,0,0,0,0,b,0,0)
call setitem(3,i,j,13,3,0,m,0,0,0,0,b,0,0,0)
call setitem(3,i,j,14,4,0,m,0,0,0,b,0,0,0,0)
call setitem(3,i,j,15,5,0,m,0,0,0,n,n,n,0,0)
call setitem(4,i,j,16,0,0,0,0,0,0,0,0,b,0,0)
call setitem(4,i,j,17,0,0,0,0,0,0,0,b,0,0,0)
call setitem(4,i,j,18,0,0,0,0,0,0,b,0,0,0,0)
call setitem(5,i,j,21,0,0,0,0,0,0,0,0,b,0,0)
call setitem(5,i,j,22,0,0,0,0,0,0,0,b,0,0,0)
call setitem(5,i,j,23,0,0,0,0,0,0,b,0,0,0,0)
if i>0 then
call setitem(6,i,j,26,0,0,0,0,0,0,0,0,b,0,0)
call setitem(6,i,j,27,0,0,0,0,0,0,0,b,0,0,0)
call setitem(6,i,j,28,0,0,0,0,0,0,b,0,0,0,0)
call setitem(6,i,j,29,0,0,0,0,0,0,n,n,n,0,0)
endif
set i=i+1
endloop
endif

if j>6 then
set i=0
loop
exitwhen i>3
set sys.itemx=1900+200*(j-7)+50*i
set m=4*(i+2)*(j+1)
set n=(i+2)*(j+1)/2
set b=(i+2)*(j+1)
call setitem(1,i,j,1,0,0,0,0,0,0,0,0,b,0,0)
call setitem(1,i,j,2,0,0,0,0,0,0,0,b,0,0,0)
call setitem(1,i,j,3,0,0,0,0,0,0,b,0,0,0,0)
call setitem(1,i,j,4,0,0,0,0,0,0,n,n,n,0,0)
call setitem(2,i,j,6,0,0,0,0,0,0,0,0,b,0,0)
call setitem(2,i,j,7,0,0,0,0,0,0,0,b,0,0,0)
call setitem(2,i,j,8,0,0,0,0,0,0,b,0,0,0,0)
call setitem(2,i,j,9,0,0,0,0,0,0,n,n,n,0,0)
call setitem(3,i,j,11,1,50,0,0,0,0,b,0,0,0,0)
call setitem(3,i,j,12,2,0,m,0,0,0,0,0,b,0,0)
call setitem(3,i,j,13,3,0,m,0,0,0,0,b,0,0,0)
call setitem(3,i,j,14,4,0,m,0,0,0,b,0,0,0,0)
call setitem(3,i,j,15,5,0,m,0,0,0,n,n,n,0,0)
call setitem(4,i,j,16,0,0,0,0,0,0,0,0,b,0,0)
call setitem(4,i,j,17,0,0,0,0,0,0,0,b,0,0,0)
call setitem(4,i,j,18,0,0,0,0,0,0,b,0,0,0,0)
call setitem(4,i,j,19,0,0,0,0,0,0,n,n,n,0,0)
call setitem(5,i,j,21,0,0,0,0,0,0,0,0,b,0,0)
call setitem(5,i,j,22,0,0,0,0,0,0,0,b,0,0,0)
call setitem(5,i,j,23,0,0,0,0,0,0,b,0,0,0,0)
call setitem(5,i,j,24,0,0,0,0,0,0,n,n,n,0,0)
if i>0 then
call setitem(6,i,j,26,0,0,0,0,0,0,0,0,b,0,0)
call setitem(6,i,j,27,0,0,0,0,0,0,0,b,0,0,0)
call setitem(6,i,j,28,0,0,0,0,0,0,b,0,0,0,0)
call setitem(6,i,j,29,0,0,0,0,0,0,n,n,n,0,0)
endif
set i=i+1
endloop
endif

set j=j+1
endloop

endfunction

private function init takes nothing  returns nothing
call iteminit()
endfunction
endlibrary




library else initializer init needs sys
function showtip takes nothing returns nothing
local integer i=lx("tips",0)
if i<100 then
set i=i+1
else
set i=0
endif
call DisplayTextToForce(sys.team,text[87]+ls("tip",i))
call sx("tips",0,i)
endfunction



function gameinit takes nothing returns nothing


call ss("itemicon",1,"war3mapImported\\BTNINV_Helmet_15.blp")
call ss("itemicon",2,"war3mapImported\\BTNINV_Helmet_24.blp")
call ss("itemicon",3,"war3mapImported\\BTNINV_Helmet_25.blp")
call ss("itemicon",4,"war3mapImported\\BTNINV_Helmet_23.blp")
call ss("itemicon",6,"war3mapImported\\BTNINV_Chest_Leather_09.blp")
call ss("itemicon",7,"war3mapImported\\BTNINV_Chest_Leather_08.blp")
call ss("itemicon",8,"war3mapImported\\BTNINV_Chest_Plate07.blp")
call ss("itemicon",9,"war3mapImported\\BTNINV_Chest_Chain_14.blp")
call ss("itemicon",11,"ReplaceableTextures\\CommandButtons\\BTNHumanArmorUpThree.blp")
call ss("itemicon",12,"war3mapImported\\BTNINV_Wand_05.blp")
call ss("itemicon",13,"war3mapImported\\BTNINV_Sword_25.blp")
call ss("itemicon",14,"war3mapImported\\BTNINV_Axe_09.blp")
call ss("itemicon",15,"war3mapImported\\BTNINV_Hammer_13.blp")
call ss("itemicon",16,"war3mapImported\\BTNINV_Pants_01.blp")
call ss("itemicon",17,"war3mapImported\\BTNINV_Pants_02.blp")
call ss("itemicon",18,"war3mapImported\\BTNINV_Pants_05.blp")
call ss("itemicon",19,"war3mapImported\\BTNINV_Pants_04.blp")
call ss("itemicon",21,"war3mapImported\\BTNINV_Boots_09.blp")
call ss("itemicon",22,"war3mapImported\\BTNINV_Boots_05.blp")
call ss("itemicon",23,"war3mapImported\\BTNINV_Boots_Plate_09.blp")
call ss("itemicon",24,"war3mapImported\\BTNINV_Boots_Plate_03.blp")
call ss("itemicon",26,"war3mapImported\\BTNINV_Jewelry_Ring_13.blp")
call ss("itemicon",27,"war3mapImported\\BTNINV_Jewelry_Ring_12.blp")
call ss("itemicon",28,"war3mapImported\\BTNINV_Jewelry_Ring_04.blp")
call ss("itemicon",29,"war3mapImported\\BTNINV_Jewelry_Ring_05.blp")

call ss("itemcolor",1,"|c0000ff00")
call ss("itemcolor",2,"|c0000ffff")
call ss("itemcolor",3,"|c00ff00ff")
call ss("itemcolor",4,"|c00ffff00")

call ss("unitcolor",1,"|c00ffff00")
call ss("unitcolor",2,"|c0000ff00")
call ss("unitcolor",3,"|c0000ffff")
call ss("unitcolor",4,"|c0000ff00")
call ss("unitcolor",5,"|c0000ffff")


call ss("qcolor",0,"|c00ff0000")
call ss("qcolor",1,"|c000000ff")
call ss("qcolor",2,"|c0000ffff")
call ss("qcolor",3,"|cff800080")
call ss("qcolor",4,"|cffffff00")
call ss("qcolor",5,"|cffff6600")
call ss("qcolor",6,"|cff00ff00")
call ss("qcolor",7,"|cffff00ff")
call ss("qcolor",8,"|cff808080")
call ss("qcolor",9,"|cffADD8E6")
call ss("qcolor",10,"|cff006400")
call ss("qcolor",11,"|cffA52A2A")
call ss("qcolor",12,"|cff800000")
call ss("qcolor",13,"|cff000080")
call ss("qcolor",14,"|cff40E0D0")
call ss("qcolor",15,"|cffEE82EE")
call ss("qcolor",16,"|cfff5deb3")
call ss("qcolor",17,"|cffFFDAB9")
call ss("qcolor",18,"|cff98FF98")
call ss("qcolor",19,"|cffE6E6FA")


call ss("bonusname",0,"armor")
call ss("bonusname",1,"damage")
call ss("bonusname",2,"attackspeed")
call ss("bonusname",3,"hp")
call ss("bonusname",4,"mp")
call ss("bonusname",5,"str")
call ss("bonusname",6,"agi")
call ss("bonusname",7,"int")
call ss("bonusname",8,"movespeed")

call si("ridespeed",0,0)
call si("ridespeed",1,60)
call si("ridespeed",2,100)

call si("price",0,1)
call si("price",1,10)
call si("price",2,100)
call si("price",3,1000)
call si("price",4,10000)


endfunction

private function init takes nothing  returns nothing
call gameinit()
endfunction
endlibrary




library bonusinit initializer init
function bonusinit takes nothing returns nothing
    call SaveInteger(H,StringHash("bonusclass"),0,10)
    call SaveInteger(H,StringHash("bonusclass"),1,15)
    call SaveInteger(H,StringHash("bonusclass"),2,9)
    call SaveInteger(H,StringHash("bonusclass"),3,15)
    call SaveInteger(H,StringHash("bonusclass"),4,15)
    call SaveInteger(H,StringHash("bonusclass"),5,10)
    call SaveInteger(H,StringHash("bonusclass"),6,10)
    call SaveInteger(H,StringHash("bonusclass"),7,10)
    call SaveInteger(H,StringHash("bonusclass"),8,9)
    call SaveInteger(H,StringHash("armor"),0,'A005')
    call SaveInteger(H,StringHash("armor"),1,'A006')
    call SaveInteger(H,StringHash("armor"),2,'A00D')
    call SaveInteger(H,StringHash("armor"),3,'A00E')
    call SaveInteger(H,StringHash("armor"),4,'A00F')
    call SaveInteger(H,StringHash("armor"),5,'A00G')
    call SaveInteger(H,StringHash("armor"),6,'A00H')
    call SaveInteger(H,StringHash("armor"),7,'A00I')
    call SaveInteger(H,StringHash("armor"),8,'A00J')
    call SaveInteger(H,StringHash("armor"),9,'A00K')
    call SaveInteger(H,StringHash("armor"),10,'A00L')
    call SaveInteger(H,StringHash("damage"),0,'A001')
    call SaveInteger(H,StringHash("damage"),1,'A002')
    call SaveInteger(H,StringHash("damage"),2,'A003')
    call SaveInteger(H,StringHash("damage"),3,'A004')
    call SaveInteger(H,StringHash("damage"),4,'A007')
    call SaveInteger(H,StringHash("damage"),5,'A008')
    call SaveInteger(H,StringHash("damage"),6,'A00C')
    call SaveInteger(H,StringHash("damage"),7,'A009')
    call SaveInteger(H,StringHash("damage"),8,'A00B')
    call SaveInteger(H,StringHash("damage"),9,'A01M')
    call SaveInteger(H,StringHash("damage"),10,'A00A')
    call SaveInteger(H,StringHash("damage"),11,'A01L')
    call SaveInteger(H,StringHash("damage"),12,'A01K')
    call SaveInteger(H,StringHash("damage"),13,'A01J')
    call SaveInteger(H,StringHash("damage"),14,'A01I')
    call SaveInteger(H,StringHash("damage"),15,'A01N')
    call SaveInteger(H,StringHash("attackspeed"),0,'A00M')
    call SaveInteger(H,StringHash("attackspeed"),1,'A02X')
    call SaveInteger(H,StringHash("attackspeed"),2,'A02Y')
    call SaveInteger(H,StringHash("attackspeed"),3,'A02Z')
    call SaveInteger(H,StringHash("attackspeed"),4,'A030')
    call SaveInteger(H,StringHash("attackspeed"),5,'A031')
    call SaveInteger(H,StringHash("attackspeed"),6,'A035')
    call SaveInteger(H,StringHash("attackspeed"),7,'A03T')
    call SaveInteger(H,StringHash("attackspeed"),8,'A044')
    call SaveInteger(H,StringHash("attackspeed"),9,'A04M')
    call SaveInteger(H,StringHash("hp"),0,'A00Y')
    call SaveInteger(H,StringHash("hp"),1,'A00O')
    call SaveInteger(H,StringHash("hp"),2,'A00P')
    call SaveInteger(H,StringHash("hp"),3,'A00Q')
    call SaveInteger(H,StringHash("hp"),4,'A00R')
    call SaveInteger(H,StringHash("hp"),5,'A00S')
    call SaveInteger(H,StringHash("hp"),6,'A00T')
    call SaveInteger(H,StringHash("hp"),7,'A00U')
    call SaveInteger(H,StringHash("hp"),8,'A00V')
    call SaveInteger(H,StringHash("hp"),9,'A00W')
    call SaveInteger(H,StringHash("hp"),10,'A00X')
    call SaveInteger(H,StringHash("hp"),11,'A00Z')
    call SaveInteger(H,StringHash("hp"),12,'A010')
    call SaveInteger(H,StringHash("hp"),13,'A011')
    call SaveInteger(H,StringHash("hp"),14,'A012')
    call SaveInteger(H,StringHash("hp"),15,'A013')
    call SaveInteger(H,StringHash("mp"),0,'A00N')
    call SaveInteger(H,StringHash("mp"),1,'A000')
    call SaveInteger(H,StringHash("mp"),2,'A014')
    call SaveInteger(H,StringHash("mp"),3,'A015')
    call SaveInteger(H,StringHash("mp"),4,'A016')
    call SaveInteger(H,StringHash("mp"),5,'A017')
    call SaveInteger(H,StringHash("mp"),6,'A018')
    call SaveInteger(H,StringHash("mp"),7,'A019')
    call SaveInteger(H,StringHash("mp"),8,'A01A')
    call SaveInteger(H,StringHash("mp"),9,'A01B')
    call SaveInteger(H,StringHash("mp"),10,'A01C')
    call SaveInteger(H,StringHash("mp"),11,'A01D')
    call SaveInteger(H,StringHash("mp"),12,'A01E')
    call SaveInteger(H,StringHash("mp"),13,'A01F')
    call SaveInteger(H,StringHash("mp"),14,'A01G')
    call SaveInteger(H,StringHash("mp"),15,'A01H')
    call SaveInteger(H,StringHash("str"),0,'A01O')
    call SaveInteger(H,StringHash("str"),1,'A01P')
    call SaveInteger(H,StringHash("str"),2,'A01Q')
    call SaveInteger(H,StringHash("str"),3,'A01R')
    call SaveInteger(H,StringHash("str"),4,'A01S')
    call SaveInteger(H,StringHash("str"),5,'A01T')
    call SaveInteger(H,StringHash("str"),6,'A01U')
    call SaveInteger(H,StringHash("str"),7,'A01V')
    call SaveInteger(H,StringHash("str"),8,'A01W')
    call SaveInteger(H,StringHash("str"),9,'A01X')
    call SaveInteger(H,StringHash("str"),10,'A034')
    call SaveInteger(H,StringHash("agi"),0,'A02H')
    call SaveInteger(H,StringHash("agi"),1,'A02G')
    call SaveInteger(H,StringHash("agi"),2,'A02F')
    call SaveInteger(H,StringHash("agi"),3,'A029')
    call SaveInteger(H,StringHash("agi"),4,'A02E')
    call SaveInteger(H,StringHash("agi"),5,'A02D')
    call SaveInteger(H,StringHash("agi"),6,'A02C')
    call SaveInteger(H,StringHash("agi"),7,'A02B')
    call SaveInteger(H,StringHash("agi"),8,'A02A')
    call SaveInteger(H,StringHash("agi"),9,'A028')
    call SaveInteger(H,StringHash("agi"),10,'A032')
    call SaveInteger(H,StringHash("int"),0,'A01Z')
    call SaveInteger(H,StringHash("int"),1,'A01Y')
    call SaveInteger(H,StringHash("int"),2,'A022')
    call SaveInteger(H,StringHash("int"),3,'A024')
    call SaveInteger(H,StringHash("int"),4,'A025')
    call SaveInteger(H,StringHash("int"),5,'A026')
    call SaveInteger(H,StringHash("int"),6,'A020')
    call SaveInteger(H,StringHash("int"),7,'A021')
    call SaveInteger(H,StringHash("int"),8,'A023')
    call SaveInteger(H,StringHash("int"),9,'A027')
    call SaveInteger(H,StringHash("int"),10,'A033')
    call SaveInteger(H,StringHash("movespeed"),0,'A02M')
    call SaveInteger(H,StringHash("movespeed"),1,'A02L')
    call SaveInteger(H,StringHash("movespeed"),2,'A02P')
    call SaveInteger(H,StringHash("movespeed"),3,'A02J')
    call SaveInteger(H,StringHash("movespeed"),4,'A02I')
    call SaveInteger(H,StringHash("movespeed"),5,'A02N')
    call SaveInteger(H,StringHash("movespeed"),6,'A02O')
    call SaveInteger(H,StringHash("movespeed"),7,'A02Q')
    call SaveInteger(H,StringHash("movespeed"),8,'A02R')
    call SaveInteger(H,StringHash("movespeed"),9,'A02K')
    
    
    
    call SaveInteger(H,StringHash("geartype"),0,1)//head
    call SaveInteger(H,StringHash("geartype"),1,2)//shoulder
    call SaveInteger(H,StringHash("geartype"),2,3)//chest
    call SaveInteger(H,StringHash("geartype"),3,4)//back
    call SaveInteger(H,StringHash("geartype"),4,5)//hand
    call SaveInteger(H,StringHash("geartype"),5,6)//pants
    call SaveInteger(H,StringHash("geartype"),6,7)//foot
    call SaveInteger(H,StringHash("geartype"),7,8)//ring
    set z = Location(0.00, 0.00)
    
    call SaveInteger(H,StringHash("bonustype"),0,StringHash("armor"))
    call SaveInteger(H,StringHash("bonustype"),1,StringHash("damage"))
    call SaveInteger(H,StringHash("bonustype"),2,StringHash("attackspeed"))
    call SaveInteger(H,StringHash("bonustype"),3,StringHash("hp"))
    call SaveInteger(H,StringHash("bonustype"),4,StringHash("mp"))
    call SaveInteger(H,StringHash("bonustype"),5,StringHash("str"))
    call SaveInteger(H,StringHash("bonustype"),6,StringHash("agi"))
    call SaveInteger(H,StringHash("bonustype"),7,StringHash("int"))
    call SaveInteger(H,StringHash("bonustype"),8,StringHash("movespeed"))
    
endfunction

private function init takes nothing  returns nothing
call bonusinit()
endfunction
endlibrary
































library mobskill needs sys,heroskill

//===========================================================================
// boss skill
//===========================================================================

/*
function muticast takes unit u,unit v,real y,integer x returns nothing
if y>1 then
if ia==2 then
if ib==1 then
call UnitAddAbility(ub, 'A04D' )
call IssueTargetOrderById(ub, 852095, GetEnumUnit())
set y=.8*y
call solo(u,GetEnumUnit(),y,2)
endif
endif
endif
endfunction

function muti takes unit u,unit v,integer r,real y,integer x,integer z returns nothing
if y>1 then
call GroupClear(ga[10])
call GroupEnumUnitsInRange(ga[10],GetUnitX(v),GetUnitY(v),r,Condition(function isenemy))
set ra=y
set ua=u
set ub=c
set ia=x
set ib=z
call ForGroup(ga[10],function muticast)
call GroupClear(ga[10])
endif
endfunction
*/

function bosskill takes nothing returns nothing
local timer t=GetExpiredTimer()
local unit v
local integer a=lh(t,"a")
local integer j=lh(t,"j")
local integer h=GetHandleId(t)
local unit u=LoadUnitHandle(H,h,StringHash("caster"))

call DestroyTimer(t)
set ia=a
if j==1 then
set v=ran(u,0)
call IssueTargetOrderById(u, 852095, v )
endif
if j==2 then
set v=ran(u,0)
call IssueTargetOrderById( u, 852106, v )
endif
if j==3 then
call IssueImmediateOrderById(u, 852127 )
endif
if j==4 then
set v=ran(u,0)
call IssueTargetOrderById( u, 852230, v )
endif
if j==5 then
call IssueImmediateOrderById(u, 852253 )
endif
if j==6 then
set v=ran(u,0)
call IssueTargetOrderById(u, 852527,v)
endif
if j==7 then
set v=ran(u,0)
call IssueTargetOrderById( u, 852587, v )
endif

if j==8 then
set v=ran(u,0)
call IssuePointOrderById(u, 852592, GetUnitX(v), GetUnitY(v) )
endif

if j==9 then
set v=ran(u,0)
call IssuePointOrderById(u, 852218, GetUnitX(v), GetUnitY(v) )
endif

if j==10 then
call IssueImmediateOrderById(u, 852526 )
endif

if j==11 then
set v=ran(u,0)
call IssuePointOrderById(u, 852555, GetUnitX(v), GetUnitY(v) )
endif

if j==12 then
set v=ran(u,0)
call IssueTargetOrderById(u, 852226, v )
endif

if j==13 then
set v=ran(u,1)
call IssueTargetOrderById(u, 852101, v )
endif

if j==14 then
set v=ran(u,0)
call IssueTargetOrderById(u, 852119, v )
endif

/*
if j==15 then
set ib=1
set v=ran(u,0)
call muti(u,v,600,y,2)
endif
*/
set t=null
set u=null
set v=null
endfunction


function elitekill takes nothing returns nothing
local timer t=GetExpiredTimer()
local unit v
local integer a=lh(t,"a")
local integer j=lh(t,"j")
local integer h=GetHandleId(t)
local unit u=LoadUnitHandle(H,h,StringHash("caster"))

call DestroyTimer(t)
set ia=a
if j==1 then
set v=ran(u,0)
call IssueTargetOrderById(u, 852095, v )
endif
if j==2 then
set v=ran(u,0)
call IssueTargetOrderById( u, 852106, v )
endif
if j==3 then
call IssueImmediateOrderById(u, 852127 )
endif
if j==4 then
set v=ran(u,0)
call IssueTargetOrderById( u, 852230, v )
endif
if j==5 then
call IssueImmediateOrderById(u, 852253 )
endif
if j==6 then
set v=ran(u,0)
call IssueTargetOrderById(u, 852527,v)
endif
if j==7 then
set v=ran(u,0)
call IssueTargetOrderById( u, 852587, v )
endif

if j==8 then
set v=ran(u,0)
call IssuePointOrderById(u, 852592, GetUnitX(v), GetUnitY(v) )
endif

if j==9 then
set v=ran(u,0)
call IssuePointOrderById(u, 852218, GetUnitX(v), GetUnitY(v) )
endif

if j==10 then
call IssueImmediateOrderById(u, 852526 )
endif

if j==11 then
set v=ran(u,0)
call IssuePointOrderById(u, 852555, GetUnitX(v), GetUnitY(v) )
endif

if j==12 then
set v=ran(u,0)
call IssueTargetOrderById(u, 852226, v )
endif

if j==13 then
set v=ran(u,1)
call IssueTargetOrderById(u, 852101, v )
endif

if j==14 then
set v=ran(u,0)
call IssueTargetOrderById(u, 852119, v )
endif

/*
if j==15 then
set ib=1
set v=ran(u,0)
call muti(u,v,600,y,2)
endif
*/
set t=null
set u=null
set v=null
endfunction


function rarekill takes nothing returns nothing
local timer t=GetExpiredTimer()
local unit v
local integer a=lh(t,"a")
local integer j=lh(t,"j")
local integer h=GetHandleId(t)
local unit u=LoadUnitHandle(H,h,StringHash("caster"))

call DestroyTimer(t)
set ia=a
if j==1 then
set v=ran(u,0)
call IssueTargetOrderById(u, 852095, v )
endif
if j==2 then
set v=ran(u,0)
call IssueTargetOrderById( u, 852106, v )
endif
if j==3 then
call IssueImmediateOrderById(u, 852127 )
endif
if j==4 then
set v=ran(u,0)
call IssueTargetOrderById( u, 852230, v )
endif
if j==5 then
call IssueImmediateOrderById(u, 852253 )
endif
if j==6 then
set v=ran(u,0)
call IssueTargetOrderById(u, 852527,v)
endif
if j==7 then
set v=ran(u,0)
call IssueTargetOrderById( u, 852587, v )
endif

if j==8 then
set v=ran(u,0)
call IssuePointOrderById(u, 852592, GetUnitX(v), GetUnitY(v) )
endif

if j==9 then
set v=ran(u,0)
call IssuePointOrderById(u, 852218, GetUnitX(v), GetUnitY(v) )
endif

if j==10 then
call IssueImmediateOrderById(u, 852526 )
endif

if j==11 then
set v=ran(u,0)
call IssuePointOrderById(u, 852555, GetUnitX(v), GetUnitY(v) )
endif

if j==12 then
set v=ran(u,0)
call IssueTargetOrderById(u, 852226, v )
endif

if j==13 then
set v=ran(u,1)
call IssueTargetOrderById(u, 852101, v )
endif

if j==14 then
set v=ran(u,0)
call IssueTargetOrderById(u, 852119, v )
endif

/*
if j==15 then
set ib=1
set v=ran(u,0)
call muti(u,v,600,y,2)
endif
*/
set t=null
set u=null
set v=null
endfunction






function mobkill takes nothing returns nothing
local timer t=GetExpiredTimer()
local unit v
local integer a=lh(t,"a")
local integer j=lh(t,"j")
local integer h=GetHandleId(t)
local unit u=LoadUnitHandle(H,h,StringHash("caster"))

call DestroyTimer(t)
set ia=a
if j==1 then
set v=ran(u,0)
call IssueTargetOrderById(u, 852095, v )
endif
if j==2 then
set v=ran(u,0)
call IssueTargetOrderById( u, 852106, v )
endif
if j==3 then
call IssueImmediateOrderById(u, 852127 )
endif
if j==4 then
set v=ran(u,0)
call IssueTargetOrderById( u, 852230, v )
endif
if j==5 then
call IssueImmediateOrderById(u, 852253 )
endif
if j==6 then
set v=ran(u,0)
call IssueTargetOrderById(u, 852527,v)
endif
if j==7 then
set v=ran(u,0)
call IssueTargetOrderById( u, 852587, v )
endif

if j==8 then
set v=ran(u,0)
call IssuePointOrderById(u, 852592, GetUnitX(v), GetUnitY(v) )
endif

if j==9 then
set v=ran(u,0)
call IssuePointOrderById(u, 852218, GetUnitX(v), GetUnitY(v) )
endif

if j==10 then
call IssueImmediateOrderById(u, 852526 )
endif

if j==11 then
set v=ran(u,0)
call IssuePointOrderById(u, 852555, GetUnitX(v), GetUnitY(v) )
endif

if j==12 then
set v=ran(u,0)
call IssueTargetOrderById(u, 852226, v )
endif

if j==13 then
set v=ran(u,1)
call IssueTargetOrderById(u, 852101, v )
endif

if j==14 then
set v=ran(u,0)
call IssueTargetOrderById(u, 852119, v )
endif

/*
if j==15 then
set ib=1
set v=ran(u,0)
call muti(u,v,600,y,2)
endif
*/
set t=null
set u=null
set v=null
endfunction

function mobbit takes unit u, unit v, integer a returns nothing
local integer m=GetUnitTypeId(u)
local integer j=li("unitskill",m)
local integer z=li("unitclass",m)
local integer k
local timer t
local integer h

if z<3 then
if GetRandomInt(0,100)<20 then
if j<20 then
if GetUnitState(u,ConvertUnitState())
call UnitResetCooldown( u )
set t=CreateTimer()
set h=GetHandleId(t)
call sh(t,"a",a)
call sh(t,"j",j)
call SaveUnitHandle(H,h,StringHash("caster"),u)
if z==0 then
call TimerStart(t,0.01,false,function mobkill)
endif
if z==1 then
call TimerStart(t,0.01,false,function rarekill)
endif
if z==2 then
call TimerStart(t,0.01,false,function elitekill)
endif
endif
endif
endif
endif

if z==3 then
if GetRandomInt(0,100)<20 then
set k=li("boss0",m)
if k<20 then
call UnitResetCooldown(u)
set t=CreateTimer()
set h=GetHandleId(t)
call sh(t,"a",a)
call sh(t,"j",k)
call SaveUnitHandle(H,h,StringHash("caster"),u)
call TimerStart(t,0.01,false,function bosskill)
endif
endif
if GetRandomInt(0,100)<20 then
set k=li("boss1",m)
if k<20 then
call UnitResetCooldown( u )
set t=CreateTimer()
set h=GetHandleId(t)
call sh(t,"a",a)
call sh(t,"j",k)
call SaveUnitHandle(H,h,StringHash("caster"),u)
call TimerStart(t,0.01,false,function bosskill)
endif
endif
endif

/*
if GetUnitTypeId(GetAttacker()) == 'n001' then
    if GetRandomInt(1, 5) == 1 then
        call UnitAddAbility( GetAttacker(), 'Afrz' )
    else
        call UnitRemoveAbility( GetAttacker(), 'Afrz' )
    endif
endif
*/
set u=null
set v=null
set t=null
endfunction

function mobskill takes nothing returns nothing
local integer a=GetPlayerId(GetOwningPlayer(GetTriggerUnit()))
local integer h=0

if GetSpellAbilityId() == 'A402' then
set h=GetHandleId(mob[a+20].u)
call FlushChildHashtable(H,h)
call RemoveUnit(mob[a+20].u)
set h=he[a].petnum
set he[a].petnum=h-1
set h=he[a].petnow
call si("pet"+I2S(h),a,0)
set mob[a+20].b=false
set he[a].peton=false
call DisplayTextToPlayer(Player(a),.5,0,text[88])
endif

if GetSpellAbilityId() == 'A403' then
if GetUnitManaPercent(mob[a+20].u) >= 50.00 then
call SetUnitLifePercentBJ( mob[a+20].u, 100 )
call SetUnitManaPercentBJ( mob[a+20].u, ( GetUnitManaPercent(mob[a+20].u) - 50.00 ) )
else
call DisplayTextToPlayer(Player(a),.5,0,text[89])
endif
endif

endfunction

function hurt takes nothing returns nothing
local unit u=GetEventDamageSource()
local unit v=GetTriggerUnit()
    local real i=GetUnitFacing(u)
    local real j=GetUnitFacing(v)
    local integer a=GetPlayerId(GetOwningPlayer(u))
    local integer b=GetPlayerId(GetOwningPlayer(v))
    local integer h=GetHandleId(u)
    local real y=GetEventDamage()
    local unit w
    if y>1 then
    if ph then
    if a<20 then
    if IsUnitType(u, ConvertUnitType(0))then
    if GetRandomReal(0,1)<he[a].crit then
    set ph=false
    call UnitDamageTarget(u,v,y,true, false, ATTACK_TYPE_CHAOS, DAMAGE_TYPE_NORMAL, WEAPON_TYPE_WHOKNOWS)
    call floattext(R2I(y),mob[a].u,0)
    endif

    if mob[a].class>20 then
    if mob[a].class==22 then
    if li("command",a)>0 then
    call command(u,v,a)
    endif
    endif
    if mob[a].class==23 then
    call windfury(u,v,a)
    endif
    endif
    else
    call mobbit(u,v,a)
    endif
    endif
    if a==24 then
    call mobbit(u,v,a)
    if b<20 then
    if i>=j then 
    set i=i-j
    else 
    set i=j-i
    endif
    if i<90 then
    if GetRandomInt(1,10)<=3 then
    if he[b].ride then
    call UnitRemoveAbility(mob[b].u,'B000')
    set he[b].ride=false
    endif
    endif
set w=CreateUnit(Player(24),'e000',GetUnitX(u),GetUnitY(u),0)
call UnitApplyTimedLife(w, 'BHwe', 1.00 )
call ShowUnit(w, false)
call UnitAddAbility(w, 'A04B' )
call IssueTargetOrderById( w, 852075, v )
    endif
    endif
    endif
    else
    set ph=true
    endif
    endif
set u=null
set v=null
set w=null
endfunction


endlibrary


library heroskill needs sys

function homex takes nothing returns nothing
local timer t=GetExpiredTimer()
local integer a=lh(t,"home")
call DestroyEffect(he[a].home)
call FlushChildHashtable(H,GetHandleId(t))
call DestroyTimer(t)
set t=null
endfunction

function caststart takes nothing returns nothing
local timer t
local integer a=GetPlayerId(GetOwningPlayer(GetTriggerUnit()))
if GetSpellAbilityId() == 'A052' then
set t=CreateTimer()
call sh(t,"home",a)
    call DestroyEffect(he[a].home)
    set he[a].home=AddSpecialEffectTarget( "war3mapImported\\jn_huicheng.mdx",GetTriggerUnit(),"origin" )
    call TimerStart(t,5,false,function homex)
endif
set t=null
endfunction


function command takes unit u,unit v,integer a returns nothing
local integer j=li("command",a)
local integer i=GetUnitAbilityLevel(u,'A201')
local integer m=GetUnitAbilityLevel(u,'A202')
local real r=0
if j==1 then
if i>0 then
set r=i*10+mob[a].spell*.7
call mob[a].dama(v,r,4)
call DestroyEffect( AddSpecialEffectTarget("Abilities\\Spells\\Undead\\AbsorbMana\\AbsorbManaBirthMissile.mdl", v, "overhead") )
endif
endif
if j==2 then
if m>0 then
if GetRandomInt(0,100)<40 then
set r=m*.1+.7
set r=r*mob[a].damage+20*m
call mob[a].dama(v,r,2)
call DestroyEffect( AddSpecialEffectTarget("Abilities\\Spells\\Other\\AcidBomb\\BottleMissile.mdl", v, "overhead") )
endif
endif
endif
endfunction

function windfury takes unit u,unit v,integer a returns nothing
local integer i=GetUnitAbilityLevel(u,'A300')
local integer y=0
local real r=0
if i>0 then
if GetRandomInt(0,100)<20 then
set r=mob[a].damage+50*i
loop
exitwhen y>1
if r>1 then
call mob[a].dama(v,r,1)
endif
if GetRandomInt(0,100)<20 then
call windfury(u,v,a)
endif
set y=y+1
endloop
call DestroyEffect( AddSpecialEffectTarget("Abilities\\Spells\\Human\\ManaFlare\\ManaFlareBoltImpact.mdl", v, "origin") )
endif
endif
endfunction

endlibrary


library warrior requires sys


function retaliation takes nothing returns nothing
local timer t=GetExpiredTimer()
local integer h=GetHandleId(t)
local integer a=LoadInteger(H,h,StringHash("retaliation"))
call DestroyEffect( LoadEffectHandle(H,h,StringHash("retaeffect")))
call UnitRemoveAbility(mob[a].u,'A045')
call FlushChildHashtable(H,h)
call DestroyTimer(t)
set t=null
endfunction

function wall takes nothing returns nothing
local timer t=GetExpiredTimer()
local integer h=GetHandleId(t)
local integer a=LoadInteger(H,h,StringHash("wall0"))
local integer k=LoadInteger(H,h,StringHash("wall1"))
set he[a].armorx=he[a].armorx-k
call DestroyEffect(LoadEffectHandle(H,h,StringHash("walleffect")))
call he[a].bonus()
call FlushChildHashtable(H,h)
call DestroyTimer(t)
set t=null
endfunction

function rage takes nothing returns nothing
local timer t=GetExpiredTimer()
local integer h=GetHandleId(t)
local integer a=LoadInteger(H,h,StringHash("rage0"))
local integer k=LoadInteger(H,h,StringHash("rage1"))
call DestroyEffect(LoadEffectHandle(H,h,StringHash("rageeffect")))
set he[a].damagex=he[a].damagex-k
call he[a].bonus()
call FlushChildHashtable(H,h)
call DestroyTimer(t)
set t=null
endfunction

function avatar takes nothing returns nothing
local timer t=GetExpiredTimer()
local integer h=GetHandleId(t)
local integer a=LoadInteger(H,h,StringHash("avatar"))
local integer b=LoadInteger(H,h,StringHash("amount"))
call DestroyEffect( LoadEffectHandle(H,h,StringHash("avatareffect")))
set he[a].hpx=he[a].hpx-b
call he[a].bonus()
call FlushChildHashtable(H,h)
call DestroyTimer(t)
set t=null
endfunction

function charge takes nothing returns nothing
local timer t=GetExpiredTimer()
local integer h=GetHandleId(t)
local unit u=LoadUnitHandle(H,h,StringHash("chargeu"))
local unit v=LoadUnitHandle(H,h,StringHash("chargev"))
local integer a=LoadInteger(H,h,StringHash("chargea"))
if IsUnitInRange(u, v, 100.00) then
call DestroyTimer(t)
call PauseUnit( v, false )
call FlushChildHashtable(H,h)
call PanCameraToTimedForPlayer(Player(a),GetUnitX(u),GetUnitY(u),0)
else
call SetUnitPosition(u, GetUnitX(u)+CosBJ(GetUnitFacing(u))*30,  GetUnitY(u)+SinBJ(GetUnitFacing(u))*30 )
endif
set t=null
set u=null
set v=null
endfunction


function wind takes nothing returns nothing
call mob[ia].dama(GetEnumUnit(),ra,1)
endfunction

function warrior takes nothing returns nothing
local unit u=GetTriggerUnit()
local unit v=GetSpellTargetUnit()
local integer a=GetPlayerId(GetOwningPlayer(u))
local integer i=GetUnitAbilityLevel(u,GetSpellAbilityId())
local integer k=0
local real r=0
local integer h=0
local timer t


if GetSpellAbilityId() == 'A100' then
set r=20*i+mob[a].damage
call mob[a].dama(v,r,1)
endif

if GetSpellAbilityId()=='A103' then
set t=CreateTimer()
set h=GetHandleId(t)
call SaveUnitHandle(H,h,StringHash("chargeu"),u)
call SaveUnitHandle(H,h,StringHash("chargev"),v)
call SaveInteger(H,h,StringHash("chargea"),a)
call PauseUnit( v, true )
call dummy(a,v)
call UnitAddAbility(ub, 'A110' )
call SetUnitAbilityLevel(ub,'A110',i)
call IssueTargetOrderById(ub, 852252, v )
call TimerStart(t,.01,true,function charge)
set r=10*i
call mob[a].dama(v,r,1)
endif


if GetSpellAbilityId()=='A041' then
set t=CreateTimer()
set h=GetHandleId(t)
set k=30+i*20
set he[a].damagex=he[a].damagex+k
call SaveInteger(H,h,StringHash("rage0"),a)
call SaveInteger(H,h,StringHash("rage1"),k)
call SaveEffectHandle(H,h,StringHash("rageeffect"),AddSpecialEffectTarget("Abilities\\Spells\\Orc\\Purge\\PurgeBuffTarget.mdl", u, "origin"))
call he[a].bonus()
call TimerStart(t,15,false,function rage)
endif

if GetSpellAbilityId()=='A046' then
set t=CreateTimer()
set h=GetHandleId(t)
set k=i*500
set he[a].hpx=he[a].hpx+k
call SaveInteger(H,h,StringHash("avatar"),a)
call SaveInteger(H,h,StringHash("amount"),k)
call SaveEffectHandle(H,h,StringHash("avatareffect"),AddSpecialEffectTarget("Abilities\\Spells\\Other\\Doom\\DoomTarget.mdl", u, "origin"))
call he[a].bonus()
call TimerStart(t,20,false,function avatar)
endif

if GetSpellAbilityId()=='A047' then
call IssueTargetOrderById(v, 851983, u )
endif

if GetSpellAbilityId()=='A048' then
set he[a].damagex=he[a].damagex-LoadInteger(H,StringHash("aggress"),a)
call SaveInteger(H,StringHash("aggress"),a,0)
if LoadInteger(H,StringHash("defense"),a)==0 then
set k=2*i
set he[a].armorx=he[a].armorx+k
call SaveInteger(H,StringHash("defense"),a,k)
call DisplayTextToPlayer(Player(a),.5,0,text[90])
else
set he[a].armorx=he[a].armorx-LoadInteger(H,StringHash("defense"),a)
call SaveInteger(H,StringHash("defense"),a,0)
call DisplayTextToPlayer(Player(a),.5,0,text[91])
endif
call he[a].bonus()
endif

if GetSpellAbilityId()=='A049' then
set he[a].armorx=he[a].armorx-LoadInteger(H,StringHash("defense"),a)
call SaveInteger(H,StringHash("defense"),a,0)
if LoadInteger(H,StringHash("aggress"),a)==0 then
set k=5*i
set he[a].damagex=he[a].damagex+k
call SaveInteger(H,StringHash("aggress"),a,k)
call he[a].bonus()
call DisplayTextToPlayer(Player(a),.5,0,text[92])
else
set he[a].damagex=he[a].damagex-LoadInteger(H,StringHash("aggress"),a)
call SaveInteger(H,StringHash("aggress"),a,0)
call he[a].bonus()
call DisplayTextToPlayer(Player(a),.5,0,text[93])
endif
endif


if GetSpellAbilityId()=='A040' then
set t=CreateTimer()
set h=GetHandleId(t)
set k=20+5*i
set he[a].armorx=k+he[a].armorx
call SaveInteger(H,h,StringHash("wall0"),a)
call SaveInteger(H,h,StringHash("wall1"),k)
call SaveEffectHandle(H,h,StringHash("walleffect"),AddSpecialEffectTarget("Abilities\\Spells\\Orc\\Voodoo\\VoodooAura.mdl", u, "origin"))
call he[a].bonus()
call TimerStart(t,10,false,function wall)
endif



if GetSpellAbilityId()=='A043' then
set t=CreateTimer()
set h=GetHandleId(t)
call UnitAddAbility(u,'A045')
call SaveInteger(H,h,StringHash("retaliation"),a)
set k=8+2*i
call SaveEffectHandle(H,h,StringHash("retaeffect"),AddSpecialEffectTarget("Abilities\\Spells\\NightElf\\ThornsAura\\ThornsAura.mdl", u, "origin"))
call TimerStart(t,k,false,function retaliation)
endif


if GetSpellAbilityId()=='A101' then
set ia=a
call GroupClear(bj_lastCreatedGroup)
call GroupEnumUnitsInRange(bj_lastCreatedGroup,GetUnitX(u),GetUnitY(u),200,Condition(function isenemy))
set r=i*20+mob[a].damage
set ra=r
set ua=u
call ForGroup(bj_lastCreatedGroup,function wind)
call GroupClear(bj_lastCreatedGroup)
endif

if GetSpellAbilityId()=='A102' then
if GetUnitStatePercent(v,ConvertUnitState(0),ConvertUnitState(1))<30 then
set r=i*50+mob[a].damage
call mob[a].dama(v,r,1)
endif
endif

if GetSpellAbilityId()=='A104' then
set r=i*50+mob[a].damage
call mob[a].dama(v,r,1)
endif

set u=null
set v=null
set t=null
endfunction



endlibrary



library paladin requires sys

function paladin takes nothing returns nothing
local integer a=GetPlayerId(GetTriggerPlayer())
local unit u=GetTriggerUnit()
local unit v=GetSpellTargetUnit()
local integer i=GetUnitAbilityLevel(u,GetSpellAbilityId())
local real y=0

if GetSpellAbilityId()=='A200' then
set y=i*200+mob[a].spell*2
call mob[a].dama(v,y,5)
endif

if GetSpellAbilityId()=='A04W' then
set y=i*100+mob[a].spell
if IsUnitEnemy(v, Player(a)) then
call mob[a].dama(v,y,4)
else
set y=i*100+mob[a].spell*2
call mob[a].dama(v,y,5)
endif
endif

if GetSpellAbilityId()=='A203' then
if li("command",a)==1 then
set y=i*40+mob[a].spell
call mob[a].dama(v,y,4)
endif
if li("command",a)==2 then
set y=i*40+mob[a].damage
call mob[a].dama(v,y,2)
endif
endif

if GetSpellAbilityId()=='A201' then
call si("command",a,1)
call DisplayTextToPlayer(Player(a),.5,0,text[94])
endif
if GetSpellAbilityId()=='A202' then
call si("command",a,2)
call DisplayTextToPlayer(Player(a),.5,0,text[95])
endif
set u=null
set v=null

endfunction


endlibrary


library shaman  needs sys

function healchain takes nothing returns nothing
call mob[ia].dama(GetEnumUnit(),ra,5)
endfunction

function shaman takes nothing returns nothing
local unit u=GetTriggerUnit()
local unit v=GetSpellTargetUnit()
local integer a=GetPlayerId(GetOwningPlayer(u))
local integer b=GetPlayerId(GetOwningPlayer(v))
local integer i=GetUnitAbilityLevel(u,GetSpellAbilityId())
local integer k=0
local real r=0

if GetSpellAbilityId()=='A05V' then
if GetPlayerState(Player(a), PLAYER_STATE_RESOURCE_GOLD) >=50*GetHeroLevel(mob[a].u) then
call ReviveHero(mob[a].u,mob[a].x,mob[a].y,true )
set k=GetHandleId(he[a].revive)
call DestroyTimer(he[a].revive)
call DestroyTimerDialog(he[a].td)
call FlushChildHashtable(H,k)
set mob[a].b=true
call SetUnitLifePercentBJ(mob[a].u, 30.00 )
call SetUnitManaPercentBJ(mob[a].u, 30.00 )
call RemoveUnit(u)
    call DisplayTextToPlayer(Player(a),.5,0,text[96])
    call SetPlayerState(Player(a), ConvertPlayerState(1), GetPlayerState(Player(a),ConvertPlayerState(1))-100*GetHeroLevel(mob[a].u))
    call SaveInteger(H,StringHash("gold"),a,LoadInteger(H,StringHash("gold"),a)-100*GetHeroLevel(mob[a].u))
    else
    call DisplayTextToPlayer(Player(a),.5,0,text[23]+I2S(100*GetHeroLevel(mob[a].u))+text[97])
endif
endif


if GetSpellAbilityId()=='A042' then
if GetUnitTypeId(v)=='n02V' then
call ReviveHero(mob[b].u,GetUnitX(u), GetUnitY(u), true )
set mob[b].b=true
set k=GetHandleId(he[a].revive)
call DestroyTimer(he[a].revive)
call DestroyTimerDialog(he[a].td)
call FlushChildHashtable(H,k)
call SetUnitLifePercentBJ(mob[b].u, 30.00 )
call SetUnitManaPercentBJ(mob[b].u, 30.00 )
call RemoveUnit(v)
else
    call DisplayTextToPlayer(Player(a),.5,0,text[98])
endif
endif


if GetSpellAbilityId() == 'A04K' then
set r=40*i+mob[a].spell
call mob[a].dama(v,r,3)
endif

if GetSpellAbilityId()=='A301' then
set r=i*160+mob[a].spell*2
call mob[a].dama(v,r,5)
endif

if GetSpellAbilityId()=='A302' then
set ia=a
call GroupClear(bj_lastCreatedGroup)
call GroupEnumUnitsInRange(bj_lastCreatedGroup,GetUnitX(v),GetUnitY(v),600,Condition(function isally))
set r=2*mob[a].spell+500*i
set ra=r
set ua=u
call ForGroup(bj_lastCreatedGroup,function healchain)
call GroupClear(bj_lastCreatedGroup)
endif

set u=null
set v=null
endfunction


endlibrary



library hunter needs sys



function viper takes nothing returns nothing
local timer t=GetExpiredTimer()
local integer x=GetHandleId(t)
local unit v=LoadUnitHandle(H,x,StringHash("viperv"))
local unit u=LoadUnitHandle(H,x,StringHash("viperu"))
local integer a=LoadInteger(H,x,StringHash("vipera"))
local integer h=GetHandleId(v)
local integer y=LoadInteger(H,h,StringHash("viperx"))
local integer z=LoadInteger(H,h,StringHash("vipery"))
local real r=LoadReal(H,h,StringHash("vipers"))
if y==z or IsUnitType(v, UNIT_TYPE_DEAD) == true or GetUnitAbilityLevel(v, 'B003') == 0 then
call FlushChildHashtable(H,x)
call DestroyTimer(t)
else
call mob[a].dama(v,r,3)
call SaveInteger(H,h,StringHash("viperx"),y+1)
endif
set t=null
set u=null
set v=null
endfunction

function hunter takes nothing returns nothing
local unit u=GetTriggerUnit()
local unit v=GetSpellTargetUnit()
local integer a=GetPlayerId(GetOwningPlayer(u))
local integer b=GetPlayerId(GetOwningPlayer(v))
local integer c=GetUnitTypeId(v)
local integer i=GetUnitAbilityLevel(u,GetSpellAbilityId())
local integer k=0
local real r=0
local integer h=0
local timer t

if GetSpellAbilityId() == 'A404' then
set r=20*i+mob[a].damage
call mob[a].dama(v,r,1)
endif

if GetSpellAbilityId() == 'A405' then
set r=300*i+mob[a].damage
call mob[a].dama(v,r,1)
endif

if GetSpellAbilityId() == 'A406' then
set r=50*i+mob[a].damage
call mob[a].dama(v,r,1)
endif

if GetSpellAbilityId() == 'A407' then
set r=40*i+mob[a].spell
call mob[a].dama(v,r,3)
endif

if GetSpellAbilityId() == 'A05S' then
if GetUnitAbilityLevel(v, 'B003') > 0 then
set h=GetHandleId(v)
set t=LoadTimerHandle(H,h,StringHash("vipert"))
set h=GetHandleId(t)
call FlushChildHashtable(H,h)
call DestroyTimer(t)
endif
set r=20*i+mob[a].spell*.3
set t=CreateTimer()
set h=GetHandleId(t)
call SaveUnitHandle(H,h,StringHash("viperv"),v)
call SaveUnitHandle(H,h,StringHash("viperu"),u)
call SaveInteger(H,h,StringHash("vipera"),a)
set h=GetHandleId(v)
call sx("vipery",h,5)
call sx("viperx",h,0)
call sy("vipers",h,r)
call TimerStart(t,3,true,function viper)
endif

if GetSpellAbilityId() == 'A401' then
set k=he[a].petnow
set k=li("unitid",petid[20*k+a])
if he[a].peton then
if mob[a+20].b==false then
call DisplayTextToPlayer(Player(a),.5,0,text[99])
set mob[a+20].u=CreateUnit(Player(a),k,GetUnitX(u),GetUnitY(u),0)
call mob[a+20].born(mob[a+20].u)
call SetUnitLifePercentBJ(mob[a+20].u, 30.00 )
call SetUnitManaPercentBJ(mob[a+20].u, 50.00 )
call TriggerRegisterUnitEvent(damageinit, mob[a+20].u, EVENT_UNIT_DAMAGED )
call TriggerRegisterUnitEvent(mobcast,mob[a+20].u,EVENT_UNIT_SPELL_EFFECT)
call TriggerRegisterUnitEvent(petrez, mob[a+20].u, EVENT_UNIT_DEATH )
set mob[a+20].b=true
call UnitAddAbility(mob[a+20].u,'A402')
call UnitAddAbility(mob[a+20].u,'A403')
call UnitAddAbility(mob[a+20].u,'Aeth')
call BlzSetUnitArmor(mob[a+20].u,0)

if IsUnitType(mob[a+20].u, UNIT_TYPE_ANCIENT) == true then
call UnitRemoveType(mob[a+20].u, UNIT_TYPE_ANCIENT )
endif
else
call DisplayTextToPlayer(Player(a),.5,0,text[100])
endif
else
call DisplayTextToPlayer(Player(a),.5,0,text[101])
endif
endif

if GetSpellAbilityId() == 'A400' then
if GetPlayerController(Player(b)) == MAP_CONTROL_USER then
call DisplayTextToPlayer(Player(a),.5,0,text[102])
else
if he[a].peton==false then
set h=he[a].petnum
if h<3 then
set k=li("unitclass",c)
if GetRandomInt(1,1000000)<li("petrate",k) then
call DisplayTextToPlayer(Player(a),.5,0,text[103])
set k=GetHandleId(v)
set k=LoadInteger(H,k,StringHash("index"))
set mob[k].b=false
set ia=1
call SetUnitOwner(v, Player(a), true )
call sh(v,"index",20+a)
call TriggerRegisterUnitEvent(petrez, v, EVENT_UNIT_DEATH )
set mob[a+20].b=true
set he[a].peton=true
call UnitAddAbility(v,'Aeth')
call UnitAddAbility(v,'A402')
call UnitAddAbility(v,'A403')
call BlzSetUnitArmor(v,0)
set mob[a+20].u=v
    if IsUnitType(mob[a+20].u, UNIT_TYPE_ANCIENT) == true then
    call UnitRemoveType(mob[a+20].u, UNIT_TYPE_ANCIENT )
    endif
set k=li("unitorder",c)
set he[a].petnum=h+1
set h=he[a].petnow
set petid[20*h+a]=k
else
call DisplayTextToPlayer(Player(a),.5,0,text[104])
endif
else
call DisplayTextToPlayer(Player(a),.5,0,text[105])
endif
else
call DisplayTextToPlayer(Player(a),.5,0,text[106])
endif
endif
endif

set u=null
set v=null
set t=null
endfunction
endlibrary

library druid

function druid takes nothing returns nothing
endfunction
endlibrary


library rogue needs sys

function evasion takes nothing returns nothing
local timer t=GetExpiredTimer()
local integer h=GetHandleId(t)
local integer a=LoadInteger(H,h,StringHash("evasion0"))
local real r=LoadReal(H,h,StringHash("evasion1"))
call DestroyEffect( LoadEffectHandle(H,h,StringHash("evasioneffect")))
call FlushChildHashtable(H,h)
call DestroyTimer(t)
set t=null
endfunction

function rogue takes nothing returns nothing
local unit u=GetTriggerUnit()
local unit v=GetSpellTargetUnit()
local integer a=GetPlayerId(GetOwningPlayer(u))
local integer i=GetUnitAbilityLevel(u,GetSpellAbilityId())
local real r=0
local integer h=0
local timer t

if GetSpellAbilityId() == 'A03J' then
set r=20*i+mob[a].damage
call mob[a].dama(v,r,1)
endif

if GetSpellAbilityId() == 'A03M' then
set r=50*i+mob[a].damage
call mob[a].dama(v,r,1)
endif 

if GetSpellAbilityId()=='A04J' then
set t=CreateTimer()
set h=GetHandleId(t)
set r=0.2+0.05*i
call SaveInteger(H,h,StringHash("evasion0"),a)
call SaveReal(H,h,StringHash("evasion1"),r)
call SaveEffectHandle(H,h,StringHash("evasioneffect"),AddSpecialEffectTarget("Abilities\\Spells\\NightElf\\Immolation\\ImmolationTarget.mdl", u, "origin"))
call TimerStart(t,15,false,function evasion)
endif


set u=null
set v=null
set t=null
endfunction
endlibrary


library warlock
function warlock takes nothing returns nothing
endfunction
endlibrary


library priest needs sys

function renew takes nothing returns nothing
local timer t=GetExpiredTimer()
local integer x=GetHandleId(t)
local unit v=LoadUnitHandle(H,x,StringHash("renewv"))
local unit u=LoadUnitHandle(H,x,StringHash("renewu"))
local integer h=GetHandleId(v)
local integer y=LoadInteger(H,h,StringHash("renewx"))
local integer z=LoadInteger(H,h,StringHash("renewy"))
local integer a=LoadInteger(H,h,StringHash("renewa"))
local real r=LoadReal(H,h,StringHash("renews"))
call mob[a].dama(v,r,5)
call SaveInteger(H,h,StringHash("renewx"),y+1)
if y==z or IsUnitType(v, UNIT_TYPE_DEAD) == true or GetUnitAbilityLevel(v, 'B002') == 0 then
call FlushChildHashtable(H,x)
call DestroyTimer(t)
endif
set t=null
set u=null
set v=null
endfunction

function pain takes nothing returns nothing
local timer t=GetExpiredTimer()
local integer x=GetHandleId(t)
local unit v=LoadUnitHandle(H,x,StringHash("painv"))
local unit u=LoadUnitHandle(H,x,StringHash("painu"))
local integer a=LoadInteger(H,x,StringHash("paina"))
local integer h=GetHandleId(v)
local integer y=LoadInteger(H,h,StringHash("painx"))
local integer z=LoadInteger(H,h,StringHash("painy"))
local real r=LoadReal(H,h,StringHash("pains"))
call mob[a].dama(v,r,3)
call SaveInteger(H,h,StringHash("painx"),y+1)
if y==z or IsUnitType(v, UNIT_TYPE_DEAD) == true or GetUnitAbilityLevel(v, 'B004') == 0 then
call FlushChildHashtable(H,x)
call DestroyTimer(t)
endif
set t=null
set u=null
set v=null
endfunction

function priest takes nothing returns nothing
local unit u=GetTriggerUnit()
local unit v=GetSpellTargetUnit()
local integer a=GetPlayerId(GetOwningPlayer(u))
local integer b=GetPlayerId(GetOwningPlayer(v))
local integer i=GetUnitAbilityLevel(u,GetSpellAbilityId())
local integer h=0
local real r=0
local timer t

if GetSpellAbilityId()=='A04A' then
set r=i*180+mob[a].spell*2
call mob[a].dama(v,r,5)
endif

if GetSpellAbilityId()=='A05R' then
set r=i*30+mob[a].spell
call mob[a].dama(v,r,4)
endif

if GetSpellAbilityId() == 'A05Y' then
if GetUnitAbilityLevel(v, 'B002') > 0 then
set h=GetHandleId(v)
set t=LoadTimerHandle(H,h,StringHash("renewt"))
set h=GetHandleId(t)
call FlushChildHashtable(H,h)
call DestroyTimer(t)
endif
set r=60*i+mob[a].spell*.4
set t=CreateTimer()
set h=GetHandleId(t)
call SaveUnitHandle(H,h,StringHash("renewv"),v)
call SaveUnitHandle(H,h,StringHash("renewu"),u)
set h=GetHandleId(v)
call sx("renewy",h,5)
call sx("renewx",h,0)
call sy("renews",h,r)
call TimerStart(t,3,true,function renew)
endif

if GetSpellAbilityId() == 'A062' then
if GetUnitAbilityLevel(v, 'B004') > 0 then
set h=GetHandleId(v)
set t=LoadTimerHandle(H,h,StringHash("paint"))
set h=GetHandleId(t)
call FlushChildHashtable(H,h)
call DestroyTimer(t)
endif
set r=25*i+mob[a].spell*.4
set t=CreateTimer()
set h=GetHandleId(t)
call SaveUnitHandle(H,h,StringHash("painv"),v)
call SaveUnitHandle(H,h,StringHash("painu"),u)
set h=GetHandleId(v)
call sx("painy",h,6)
call sx("painx",h,0)
call sy("pains",h,r)
call TimerStart(t,3,true,function pain)
endif


endfunction
endlibrary


library mage  needs sys

function frost takes nothing returns nothing
set ub=CreateUnit(Player(ia),'e000',GetUnitX(ua),GetUnitY(ua),0)
call UnitApplyTimedLife(ub, 'BHwe', 1.00 )
call ShowUnit(ub, false)
call UnitAddAbility(ub, 'A065' )
call SetUnitAbilityLevel(ub,'A065',ib)
call IssueTargetOrderById( ub, 852075, GetEnumUnit())
call mob[ia].dama(GetEnumUnit(),ra,3)
endfunction

function blink takes nothing returns nothing
local timer t=GetExpiredTimer()
local integer h=GetHandleId(t)
local unit u=LoadUnitHandle(H,h,StringHash("blinku"))
local integer x=LoadInteger(H,h,StringHash("blinkx"))
local integer y=LoadInteger(H,h,StringHash("blinky"))
local integer a=LoadInteger(H,h,StringHash("blinka"))
if x==y  then
call FlushChildHashtable(H,h)
call DestroyTimer(t)
call PanCameraToTimedForPlayer(Player(a),GetUnitX(u),GetUnitY(u),0)
else
call SetUnitPosition(u, GetUnitX(u)+CosBJ(GetUnitFacing(u))*30,  GetUnitY(u)+SinBJ(GetUnitFacing(u))*30 )
call SaveInteger(H,h,StringHash("blinkx"),x+1)
endif
set t=null
set u=null
endfunction


function nova takes nothing returns nothing
set ub=CreateUnit(Player(ia),'e000',GetUnitX(ua),GetUnitY(ua),0)
call UnitApplyTimedLife(ub, 'BHwe', 1.00 )
call ShowUnit(ub, false)
call UnitAddAbility(ub, 'A04Y' )
call SetUnitAbilityLevel(ub,'A04Y',ib)
call IssueTargetOrderById( ub, 852106, GetEnumUnit())
call mob[ia].dama(GetEnumUnit(),ra,3)
endfunction

function mage takes nothing returns nothing
local unit u=GetTriggerUnit()
local unit v=GetSpellTargetUnit()
local integer a=GetPlayerId(GetOwningPlayer(u))
local integer i=GetUnitAbilityLevel(u,GetSpellAbilityId())
local real r=0
local timer t
local integer h

if GetSpellAbilityId() == 'A067' then
call dummy(a,u)
call UnitAddAbility(ub, 'A04X' )
call IssueTargetOrderById(ub, 852075, v )
set r=30*i+mob[a].spell
call mob[a].dama(v,r,3)
endif

if GetSpellAbilityId() == 'A063' then
set t=CreateTimer()
set h=GetHandleId(t)
call SaveUnitHandle(H,h,StringHash("blinku"),u)
call SaveInteger(H,h,StringHash("blinky"),10+i)
call SaveInteger(H,h,StringHash("blinka"),a)
call SaveInteger(H,h,StringHash("blinkx"),0)
call TimerStart(t,.01,true,function blink)
endif

if GetSpellAbilityId()=='A064' then
set ia=a
call GroupClear(bj_lastCreatedGroup)
call GroupEnumUnitsInRange(bj_lastCreatedGroup,GetUnitX(v),GetUnitY(v),400,Condition(function isenemy))
set r=i*30+mob[a].spell
set ra=r
set ua=u
set ib=i
call ForGroup(bj_lastCreatedGroup,function frost)
call GroupClear(bj_lastCreatedGroup)
endif

if GetSpellAbilityId()=='A03V' then
set ia=a
call GroupClear(bj_lastCreatedGroup)
call GroupEnumUnitsInRange(bj_lastCreatedGroup,GetUnitX(u),GetUnitY(u),600,Condition(function isenemy))
set r=i*10+mob[a].spell
set ra=r
set ua=u
set ib=i
call ForGroup(bj_lastCreatedGroup,function nova)
call GroupClear(bj_lastCreatedGroup)
endif

if GetSpellAbilityId() == 'A04Q' then
set r=50*i+mob[a].spell
call mob[a].dama(v,r,3)
endif
set t=null
set u=null
set v=null
endfunction
endlibrary




































//===========================================================================
// API
//===========================================================================
/*
BLZAPI
native BlzGetTriggerPlayerMouseX takes nothing returns real
native BlzGetTriggerPlayerMouseY takes nothing returns real
native BlzGetTriggerPlayerMousePosition takes nothing returns location
native BlzGetTriggerPlayerMouseButton takes nothing returns mousebuttontype
native BlzSetAbilityTooltip takes integer abilCode, string tooltip, integer level returns nothing
native BlzSetAbilityActivatedTooltip takes integer abilCode, string tooltip, integer level returns nothing
native BlzSetAbilityExtendedTooltip takes integer abilCode, string ExtendedTooltip, integer level returns nothing
native BlzSetAbilityActivatedExtendedTooltip takes integer abilCode, string ExtendedTooltip, integer level returns nothing
native BlzSetAbilityResearchTooltip takes integer abilCode, string researchTooltip, integer level returns nothing
native BlzSetAbilityResearchExtendedTooltip takes integer abilCode, string researchExtendedTooltip, integer level returns nothing
native BlzGetAbilityTooltip takes integer abilCode, integer level returns string
native BlzGetAbilityActivatedTooltip takes integer abilCode, integer level returns string
native BlzGetAbilityExtendedTooltip takes integer abilCode, integer level returns string
native BlzGetAbilityActivatedExtendedTooltip takes integer abilCode, integer level returns string
native BlzGetAbilityResearchTooltip takes integer abilCode, integer level returns string
native BlzGetAbilityResearchExtendedTooltip takes integer abilCode, integer level returns string
native BlzSetAbilityIcon takes integer abilCode, string iconPath returns nothing
native BlzGetAbilityIcon takes integer abilCode returns string
native BlzSetAbilityActivatedIcon takes integer abilCode, string iconPath returns nothing
native BlzGetAbilityActivatedIcon takes integer abilCode returns string
native BlzGetAbilityPosX takes integer abilCode returns integer
native BlzGetAbilityPosY takes integer abilCode returns integer
native BlzSetAbilityPosX takes integer abilCode, integer x returns nothing
native BlzSetAbilityPosY takes integer abilCode, integer y returns nothing
native BlzGetAbilityActivatedPosX takes integer abilCode returns integer
native BlzGetAbilityActivatedPosY takes integer abilCode returns integer
native BlzSetAbilityActivatedPosX takes integer abilCode, integer x returns nothing
native BlzSetAbilityActivatedPosY takes integer abilCode, integer y returns nothing
native BlzGetUnitMaxHP takes unit whichUnit returns integer
native BlzSetUnitMaxHP takes unit whichUnit, integer hp returns nothing
native BlzGetUnitMaxMana takes unit whichUnit returns integer
native BlzSetUnitMaxMana takes unit whichUnit, integer mana returns nothing
native BlzDeleteHeroAbility takes unit whichUnit, integer abilCode returns nothing
native BlzSetItemName takes item whichItem, string name returns nothing
native BlzSetItemDescription takes item whichItem, string name returns nothing
native BlzGetItemDescription takes item whichItem returns string
native BlzSetItemTooltip takes item whichItem, string name returns nothing
native BlzGetItemTooltip takes item whichItem returns string
native BlzSetItemExtendedTooltip takes item whichItem, string name returns nothing
native BlzGetItemExtendedTooltip takes item whichItem returns string
native BlzSetItemIconPath takes item whichItem, string name returns nothing
native BlzGetItemIconPath takes item whichItem returns string
native BlzSetUnitName takes unit whichUnit, string name returns nothing
native BlzSetHeroProperName takes unit whichUnit, string name returns nothing
native BlzGetUnitBaseDamage takes unit whichUnit, integer weaponIndex returns integer
native BlzSetUnitBaseDamage takes unit whichUnit, integer baseDamage, integer weaponIndex returns nothing
native BlzGetUnitDiceNumber takes unit whichUnit, integer weaponIndex returns integer
native BlzSetUnitDiceNumber takes unit whichUnit, integer diceNumber, integer weaponIndex returns nothing
native BlzGetUnitDiceSides takes unit whichUnit, integer weaponIndex returns integer
native BlzSetUnitDiceSides takes unit whichUnit, integer diceSides, integer weaponIndex returns nothing
native BlzGetUnitAttackCooldown takes unit whichUnit, integer weaponIndex returns real
native BlzSetUnitAttackCooldown takes unit whichUnit, real cooldown, integer weaponIndex returns nothing
native BlzSetSpecialEffectColorByPlayer takes effect whichEffect, player whichPlayer returns nothing
native BlzSetSpecialEffectColor takes effect whichEffect, integer r, integer g, integer b returns nothing
native BlzSetSpecialEffectAlpha takes effect whichEffect, integer alpha returns nothing
native BlzSetSpecialEffectScale takes effect whichEffect, real scale returns nothing
native BlzSetSpecialEffectPosition takes effect whichEffect, real x, real y, real z returns nothing
native BlzSetSpecialEffectHeight takes effect whichEffect, real height returns nothing
native BlzSetSpecialEffectTimeScale takes effect whichEffect, real timeScale returns nothing
native BlzSetSpecialEffectTime takes effect whichEffect, real time returns nothing
native BlzSetSpecialEffectOrientation takes effect whichEffect, real yaw, real pitch, real roll returns nothing
native BlzSetSpecialEffectYaw takes effect whichEffect, real yaw returns nothing
native BlzSetSpecialEffectPitch takes effect whichEffect, real pitch returns nothing
native BlzSetSpecialEffectRoll takes effect whichEffect, real roll returns nothing
native BlzSetSpecialEffectX takes effect whichEffect, real x returns nothing
native BlzSetSpecialEffectY takes effect whichEffect, real y returns nothing
native BlzSetSpecialEffectZ takes effect whichEffect, real z returns nothing
native BlzSetSpecialEffectPositionLoc takes effect whichEffect, location loc returns nothing
native BlzGetLocalSpecialEffectX takes effect whichEffect returns real
native BlzGetLocalSpecialEffectY takes effect whichEffect returns real
native BlzGetLocalSpecialEffectZ takes effect whichEffect returns real
native BlzGetUnitArmor takes unit whichUnit returns real
native BlzSetUnitArmor takes unit whichUnit, real armorAmount returns nothing
native BlzUnitHideAbility takes unit whichUnit, integer abilId, boolean flag returns nothing
native BlzUnitDisableAbility takes unit whichUnit, integer abilId, boolean flag, boolean hideUI returns nothing
native BlzUnitCancelTimedLife takes unit whichUnit returns nothing
native BlzIsUnitSelectable takes unit whichUnit returns boolean
native BlzIsUnitInvulnerable takes unit whichUnit returns boolean
native BlzUnitInterruptAttack takes unit whichUnit returns nothing
native BlzGetUnitCollisionSize takes unit whichUnit returns real
native BlzGetAbilityManaCost takes integer abilId, integer level returns integer
native BlzGetAbilityCooldown takes integer abilId, integer level returns real
native BlzSetUnitAbilityCooldown takes unit whichUnit, integer abilId, integer level, real cooldown returns nothing
native BlzGetUnitAbilityCooldown takes unit whichUnit, integer abilId, integer level returns real
native BlzGetUnitAbilityCooldownRemaining takes unit whichUnit, integer abilId returns real
native BlzEndUnitAbilityCooldown takes unit whichUnit, integer abilCode returns nothing
native BlzGetUnitAbilityManaCost takes unit whichUnit, integer abilId, integer level returns integer
native BlzGetLocalUnitZ takes unit whichUnit returns real
native BlzDecPlayerTechResearched takes player whichPlayer, integer techid, integer levels returns nothing
native BlzSetEventDamage takes real damage returns nothing
*/
//===========================================================================
// miscdata
//===========================================================================




library data initializer init requires sys
//===========================================================================
// data
//===========================================================================
//save:save or load
//load:load state
//loads:load location

function addtimeActions takes nothing returns nothing
local integer i=0
local integer a=GetPlayerId(GetTriggerPlayer())
local integer j=IAbsBJ(StringHash(I2S(he[a].timekey)))
local string s=SubString(GetEventPlayerChatString(), 9, 15)
local string v=SubString(I2S(j), 0, 6)
if S2I(s)==S2I(v) then
set he[a].gametime=he[a].gametime+4000
set i=GetRandomInt(100000,999999)
set he[a].timekey=i
call he[a].mbupdate()
else
call DisplayTextToPlayer(Player(a),.5,0,text[0])
endif
endfunction

function data takes nothing returns nothing
local integer a=GetPlayerId(GetTriggerPlayer())
if GetPlayerSlotState(Player(a)) == PLAYER_SLOT_STATE_PLAYING then
if GetSpellAbilityId() == 'A054' then
set he[a].save=true
call DialogSetMessage( he[a].data, text[1])
call DialogDisplay( Player(a), he[a].data, true )
endif
endif
endfunction

function storedata takes integer a returns nothing
local integer k
local integer j
local player p=Player(a)
local integer i=0
local unit u
local integer c=0
call save(p,"gold",0,he[a].gold)
call save(p,"lumber",1,he[a].lumber)
call save(p,"food",2,he[a].food)
call save(p,"version",3,2)
call save(p,"gametime",4,he[a].gametime)
call save(p,"timekey",5,he[a].timekey)
//pack
        set j = 0
        loop
        exitwhen j >sys.pack
        set c=20*j+a
        if pack[c].b then
        set i=lh(pack[c].it,"order")
        else
        set i=0
        endif
        call save(p,"pack",6+j,i)
        set j =j+1
        endloop
//bag
        set j = 0
        loop
            exitwhen j > sys.bag
            set c=20*j+a
            if bag[c].b then
            set i=lh(bag[c].it,"order")
            set k=GetItemCharges(bag[c].it)
            else
            set i=0
            set k=0
            endif
            call save(p,"bag",36+j,i)
            call save(p,"bags",42+j,k)
            set j = j + 1
        endloop
        call savex(p,"wow","main",47)
    set u=null
    set p=null
endfunction

function savedata takes integer a,integer n returns nothing
local integer j
local player p=Player(a)
local integer i=0
local unit u
local integer c=0
if n<3 then

//hero
call save(p,"order",0,mob[a].order)
set j=0
loop
exitwhen j>5
set i=skillid[20*j+a]
call save(p,"skillid",j+1,i)
set i=skilllevel[20*j+a]
call save(p,"skilllevel",j+7,i)
set j=j+1
endloop
set i=he[a].skillnum0
call save(p,"skillnum0",13,i)
set i=he[a].skillnum1
call save(p,"skillnum1",14,i)
call save(p,"rideskill",15,he[a].rideskill)
call save(p,"xp",16,he[a].xp)
call save(p,"herolvl",17,GetHeroLevel(mob[a].u))
call save(p,"homex",18,mob[a].x)
call save(p,"homey",19,mob[a].y)
//gear
        set j = 0
        loop
        exitwhen j >5
        set c=20*j+a
        if gear[c].b then 
        set i=lh(gear[c].it,"order")
        else
        set i=0
        endif
        call save(p,"gear",20+j,i)
        set j =j+1
        endloop
//pet
        call save(p,"petnow",26,he[a].petnow)
        set j = 0
        loop
            exitwhen j > 2
            set i=petid[20*j+a]
            call save(p,"pet",27+j,i)
            set j = j + 1
        endloop
//quest 
        set j = 0
        loop
        exitwhen j >4
        set c=20*j+a
        call save(p,"questx"+I2S(j),30+j,qu[c].x)
        call save(p,"questy"+I2S(j),35+j,qu[c].y)     
        call save(p,"quests"+I2S(j),40+j,qu[c].s)
        set j=j+1
        endloop
        call savex(p,"wow","hero"+I2S(n),44)
call DisplayTimedTextToPlayer( p, .5, 0, 10.00,  text[2]+I2S(n)+text[3])
set he[a].load=true
set he[a].loads=n
endif
    set u=null
    set p=null
endfunction


function readdata takes integer a returns nothing
local integer j
local player p=Player(a)
local integer i=0
local unit u=mob[a].u
local integer x
local integer k
local integer c

call loadx(p,"wow","main",47)
set he[a].gold=load(p,"gold",0)
set he[a].lumber=load(p,"lumber",1)
set he[a].food=load(p,"food",2)
set he[a].vers=load(p,"version",3)
set he[a].gametime=load(p,"gametime",4)
set he[a].timekey=load(p,"timekey",5)
call SetPlayerState(p, ConvertPlayerState(1), he[a].gold)
call SetPlayerState(p, ConvertPlayerState(2), he[a].lumber)

//pack
        set j = 0
        loop
        exitwhen j >sys.pack
        set c=j*20+a
        set x=load(p,"pack",6+j)
        if x!=0 then
        set i=LoadInteger(H,StringHash("itemid"),x)
        set pack[c].it =CreateItem(i,GetUnitX(u),GetUnitY(u))
        call sh(pack[c].it,"order",x)
        call SetItemPosition(pack[c].it, 0,0 )
        call SetItemVisible(pack[c].it, false)
        set pack[c].b=true
        else
        set pack[c].b=false
        endif
        set j=j+1
        endloop


set he[a].lumber=load(p,"lumber",1)
    
//bag
        set j = 0
        loop
            exitwhen j > sys.bag
            set c=j*20+a
            set x=load(p,"bag",36+j)
            if x!=0 then
        set i=li("itemid",x)
        set bag[c].it =CreateItem(i,GetUnitX(u),GetUnitY(u))
        call sh(bag[c].it,"order",x)        
        call SetItemPosition(bag[c].it, 0,0 )
        call SetItemVisible(bag[c].it, false)
        set bag[c].b=true
        set i=load(p,"pack",42+j)
        call SetItemCharges( bag[c].it, i )
        else
        set bag[c].b=false
        endif
        set j = j + 1
        endloop
call DisplayTimedTextToPlayer(p,.5, 0, 10.00,  text[4])
set p=null
set u=null
endfunction


function loaddata takes integer a,integer n returns nothing
local integer j
local player p=Player(a)
local integer i=0
local unit u
local integer x
local integer y
local integer c=0
if n<3 then
if datastate[20*n+a]==1 then
    call loadx(p,"wow","hero"+I2S(n),44)
    set he[a].load=true
    set he[a].loads=n
    call DisplayTimedTextToPlayer( p, .5, 0, 10.00,  text[5]+I2S(n)+text[3] )
    //hero
set x=load(p,"order",0)
set i=LoadInteger(H,StringHash("unitid"),x)
set mob[a].x=load(p,"homex",18)
set mob[a].y=load(p,"homey",19)
set u=CreateUnit(p, i,mob[a].x, mob[a].y ,0)
call mob[a].born(u)
call he[a].born(u)
call heroevent(u)
call PanCameraToTimedForPlayer(p,GetUnitX(u),GetUnitY(u),0)
call SelectUnitForPlayerSingle(u, p )
//skill
set j=0
loop
exitwhen j>5
set x=load(p,"skillid",1+j)
if x!=0 then
set i=LoadInteger(H,StringHash("skillid"),x)
call UnitAddAbility(u,i)
set skillid[20*j+a]=x
set y=load(p,"skilllevel",7+j)
set skilllevel[20*j+a]=y
call SetUnitAbilityLevel(u,i,y)
endif
set j=j+1
endloop
set he[a].skillnum0=load(p,"skillnum0",13)
set he[a].skillnum1=load(p,"skillnum1",14)
set x=load(p,"rideskill",15)
if x==0 then
call SetPlayerAbilityAvailable(Player(a),'A053',false)
else
call SetPlayerAbilityAvailable(Player(a),'A053',true)
endif
set he[a].rideskill=x
set he[a].xp=load(p,"xp",16)
call AddHeroXP( u, he[a].xp, false )
//gear
        set j = 0
        loop
        exitwhen j >5
        set c=20*j+a
        set x=load(p,"gear",20+j)
        if x!=0 then
        set i=LoadInteger(H,StringHash("itemid"),x)
        set gear[c].it =CreateItem(i,GetUnitX(u),GetUnitY(u))
        call sh(gear[c].it,"order",x)
        call SetItemPosition(gear[c].it, 0,0 )
        call SetItemVisible(gear[c].it, false)
        set gear[c].b=true
        else
        set gear[c].b=false
        endif
        set j=j+1
        endloop
    //bag
    call DisableTrigger(ai)    
    set j=0
    loop
    exitwhen j>5
    set c=20*j+a
    if bag[c].b then
    call UnitAddItem( mob[a].u, bag[c].it)  
    endif
    set j=j+1
    endloop
    call EnableTrigger(ai)    
    call he[a].stat()
    //pet    
    set he[a].petnum=0
    set he[a].petnow=load(p,"petnow",26)
    set j=0
    loop
    exitwhen j>2
    set x=load(p,"pet",27+j)
    if x!=0 then
    set petid[20*j+a]=x
    set he[a].petnum=he[a].petnum+1
    endif
    set j=j+1
    endloop
    set y=petid[20*he[a].petnow+a]
    set i=li("unitid",y)
    if he[a].class==24 then
    if y>0 then
    call fh(mob[a+20].u)
    call RemoveUnit(mob[a+20].u)
    set mob[a+20].u=CreateUnit(Player(a),i,GetUnitX(u),GetUnitY(u),0)
    set mob[a+20].b=true
    call mob[a+20].born(mob[a+20].u)
    call TriggerRegisterUnitEvent(petdie, mob[a+20].u, EVENT_UNIT_DEATH )
    call TriggerRegisterUnitEvent(damageinit, mob[a+20].u, EVENT_UNIT_DAMAGED )
    call TriggerRegisterUnitEvent(mobcast,mob[a+20].u,EVENT_UNIT_SPELL_EFFECT)
    set he[a].peton=true
    call UnitAddAbility(mob[a+20].u,'A402')
    call UnitAddAbility(mob[a+20].u,'A403')
    call UnitAddAbility(mob[a+20].u,'Aeth')
    call BlzSetUnitArmor(mob[a+20].u,0)
    if IsUnitType(mob[a+20].u, UNIT_TYPE_ANCIENT) == true then
    call UnitRemoveType(mob[a+20].u, UNIT_TYPE_ANCIENT )
    endif    
    endif
    endif
//quest


    set j=0
    loop
    exitwhen j>4
    set c=20*j+a
    set qu[c].x=load(p,"questx",30+j)
    set qu[c].y=load(p,"questy",35+j)
    set qu[c].s=load(p,"quests",40+j)
    call qu[c].load(a)
    set j=j+1
    endloop
    call he[a].mbupdate()
    else
    call DisplayTimedTextToPlayer( p, .5, 0, 10.00,text[6])
    call DialogDisplay(p,he[a].start,true)
    endif
    else
    call DialogDisplay(p,he[a].start,true)    
    endif
    set u=null
    set p=null
endfunction

function confirm takes nothing returns nothing
local integer k=GetHandleId(GetClickedButton())
local integer m=LoadInteger(H,k,0)
local integer a=GetPlayerId(GetTriggerPlayer())
local integer i=0
local integer j=he[a].loads
local integer n=he[a].choice
if m==1 then
if he[a].load then
if j==n then
call storedata(a)
call savedata(a,n)
else
call DisplayTimedTextToPlayer( Player(a), .5, 0, 10.00,text[7])
endif
else
call storedata(a)
call savedata(a,n)
endif
endif
endfunction

function sl takes nothing returns nothing
local integer k=GetHandleId(GetClickedButton())
local integer n=LoadInteger(H,k,0)
local integer a=GetPlayerId(GetTriggerPlayer())
local integer i=0
local integer j=he[a].loads

if he[a].save then
if he[a].load then
if j==n then
call storedata(a)
call savedata(a,n)
else
call DisplayTimedTextToPlayer( Player(a), .5, 0, 10.00, text[7] )
endif
else
if datastate[20*n+a]==1 then
set he[a].choice=n
call DialogSetMessage( he[a].confirm, text[8] )
call DialogDisplay( Player(a), he[a].confirm, true )
else
call storedata(a)
call savedata(a,n)
endif
endif
else
call loaddata(a,n)
endif
endfunction

function autosave1 takes nothing returns nothing
local integer a=GetPlayerId(GetEnumPlayer())
local integer n=he[a].loads
if GetPlayerSlotState(Player(a)) == PLAYER_SLOT_STATE_PLAYING and GetPlayerController(Player(a)) == MAP_CONTROL_USER then
call storedata(a)
if he[a].load then
call DisplayTimedTextToPlayer( Player(a), .5, 0, 10.00, text[9] )
call savedata(a,n)
endif
endif
endfunction

function autosave0 takes nothing returns nothing
call ForForce(sys.team,function autosave1)
endfunction

function pleave takes nothing returns nothing
local integer a=GetPlayerId(GetTriggerPlayer())
local item it
local integer i
local integer n=he[a].loads
call storedata(a)
if he[a].load then
call savedata(a,n)
endif
call ForceRemovePlayer(sys.team,GetTriggerPlayer())
call DisplayTimedTextToForce( sys.team, 10.00,  "|cffffff00" + GetPlayerName(GetTriggerPlayer()) + text[10])
    set i=0
        loop
        exitwhen i > 5
        set it=UnitItemInSlot(mob[a].u, i)
        call fh(it)
        call RemoveItem(it)
    set i=i+1
    endloop
set it=null
endfunction

function KGB takes nothing returns nothing
local trigger p=CreateTrigger()
local integer i=0
loop
exitwhen i>sys.pn
call TriggerRegisterPlayerChatEvent(p, Player(i), "-addtime", false )
set i=i+1
endloop
call TriggerAddAction(pl, function pleave)
call TriggerAddAction(p, function addtimeActions)
call TriggerAddAction(hostdata, function data )
set p=null
endfunction
private function init takes nothing returns nothing
call KGB()
endfunction
endlibrary



//===========================================================================
// text
//===========================================================================

library textinit needs sys

function settext0 takes nothing returns nothing
set text[0]="the cd-key is wrong!"
set text[1]="|c0000ff00pick the data location you want to store|r|n|c00ff0000care new data will cover old data!|r"
set text[2]="|cff00ff00save data "
set text[3]=" successfully!|r"
set text[4]="|cff00ff00read data successfully!|r"
set text[5]="|cff00ff00load data "
set text[6]="|cffff0000null!|r"
set text[7]="|cffffff00data location error!|r"
set text[8]="|c0000ffffconfirm to cover the old data?|r"
set text[9]="|cffffff00autosave every 5 min!|r"
set text[10]="left the game!|r"
set text[11]="shield"
set text[12]="weapon "
set text[13]="require level "
set text[14]="gold "
set text[15]="time is out!"
set text[16]="player "
set text[17]=" join group!"
set text[18]=" leave group!"
set text[19]="|c00ffff00your hero is dead!|r"
set text[20]=" is completed!"
set text[21]=" is failed!"
set text[22]="|cffffff00is awake!!|r"
set text[23]="|c0000ff00you need gold "
set text[24]=" to buy this stuff!|r"
set text[25]="|c0000ffffall system go!|r"
set text[26]="|c00ffff00you've learned higher rideskill already!|r"
set text[27]="|c00ffff00we need more gold,need 10S!|r"
set text[28]="|c00ffff00your hero level is too low,need to reach level 40!|r"
set text[29]="|c00ffff00gold not enough,need 100S!|r"
set text[30]="|c00ffff00level not enough,need lvl 60!|r"
set text[31]="|c00ffff00switch pet successfully!|r"
set text[32]="|c00ffff00you have no pet in current field!|r"
set text[33]="|c00ffff00only hunter can use the Beastiary!|r"
set text[34]=" to hire the gryphon!|r"
set text[35]="skill upgrade"
set text[36]=" C to learn the skill!"
set text[37]="hit maxlevel!"
set text[38]="you need to hit level "
set text[39]=" to learn the next level skill!"
set text[40]="you can only learn 4 common skills and 2 ulti skills"
set text[41]="learn skill"
set text[42]="you need 100C to learn the skill!"
set text[43]="you can only learn 2 ulti skills"
set text[44]="you need 1000C to learn the skill!"
set text[45]="YOU NEED TO HIT LEVEL 10 TO LEARN THIS SKILL!"
set text[46]="YOUR CLASS CANT LEARN THE SKILL!"
set text[47]="|c0000ffffget quest award:|r"
set text[48]="|c0000ff00BIND SUCCESSFULLY!|r"
set text[49]="|c00ff00ffclear all skills!|r"
set text[50]="collect "
set text[51]=" to show the questtip!|r"
set text[52]="|c0000ff00set camera distance to height "
set text[53]="|c0000ff00close movie mode"
set text[54]="|c0000ff00open movie mode"
set text[55]="|c00ff0000bag is open"
set text[56]="|c00ff0000gear is open"
set text[57]="|c00ff0000switch to pack "
set text[58]="|c00ff0000bag is full!|r"
set text[59]="|c00ff0000you have got the same type item already!|r"
set text[60]="|c00ff0000pack is full!|r"
set text[61]="kill "
set text[62]="|c0000ffffselect the data you want to read|r|n|c00ff0000note:you can just read once every game!|r"
set text[63]=" lvl|r"
set text[64]="|c0000ffffcancel|r"
set text[65]="instruction"
set text[66]="
B:switch gear and bag
G:switch packs
player can save three roles and share gold and packs
your quest order show as your player color when you are on muti play"
set text[67]="|c0000ffffmenu|r"
set text[68]="|c00ff00ffread data|r"
set text[69]="|c0000ff00create new|r"
set text[70]="|c0000ff00confirm|r"
set text[71]="|c0000ffffselect your hero class!|r"
set text[72]="|c0000ff00role info|r"
set text[73]="id"
set text[74]="spelldamage"
set text[75]="attackspeed"
set text[76]="movespeed"
set text[77]="key"
set text[78]="time"
set text[79]="stage"
set text[80]="ridespeed"
set text[81]="score"
set text[82]="quest 0"
set text[83]="quest 1"
set text[84]="quest 2"
set text[85]="quest 3"
set text[86]="quest 4"
set text[87]="|c0000fffftips:|r "
set text[88]="|c00ff00ffyou have abandon your pet!"
set text[89]="|c00ff0000your pet doesn't have enough mana!"
set text[90]="|c00ffff00defense stance activated"
set text[91]="|c00ffff00defense stance closed"
set text[92]="|c00ffff00aggress stance activated!"
set text[93]="|c00ffff00aggress stance closed"
set text[94]="|c00ffff00Seal of Righteousness actived!"
set text[95]="|c00ffff00Seal of Command actived!"
set text[96]="|c0000ff00release soul to graveyard!|r"
set text[97]=" to revive hero!"
set text[98]="|c00ffff00invalid target!|r"
set text[99]="|c00ffff00revive pet successfully!"
set text[100]="|c00ff00ffyou pet is still alive!"
set text[101]="|c00ff00ffyou have't actived one pet!"
set text[102]="|c00ff00ffthe creature is untrainable!"
set text[103]="|c00ff00ffcatch successfully"
set text[104]="|c00ff0000catch fail!"
set text[105]="|c00ff00ffyou can catch at most 3 pets!"
set text[106]="|c00ff00ffyou have actived one pet already!"

set text[107]="damage"
set text[108]="crit"
set text[109]="spellcrit"
set text[110]="trade"
set text[111]="petcost"
/*
set text[112]=
set text[113]=
set text[114]=
set text[115]=
set text[116]=
set text[117]=
set text[118]=
set text[119]=
set text[120]=
*/












endfunction

function settext1 takes nothing returns nothing



endfunction

function settext2 takes nothing returns nothing



endfunction
function settext10 takes nothing returns nothing
set text[0]="cd-key错误!"
set text[1]="|c0000ff00选择你的存档位置|r|n|c00ff0000注意新存档会覆盖旧存档!|r"
set text[2]="|cff00ff00保存存档 "
set text[3]=" 成功!|r"
set text[4]="|cff00ff00读取存档成功!|r"
set text[5]="|cff00ff00读取存档 "
set text[6]="|cffff0000无存档!|r"
set text[7]="|cffffff00存档位置错误!|r"
set text[8]="|c0000ffff确认覆盖旧存档?|r"
set text[9]="|cffffff00每5分钟自动保存存档!|r"
set text[10]="离开了游戏!|r"
set text[11]="盾牌"
set text[12]="武器 "
set text[13]="需要等级 "
set text[14]="金钱 "
set text[15]="游戏时间不足!"
set text[16]="玩家 "
set text[17]=" 加入了队伍!"
set text[18]=" 离开了队伍!"
set text[19]="|c00ffff00你的英雄死亡!|r"
set text[20]=" 完成!"
set text[21]=" 失败!"
set text[22]="|cffffff00苏醒了!!|r"
set text[23]="|c0000ff00你需要金钱 "
set text[24]=" 来购买该道具!|r"
set text[25]="|c0000ffff准备就绪!|r"
set text[26]="|c00ffff00你已经学习了更高级的骑术!|r"
set text[27]="|c00ffff00你需要更多金钱,需要10S!|r"
set text[28]="|c00ffff00你的英雄等级太低,需要达到40级!|r"
set text[29]="|c00ffff00金钱不足,需要100S!|r"
set text[30]="|c00ffff00等级不足,需要达到60级!|r"
set text[31]="|c00ffff00切换宠物成功!|r"
set text[32]="|c00ffff00该栏位无宠物!|r"
set text[33]="|c00ffff00只有猎人能使用兽栏!|r"
set text[34]=" 来雇佣狮鹫!|r"
set text[35]="技能升级成功"
set text[36]=" C来学习该技能!"
set text[37]="技能已达到最高等级!"
set text[38]="你需要达到等级 "
set text[39]=" 来学习下一级技能!"
set text[40]="你只能学习4个普通技能和1个普通技能!"
set text[41]="学习技能成功!"
set text[42]="你需要100C 来学习该技能!"
set text[43]="你只能学习一个特殊技能"
set text[44]="你需要1000C来学习该技能!"
set text[45]="你需要达到10级来学习该技能!"
set text[46]="你的职业不能学习该技能!"
set text[47]="|c0000ffff获得任务奖励:|r"
set text[48]="|c0000ff00炉石绑定成功!|r"
set text[49]="|c00ff00ff已遗忘所有技能!|r"
set text[50]="已收集 "
set text[51]=" 来显示任务提示!|r"
set text[52]="|c0000ff00设置镜头高度为 "
set text[53]="|c0000ff00关闭电影模式"
set text[54]="|c0000ff00开启电影模式"
set text[55]="|c00ff0000已切换到药水栏"
set text[56]="|c00ff0000已切换到装备栏"
set text[57]="|c00ff0000切换到背包 "
set text[58]="|c00ff0000背包满了!|r"
set text[59]="|c00ff0000你已经装备了同类物品!|r"
set text[60]="|c00ff0000仓库满了!|r"
set text[61]="已杀死 "
set text[62]="|c0000ffff选择你想要读取的存档|r|n|c00ff0000注意:每局游戏只能读取一次!|r"
set text[63]=" 等级|r"
set text[64]="|c0000ffff取消|r"
set text[65]="说明"
set text[66]="
B:切换装备栏和药水栏
G:切换背包栏
玩家可以存取3个角色,共享金钱和仓库
你的任务等级会显示为你的玩家颜色
set text[67]="|c0000ffff菜单|r"
set text[68]="|c00ff00ff读取存档|r"
set text[69]="|c0000ff00创建角色|r"
set text[70]="|c0000ff00确认|r"
set text[71]="|c0000ffff选择职业!|r"
set text[72]="|c0000ff00角色信息|r"
set text[73]="id"
set text[74]="法术伤害"
set text[75]="攻击速度"
set text[76]="移动速度"
set text[77]="密钥"
set text[78]="时间"
set text[79]="进度"
set text[80]="骑术"
set text[81]="积分"
set text[82]="主线 0"
set text[83]="主线 1"
set text[84]="主线 2"
set text[85]="主线 3"
set text[86]="主线 4"
set text[87]="|c0000ffff提示:|r "
set text[88]="|c00ff00ff你放生了宠物!"
set text[89]="|c00ff0000宠物魔法值不足!"
set text[90]="|c00ffff00防御姿态已激活!"
set text[91]="|c00ffff00防御姿态已关闭!"
set text[92]="|c00ffff00狂暴姿态已激活!"
set text[93]="|c00ffff00狂暴姿态已关闭!"
set text[94]="|c00ffff00正义圣印已激活!"
set text[95]="|c00ffff00命令圣印已激活!"
set text[96]="|c0000ff00已释放灵魂到墓地!|r"
set text[97]=" 来复活英雄!"
set text[98]="|c00ffff00无效目标!|r"
set text[99]="|c00ffff00复活宠物成功!"
set text[100]="|c00ff00ff您的宠物还没死!"
set text[101]="|c00ff00ff您还没有激活一个宠物!"
set text[102]="|c00ff00ff该生物无法被驯化!"
set text[103]="|c00ff00ff抓捕成功"
set text[104]="|c00ff0000抓捕失败!"
set text[105]="|c00ff00ff你最多只能抓捕3个宠物!"
set text[106]="|c00ff00ff你早已激活了一个宠物!"
set text[107]="物理伤害"
set text[108]="物理暴击率"
set text[109]="法术暴击率"
set text[110]="价格"
set text[111]="宠物花费"


endfunction

function textinit takes nothing returns nothing
if sys.lang==0 then
call settext0()
endif
if sys.lang==10 then
call settext10()
endif
endfunction

endlibrary



library rectstring needs sys

function setrs takes integer a,string b returns nothing
call SaveStr(H,StringHash("regionname"),a,b)
endfunction

function rsinitx takes nothing returns nothing
//ESCORT
call si("qxy",1018,1)
set qx[1]=-2420
set qy[1]=-14690
endfunction

function rsinit0 takes nothing returns nothing
call setrs(0,"|c000000ffElwynn Forest|r")            //1-10
call setrs(1,"|c000000ffWestfall|r")                 //10-20
call setrs(2,"|c00ff0000The Deadmines|r")            //20
call setrs(3,"|c000000ffDuskwood|r")                 //20-30
call setrs(4,"|c00ff0000Graveyard|r")                //30
call setrs(5,"|c00ffff00Stranglethorn Vale|r")       //30-45
call setrs(6,"|c00ff0000Scarlet Monastery|r")        //40
call setrs(7,"|c00ffff00Tanaris|r")                  //40-50
call setrs(8,"|c00ff0000Zul'Farrak|r")               //50
call setrs(9,"|c00ffff00Un'Goro Crater|r")           //50-55
call setrs(10,"|c00ffff00Western Plaguelands|r")     //52-58
call setrs(11,"|c00ffff00Eastern Plaguelands|r")     //55-60
call setrs(12,"|c00ff0000Stratholme|r")              //60
call setrs(13,"|c00ff0000Lower Blackrock Spire|r")   //65
call setrs(14,"|c00ff0000Upper Blackrock Spire|r")   //70
call setrs(15,"|c00ff0000Zul'Gurub|r")               //75
call setrs(16,"|c00ff0000Ruins of Ahn'Qiraj|r")      //80
call setrs(17,"|c00ff0000Molten Core|r")             //85
call setrs(18,"|c00ff0000Blackwing Lair|r")          //90
call setrs(19,"|c00ff0000Ahn'Qiraj|r")               //95
call setrs(20,"|c00ff0000Naxxramas|r")               //100

/*

Elwynn Forest
Westfall
The Deadmines
Duskwood
Graveyard
Stranglethorn Vale
Scarlet Monastery
Tanaris
Zul'Farrak
Un'Goro Crater
Western Plaguelands
Eastern Plaguelands
Stratholme
Lower Blackrock Spire
Upper Blackrock Spire
Zul'Gurub
Ruins of Ahn'Qiraj
Molten Core
Blackwing Lair
Ahn'Qiraj
Naxxramas
*/

endfunction

function rsinit1 takes nothing returns nothing
call setrs(0,"|c000000ffForêt d'Elwynn|r")
call setrs(1,"|c000000ffMarche de l'Ouest|r")
call setrs(2,"|c00ff0000Les mines mortes|r")
call setrs(3,"|c000000ff暮色森林|r")
call setrs(4,"|c00ff0000闹鬼金矿|r")
call setrs(5,"|c00ffff00荆棘谷|r")
call setrs(6,"|c00ff0000血色修道院|r")
call setrs(7,"|c00ffff00塔纳利斯|r")
call setrs(8,"|c00ff0000祖尔法拉克|r")
call setrs(9,"|c00ffff00安洛环形山|r")
call setrs(10,"|c00ffff00西瘟疫之地|r")
call setrs(11,"|c00ffff00东瘟疫之地|r")
call setrs(12,"|c00ff0000斯坦索姆|r")
call setrs(13,"|c00ff0000黑石塔下层|r")
call setrs(14,"|c00ff0000黑石塔上层|r")
call setrs(15,"|c00ff0000祖尔格拉布|r")
call setrs(16,"|c00ff0000安其拉废墟|r")
call setrs(17,"|c00ff0000熔火之心|r")
call setrs(18,"|c00ff0000黑翼之巢|r")
call setrs(19,"|c00ff0000安其拉神庙|r")
call setrs(20,"|c00ff0000纳克萨玛斯|r")
Duskwood
Cimetière
Vallée de Strangleronce
Monastère écarlate
Tanaris
Zul'Farrak
Un'Goro Crater
Maleterres de l'Ouest
Maleterres de l'Est
Stratholme
Flèche Rochenoire inférieure
Flèche Rochenoire supérieure
Zul'Gurub
Ruines d'Ahn'Qiraj
Noyau fondu
Repaire Blackwing
Ahn'Qiraj
Naxxramas
endfunction

function rsinit2 takes nothing returns nothing
call setrs(0,"|c000000ffWald von Elwynn|r")
call setrs(1,"|c000000ffWestfall|r")
call setrs(2,"|c00ff0000死亡矿井|r")
call setrs(3,"|c000000ff暮色森林|r")
call setrs(4,"|c00ff0000闹鬼金矿|r")
call setrs(5,"|c00ffff00荆棘谷|r")
call setrs(6,"|c00ff0000血色修道院|r")
call setrs(7,"|c00ffff00塔纳利斯|r")
call setrs(8,"|c00ff0000祖尔法拉克|r")
call setrs(9,"|c00ffff00安洛环形山|r")
call setrs(10,"|c00ffff00西瘟疫之地|r")
call setrs(11,"|c00ffff00东瘟疫之地|r")
call setrs(12,"|c00ff0000斯坦索姆|r")
call setrs(13,"|c00ff0000黑石塔下层|r")
call setrs(14,"|c00ff0000黑石塔上层|r")
call setrs(15,"|c00ff0000祖尔格拉布|r")
call setrs(16,"|c00ff0000安其拉废墟|r")
call setrs(17,"|c00ff0000熔火之心|r")
call setrs(18,"|c00ff0000黑翼之巢|r")
call setrs(19,"|c00ff0000安其拉神庙|r")
call setrs(20,"|c00ff0000纳克萨玛斯|r")
endfunction

function rsinit3 takes nothing returns nothing
call setrs(0,"|c000000ffForesta di Elwynn|r")
call setrs(1,"|c000000ff西部荒野|r")
call setrs(2,"|c00ff0000死亡矿井|r")
call setrs(3,"|c000000ff暮色森林|r")
call setrs(4,"|c00ff0000闹鬼金矿|r")
call setrs(5,"|c00ffff00荆棘谷|r")
call setrs(6,"|c00ff0000血色修道院|r")
call setrs(7,"|c00ffff00塔纳利斯|r")
call setrs(8,"|c00ff0000祖尔法拉克|r")
call setrs(9,"|c00ffff00安洛环形山|r")
call setrs(10,"|c00ffff00西瘟疫之地|r")
call setrs(11,"|c00ffff00东瘟疫之地|r")
call setrs(12,"|c00ff0000斯坦索姆|r")
call setrs(13,"|c00ff0000黑石塔下层|r")
call setrs(14,"|c00ff0000黑石塔上层|r")
call setrs(15,"|c00ff0000祖尔格拉布|r")
call setrs(16,"|c00ff0000安其拉废墟|r")
call setrs(17,"|c00ff0000熔火之心|r")
call setrs(18,"|c00ff0000黑翼之巢|r")
call setrs(19,"|c00ff0000安其拉神庙|r")
call setrs(20,"|c00ff0000纳克萨玛斯|r")
endfunction

function rsinit4 takes nothing returns nothing
call setrs(0,"|c000000ffBosque de Elwynn|r")
call setrs(1,"|c000000ff西部荒野|r")
call setrs(2,"|c00ff0000死亡矿井|r")
call setrs(3,"|c000000ff暮色森林|r")
call setrs(4,"|c00ff0000闹鬼金矿|r")
call setrs(5,"|c00ffff00荆棘谷|r")
call setrs(6,"|c00ff0000血色修道院|r")
call setrs(7,"|c00ffff00塔纳利斯|r")
call setrs(8,"|c00ff0000祖尔法拉克|r")
call setrs(9,"|c00ffff00安洛环形山|r")
call setrs(10,"|c00ffff00西瘟疫之地|r")
call setrs(11,"|c00ffff00东瘟疫之地|r")
call setrs(12,"|c00ff0000斯坦索姆|r")
call setrs(13,"|c00ff0000黑石塔下层|r")
call setrs(14,"|c00ff0000黑石塔上层|r")
call setrs(15,"|c00ff0000祖尔格拉布|r")
call setrs(16,"|c00ff0000安其拉废墟|r")
call setrs(17,"|c00ff0000熔火之心|r")
call setrs(18,"|c00ff0000黑翼之巢|r")
call setrs(19,"|c00ff0000安其拉神庙|r")
call setrs(20,"|c00ff0000纳克萨玛斯|r")
endfunction

function rsinit5 takes nothing returns nothing
call setrs(0,"|c000000ffSilva Elwynn|r")
call setrs(1,"|c000000ff西部荒野|r")
call setrs(2,"|c00ff0000死亡矿井|r")
call setrs(3,"|c000000ff暮色森林|r")
call setrs(4,"|c00ff0000闹鬼金矿|r")
call setrs(5,"|c00ffff00荆棘谷|r")
call setrs(6,"|c00ff0000血色修道院|r")
call setrs(7,"|c00ffff00塔纳利斯|r")
call setrs(8,"|c00ff0000祖尔法拉克|r")
call setrs(9,"|c00ffff00安洛环形山|r")
call setrs(10,"|c00ffff00西瘟疫之地|r")
call setrs(11,"|c00ffff00东瘟疫之地|r")
call setrs(12,"|c00ff0000斯坦索姆|r")
call setrs(13,"|c00ff0000黑石塔下层|r")
call setrs(14,"|c00ff0000黑石塔上层|r")
call setrs(15,"|c00ff0000祖尔格拉布|r")
call setrs(16,"|c00ff0000安其拉废墟|r")
call setrs(17,"|c00ff0000熔火之心|r")
call setrs(18,"|c00ff0000黑翼之巢|r")
call setrs(19,"|c00ff0000安其拉神庙|r")
call setrs(20,"|c00ff0000纳克萨玛斯|r")
endfunction

function rsinit6 takes nothing returns nothing
call setrs(0,"|c000000ffエルウィンフォレスト|r")
call setrs(1,"|c000000ff西部荒野|r")
call setrs(2,"|c00ff0000死亡矿井|r")
call setrs(3,"|c000000ff暮色森林|r")
call setrs(4,"|c00ff0000闹鬼金矿|r")
call setrs(5,"|c00ffff00荆棘谷|r")
call setrs(6,"|c00ff0000血色修道院|r")
call setrs(7,"|c00ffff00塔纳利斯|r")
call setrs(8,"|c00ff0000祖尔法拉克|r")
call setrs(9,"|c00ffff00安洛环形山|r")
call setrs(10,"|c00ffff00西瘟疫之地|r")
call setrs(11,"|c00ffff00东瘟疫之地|r")
call setrs(12,"|c00ff0000斯坦索姆|r")
call setrs(13,"|c00ff0000黑石塔下层|r")
call setrs(14,"|c00ff0000黑石塔上层|r")
call setrs(15,"|c00ff0000祖尔格拉布|r")
call setrs(16,"|c00ff0000安其拉废墟|r")
call setrs(17,"|c00ff0000熔火之心|r")
call setrs(18,"|c00ff0000黑翼之巢|r")
call setrs(19,"|c00ff0000安其拉神庙|r")
call setrs(20,"|c00ff0000纳克萨玛斯|r")
endfunction

function rsinit7 takes nothing returns nothing
call setrs(0,"|c000000ff엘윈 숲|r")
call setrs(1,"|c000000ff西部荒野|r")
call setrs(2,"|c00ff0000死亡矿井|r")
call setrs(3,"|c000000ff暮色森林|r")
call setrs(4,"|c00ff0000闹鬼金矿|r")
call setrs(5,"|c00ffff00荆棘谷|r")
call setrs(6,"|c00ff0000血色修道院|r")
call setrs(7,"|c00ffff00塔纳利斯|r")
call setrs(8,"|c00ff0000祖尔法拉克|r")
call setrs(9,"|c00ffff00安洛环形山|r")
call setrs(10,"|c00ffff00西瘟疫之地|r")
call setrs(11,"|c00ffff00东瘟疫之地|r")
call setrs(12,"|c00ff0000斯坦索姆|r")
call setrs(13,"|c00ff0000黑石塔下层|r")
call setrs(14,"|c00ff0000黑石塔上层|r")
call setrs(15,"|c00ff0000祖尔格拉布|r")
call setrs(16,"|c00ff0000安其拉废墟|r")
call setrs(17,"|c00ff0000熔火之心|r")
call setrs(18,"|c00ff0000黑翼之巢|r")
call setrs(19,"|c00ff0000安其拉神庙|r")
call setrs(20,"|c00ff0000纳克萨玛斯|r")
endfunction

function rsinit8 takes nothing returns nothing
call setrs(0,"|c000000ffΔάσος Elwynn|r")
call setrs(1,"|c000000ff西部荒野|r")
call setrs(2,"|c00ff0000死亡矿井|r")
call setrs(3,"|c000000ff暮色森林|r")
call setrs(4,"|c00ff0000闹鬼金矿|r")
call setrs(5,"|c00ffff00荆棘谷|r")
call setrs(6,"|c00ff0000血色修道院|r")
call setrs(7,"|c00ffff00塔纳利斯|r")
call setrs(8,"|c00ff0000祖尔法拉克|r")
call setrs(9,"|c00ffff00安洛环形山|r")
call setrs(10,"|c00ffff00西瘟疫之地|r")
call setrs(11,"|c00ffff00东瘟疫之地|r")
call setrs(12,"|c00ff0000斯坦索姆|r")
call setrs(13,"|c00ff0000黑石塔下层|r")
call setrs(14,"|c00ff0000黑石塔上层|r")
call setrs(15,"|c00ff0000祖尔格拉布|r")
call setrs(16,"|c00ff0000安其拉废墟|r")
call setrs(17,"|c00ff0000熔火之心|r")
call setrs(18,"|c00ff0000黑翼之巢|r")
call setrs(19,"|c00ff0000安其拉神庙|r")
call setrs(20,"|c00ff0000纳克萨玛斯|r")
endfunction

function rsinit9 takes nothing returns nothing
call setrs(0,"|c000000ffSilva Elwynn|r")
call setrs(1,"|c000000ff西部荒野|r")
call setrs(2,"|c00ff0000死亡矿井|r")
call setrs(3,"|c000000ff暮色森林|r")
call setrs(4,"|c00ff0000闹鬼金矿|r")
call setrs(5,"|c00ffff00荆棘谷|r")
call setrs(6,"|c00ff0000血色修道院|r")
call setrs(7,"|c00ffff00塔纳利斯|r")
call setrs(8,"|c00ff0000祖尔法拉克|r")
call setrs(9,"|c00ffff00安洛环形山|r")
call setrs(10,"|c00ffff00西瘟疫之地|r")
call setrs(11,"|c00ffff00东瘟疫之地|r")
call setrs(12,"|c00ff0000斯坦索姆|r")
call setrs(13,"|c00ff0000黑石塔下层|r")
call setrs(14,"|c00ff0000黑石塔上层|r")
call setrs(15,"|c00ff0000祖尔格拉布|r")
call setrs(16,"|c00ff0000安其拉废墟|r")
call setrs(17,"|c00ff0000熔火之心|r")
call setrs(18,"|c00ff0000黑翼之巢|r")
call setrs(19,"|c00ff0000安其拉神庙|r")
call setrs(20,"|c00ff0000纳克萨玛斯|r")
endfunction

function rsinit10 takes nothing returns nothing
call setrs(0,"|c000000ff艾尔文森林|r")
call setrs(1,"|c000000ff西部荒野|r")
call setrs(2,"|c00ff0000死亡矿井|r")
call setrs(3,"|c000000ff暮色森林|r")
call setrs(4,"|c00ff0000闹鬼金矿|r")
call setrs(5,"|c00ffff00荆棘谷|r")
call setrs(6,"|c00ff0000血色修道院|r")
call setrs(7,"|c00ffff00塔纳利斯|r")
call setrs(8,"|c00ff0000祖尔法拉克|r")
call setrs(9,"|c00ffff00安洛环形山|r")
call setrs(10,"|c00ffff00西瘟疫之地|r")
call setrs(11,"|c00ffff00东瘟疫之地|r")
call setrs(12,"|c00ff0000斯坦索姆|r")
call setrs(13,"|c00ff0000黑石塔下层|r")
call setrs(14,"|c00ff0000黑石塔上层|r")
call setrs(15,"|c00ff0000祖尔格拉布|r")
call setrs(16,"|c00ff0000安其拉废墟|r")
call setrs(17,"|c00ff0000熔火之心|r")
call setrs(18,"|c00ff0000黑翼之巢|r")
call setrs(19,"|c00ff0000安其拉神庙|r")
call setrs(20,"|c00ff0000纳克萨玛斯|r")
endfunction
function rsinit takes nothing  returns nothing
if sys.lang==0 then
call rsinit0()
endif
if sys.lang==6 then
call rsinit6()
endif
endfunction
endlibrary




//hero
library hero initializer init needs sys

function sethero takes integer a,integer b,integer c,integer d,integer e,integer f,integer g ,real h returns nothing
//save herotype
call si("unitorder",b,a)
call si("unitid",a,b)
call si("classx",a,g)
call SaveInteger(H,StringHash("unittype"),b,c)//type 21-23
call SaveInteger(H,StringHash("unitarmor"),b,d)//barmor 1-20
call SaveInteger(H,StringHash("unitdamage"),b,e)//bdamage 1-20
call SaveInteger(H,StringHash("unitspell"),b,f)//bspell 1-20
call SaveInteger(H,StringHash("unitclass"),b,a)//class 21-29
call SaveReal(H,StringHash("damarate"),b,h)//damagerate
endfunction

function heroinit takes nothing returns nothing
//sethero
//21 str .5
//22 agi .4
//23 int .3

call sethero(21,'o000',21,50,5,0,1,1)
call sethero(22,'o001',21,40,5,0,1,1)
call sethero(23,'o002',21,20,5,0,1,1)
call sethero(24,'o003',22,20,4,0,1,.8)
call sethero(25,'o004',22,100,4,0,0,.8)
call sethero(26,'o005',22,10,4,0,1,.8)
call sethero(27,'o006',23,5,3,0,0,.5)
call sethero(28,'o007',23,5,3,0,1,.5)
call sethero(29,'o008',23,5,3,0,1,.5)



endfunction


private function init takes nothing  returns nothing
call heroinit()
endfunction
endlibrary



library skill initializer init needs sys

function setskill takes integer a,integer b,integer c,integer d,integer e returns nothing
call SaveInteger(H,StringHash("herotype"),a,b)
call SaveInteger(H,StringHash("learnskill"),a,c)
call SaveInteger(H,StringHash("skilltype"),a,d)
call SaveInteger(H,StringHash("skillid"),e,c)
call SaveInteger(H,StringHash("skillorder"),a,e)
endfunction

function setboss takes integer a,integer b,integer c returns nothing
call si("boss0",a,b)
call si("boss1",a,c)
endfunction


function skillinit takes nothing returns nothing
//primary skill
call SaveInteger(H,StringHash("skillid0"),21,1000)
call SaveInteger(H,StringHash("skillid0"),22,1021)
call SaveInteger(H,StringHash("skillid0"),23,1040)
call SaveInteger(H,StringHash("skillid0"),24,1060)
call SaveInteger(H,StringHash("skillid0"),26,1100)
call SaveInteger(H,StringHash("skillid0"),28,1143)
call SaveInteger(H,StringHash("skillid0"),29,1160)

//mobskill
call si("mobskill",1,'A04D')
call si("mobskill",2,'A04I')
call si("mobskill",3,'A03G')
call si("mobskill",4,'A03W')
call si("mobskill",5,'A03Y')
call si("mobskill",6,'A03E')
call si("mobskill",7,'A03X')
call si("mobskill",8,'A04O')
call si("mobskill",9,'A04P')
call si("mobskill",10,'A03H')
call si("mobskill",11,'A04T')
call si("mobskill",12,'A04U')
call si("mobskill",13,'A03K')
call si("mobskill",14,'A05Z')
call si("mobskill",15,0)
call si("mobskill",16,0)
call si("mobskill",17,0)
call si("mobskill",18,0)
call si("mobskill",19,0)
call si("mobskill",20,0)
call si("mobskill",21,0)
call si("mobskill",22,0)

//heroskill
call setskill('I002',21,'A100',5,1000)
call setskill('I001',21,'A103',5,1001)
call setskill('I004',21,'A101',5,1002)
call setskill('I005',21,'A102',5,1003)
call setskill('I003',21,'A104',5,1004)
call setskill('I01Q',21,'A040',10,1005)
call setskill('I01R',21,'A041',10,1006)
call setskill('I01V',21,'A047',5,1007)
call setskill('I01W',21,'A048',5,1008)
call setskill('I01X',21,'A049',5,1009)
call setskill('I01U',21,'A043',10,1010)
call setskill('I01T',21,'A046',10,1011)

call setskill('I200',22,'A200',5,1020)
call setskill('I201',22,'A201',5,1021)
call setskill('I202',22,'A202',5,1022)
call setskill('I203',22,'A203',5,1023)
call setskill('I01I',22,'A02W',10,1024)
call setskill('I01J',22,'A03L',10,1025)
call setskill('I016',22,'A04W',5,1026)
call setskill('I017',22,'A04V',10,1027)

call setskill('I300',23,'A300',5,1040)
call setskill('I301',23,'A301',5,1041)
call setskill('I303',23,'A04K',5,1042)
call setskill('I00I',23,'A05W',10,1043)
call setskill('I015',23,'A302',10,1044)
call setskill('I023',23,'A05X',5,1045)

call setskill('I404',24,'A404',5,1060)
call setskill('I405',24,'A405',10,1061)
call setskill('I406',24,'A406',5,1062)
call setskill('I407',24,'A407',5,1063)
call setskill('I408',24,'A05S',5,1064)
call setskill('I00J',24,'A03I',10,1065)

call setskill('I01K',26,'A03J',5,1100)
call setskill('I01L',26,'A03Q',5,1101)
call setskill('I01P',26,'A03M',5,1102)
call setskill('I01N',26,'A03O',5,1103)
call setskill('I01O',26,'A03N',5,1104)
call setskill('I01M',26,'A03P',5,1105)
call setskill('I024',26,'A03F',10,1106)
call setskill('I028',26,'A04J',10,1107)
call setskill('I027',26,'A061',10,1108)


call setskill('I02C',28,'A05R',5,1140)
call setskill('I02B',28,'A05Y',5,1141)
call setskill('I02D',28,'A062',5,1142)
call setskill('I02A',28,'A04A',5,1143)


call setskill('I026',29,'A067',5,1160)
call setskill('I018',29,'A03V',5,1161)
call setskill('I029',29,'A064',5,1162)
call setskill('I00G',29,'A04Q',5,1163)
call setskill('I01B',29,'A04N',5,1164)
call setskill('I02F',29,'A063',5,1165)



call si("qtip",0,'A037')
call si("qtip",1,'A03C')
call si("qtip",2,'A03D')
call si("qtip",3,'A05P')
call si("qtip",4,'A066')


call setboss('n013',1,2)

endfunction



private function init takes nothing  returns nothing
call skillinit()
endfunction
endlibrary





library skillstring needs sys

function setss takes integer a,string b,string c returns nothing
call SaveStr(H,StringHash("skillname"),a,b)
call SaveStr(H,StringHash("skilldesc"),a,c)
endfunction

function ssinit0 takes nothing returns nothing
call setss('A100',"Heroic Strike","A strong attack that increases melee damage by 150% and causes a high amount of threat.")
endfunction

function ssinit6 takes nothing returns nothing
endfunction

function ssinit takes nothing  returns nothing
if sys.lang==0 then
call ssinit0()
endif
if sys.lang==6 then
call ssinit6()
endif
endfunction
endlibrary







library npc initializer init needs sys

function setdest takes integer a returns nothing
call si("destorder",a,sys.destx)
set sys.destx=sys.destx+1
endfunction

function setmob takes integer a,integer b,integer c returns nothing
call SaveInteger(H,StringHash("mobid"),sys.mobx,a)
call SaveInteger(H,StringHash("mobx"),sys.mobx,b)
call SaveInteger(H,StringHash("moby"),sys.mobx,c)
set sys.mobx=sys.mobx+1
endfunction

function setnpc takes integer a,integer b,integer c returns nothing
call SaveInteger(H,StringHash("npcid"),sys.npcx,a)
call SaveInteger(H,StringHash("npcx"),sys.npcx,b)
call SaveInteger(H,StringHash("npcy"),sys.npcx,c)
set sys.npcx=sys.npcx+1
endfunction

function setunit takes integer a,integer b,integer c,integer d,integer e,integer f,real g,real h,real i returns nothing
call SaveInteger(H,StringHash("unitid"),sys.unitx,a)
call SaveInteger(H,StringHash("unitorder"),a,sys.unitx)
call SaveInteger(H,StringHash("unitclass"),a,b)
call SaveInteger(H,StringHash("unitarmor"),a,c)
call SaveInteger(H,StringHash("unitdamage"),a,d)
call SaveInteger(H,StringHash("unithp"),a,e)
call SaveInteger(H,StringHash("unitskill"),a,f)
call SaveReal(H,StringHash("unitas"),a,g)
call SaveReal(H,StringHash("unitdodge"),a,h)
call SaveReal(H,StringHash("unitmagic"),a,i)

set sys.unitx=sys.unitx+1
endfunction

function mobinit takes nothing returns nothing


set sys.mobx=40
call setmob('o002',-24,-61)

//elite
//boss
//npc
//elwynn Forest
set sys.npcx=1
call setnpc('h000',26,40)
call setnpc('h001',19,39)
call setnpc('h002',25,33)
call setnpc('h003',35,7)
call setnpc('h004',3,20)
call setnpc('h005',-9,38)
call setnpc('h006',0,33)
call setnpc('h007',-19,33)
call setnpc('h008',0,-28)
call setnpc('h009',-11,-10)
call setnpc('h00A',-50,-12)
call setnpc('h00B',30,-11)
call setnpc('h00C',40,-17)
call setnpc('h00D',-9,-12)
call setnpc('h00E',-29,-16)
call setnpc('h00F',-45,10)
call setnpc('h00G',0,-28)
call setnpc('h00H',32,-4)
call setnpc('h00I',-50,-15)
call setnpc('h00J',31,-17)
//westfall
call setnpc('h00K',0,0)
call setnpc('h00L',0,0)
call setnpc('h00M',0,0)
call setnpc('h00N',0,0)
call setnpc('h00O',0,0)
call setnpc('h00P',0,0)
call setnpc('h00Q',0,0)
call setnpc('h00R',0,0)
call setnpc('h00S',0,0)
call setnpc('h00T',0,0)
call setnpc('h00U',0,0)
call setnpc('h00V',0,0)
call setnpc('h00W',0,0)
call setnpc('h00X',0,0)
call setnpc('h00Y',0,0)
call setnpc('h00Z',0,0)
call setnpc('h010',0,0)
call setnpc('h011',0,0)
call setnpc('h012',0,0)
call setnpc('h013',0,0)



set sys.destx=1
call setdest('B000')
call setdest('B001')
call setdest('B002')
call setdest('B003')
call setdest('B004')
call setdest('B005')
call setdest('B006')

endfunction

function unitinit takes nothing returns nothing

call SaveInteger(H,StringHash("petrate"),0,800000)
call SaveInteger(H,StringHash("petrate"),1,200000)
call SaveInteger(H,StringHash("petrate"),2,50000)
call SaveInteger(H,StringHash("petrate"),3,10000)
call SaveInteger(H,StringHash("petrate"),4,5000)
call SaveInteger(H,StringHash("petrate"),5,2000)
call si("respawn",0,60)
call si("respawn",1,120)
call si("respawn",2,300)
call si("respawn",3,600)
call si("respawn",4,900)
call si("respawn",5,1200)
call si("respawn",6,1800)
set sys.unitx=1
//80
//60
//50

//class 0
//elwynn forest
call setunit('n000',0,20,5,50,1,1,0,0)
call setunit('n001',0,20,5,50,2,1,0,0)
call setunit('n002',0,20,10,100,3,1,0,0)
call setunit('n003',0,20,15,150,4,1,0,0)
call setunit('n004',0,20,20,200,5,1,0,0)
call setunit('n005',1,30,50,500,1,1,0,0)
call setunit('n006',0,20,30,300,6,1,0,0)
call setunit('n007',0,10,40,400,7,1,0,0)
call setunit('n008',0,20,45,450,8,1,0,0)
call setunit('n009',0,20,50,500,9,1,0,0)//10
call setunit('n00A',2,40,220,2200,1,1,0,0)
call setunit('n00B',1,30,100,1000,2,1,0,0)
call setunit('n00C',0,20,35,350,10,1,0,0)
call setunit('n00D',0,20,50,500,11,1,0,0)
call setunit('n00E',0,20,50,500,12,1,0,0)
call setunit('n00F',0,30,20,300,13,1,0,0)
call setunit('n00G',1,30,80,800,3,1,0,0)
call setunit('n00H',1,40,90,1200,4,1,0,0)
//westfall
call setunit('n00I',0,20,55,550,14,1,0,0)
call setunit('n00J',0,30,50,700,15,1,0,0)//20
call setunit('n00K',0,20,65,650,16,1,0,0)
call setunit('n00L',0,20,70,700,17,1,0,0)
call setunit('n00M',0,20,75,750,18,1,0,0)
call setunit('n00N',0,20,80,800,19,1,0,0)
call setunit('n00O',0,30,85,850,20,1,0,0)
call setunit('n00P',1,30,180,1800,5,1,0,0)
call setunit('n00Q',0,20,95,950,21,1,0,0)
call setunit('n00R',0,20,100,1000,22,1,0,0)
call setunit('n00S',1,30,200,2000,6,1,0,0)
call setunit('n00T',2,40,360,3600,2,1,0,0)//30
call setunit('n00U',2,40,400,4000,3,1,0,0)
call setunit('n00V',2,40,360,3600,4,1,0,0)
call setunit('n00W',2,40,380,3800,5,1,0,0)
call setunit('n00X',2,40,380,3800,6,1,0,0)
call setunit('n00Y',2,40,400,4000,7,1,0,0)
call setunit('n00Z',2,40,400,4000,8,1,0,0)
call setunit('n010',3,50,720,9000,1,1,0,0)
call setunit('n011',3,50,760,9500,2,1,0,0)
call setunit('n012',3,50,800,10000,3,1,0,0)
call setunit('n013',3,50,800,10000,4,1,0,0)//40
call setunit('n014',3,50,840,10500,5,1,0,0)
call setunit('n015',3,50,880,11000,6,1,0,0)

//raid

set sys.unitx=1000
endfunction


private function init takes nothing  returns nothing
call mobinit()
call unitinit()
endfunction
endlibrary





library unitstring

function setns takes string a returns nothing
call SaveStr(H,StringHash("npcname"),sys.npcy,a)
set sys.npcy=sys.npcy+1
endfunction


function setms takes string a,string b returns nothing
call SaveStr(H,StringHash("unitword"),sys.unity,a)
call SaveStr(H,StringHash("unitname"),sys.unity,b)
set sys.unity=sys.unity+1
endfunction


function usinit0 takes nothing returns nothing

set classname[21]="|c00ff0000warrior|r"
set classname[22]="|c00ff8000paladin|r"
set classname[23]="|c00ffff00shaman|r"
set classname[24]="|c0080ff00hunter|r"
set classname[25]="|c0000ff00druid|r"
set classname[26]="|c0000ff80rogue|r"
set classname[27]="|c0000ffffwarlock|r"
set classname[28]="|c000080ffpriest|r"
set classname[29]="|c000000ffmage|r"

set sys.unity=1
//elwynn forest
call setms("","Timber Wolf")
call setms("","Kobold Vermin")
call setms("","Kobold Worker")
call setms("","Kobold Laborer")
call setms("","Defias Thug")
call setms("","Garrick Padfoot")
call setms("","Kobold Miner")
call setms("","Geomancer")
call setms("","Defias Bandit")
call setms("","Riverpaw Runt")//10
call setms("","Hogger")
call setms("","Morgan the Collector")
call setms("","Murloc")
call setms("","Prowler")
call setms("","Murloc Forager")
call setms("","Rockhide Boar")
call setms("","Goldtooth")
call setms("","Princess")
call setms("","Murloc Raider")//westfall
call setms("","Young Goretusk")//20
call setms("","Defias Smuggler")
call setms("","Riverpaw Gnoll")
call setms("","Harvest Golem")
call setms("","Defias Looter")
call setms("","Harvest Watcher")
call setms("","Defias Messenger")
call setms("","Defias Highwayman")
call setms("","Murloc Oracle")
call setms("","Old Murk-Eye")
call setms("","Skeletal Miner")//deadmine 30
call setms("","Foreman Thistlenettle")
call setms("","Defias Magician")
call setms("","Defias Watchman")
call setms("","Defias Overseer")
call setms("","Defias Taskmaster")
call setms("","Defias Blackguard")
call setms("","Rhahk'Zor")
call setms("","Sneed")
call setms("","Mr. Smite")
call setms("","Captain Greenskin")//40
call setms("","Cookie")
call setms("","Edwin VanCleef")



set sys.npcy=1
call setns("Deputy Willem")//elwynn forest
call setns("Marshal McBride")
call setns("Eagan Peltskinner")
call setns("Milly Osworth")
call setns("Brother Neals")
call setns("Marshal Dughan")
call setns("Remy 'Two Times'")
call setns("William Pestle")
call setns("Sara Timberlain")
call setns("Deputy Rainer")//10
call setns("Maybell Maclure")
call setns("Tommy Joe Stonefield")
call setns("Gramma Stonefield")
call setns("Guard Thomas")
call setns("A half-eaten body")
call setns("Rolf's corpse")
call setns("Supervisor Raelen")
call setns("'Auntie' Bernice Stonefield")
call setns("Billy Maclure")
call setns("Ma Stonefield") //20
call setns("Gryan Stoutmantle")//westfall
call setns("Thor")
call setns("Dungar Longdrink")
call setns("Verna Furlbrow")
call setns("Salma Saldean")
call setns("Farmer Furlbrow")
call setns("Captain Danuvin")
call setns("Scout Galiaan")
call setns("Farmer Saldean")
call setns("Grimbooze Thunderbrew")//30
call setns("Captain Grayson")
call setns("The Defias Traitor")
call setns("Wilder Thistlenettle")
call setns("Baros Alexston")
call setns("Shoni the Shilent")
call setns("Captain Sander's Treasure Map")
call setns("Captain's Footlocker")
call setns("Broken Barrel")
call setns("Old Jug")
call setns("Locked Chest")//40




endfunction



function usinit6 takes nothing returns nothing
endfunction

function usinit takes nothing  returns nothing
if sys.lang==0 then
call usinit0()
endif
if sys.lang==6 then
call usinit6()
endif
endfunction

endlibrary




library task0

private function settask takes string a,string b,string c,string d,string e,string f returns nothing
call ss("questtitle",sys.task0,a)
call ss("questtip",sys.task0,b)
call ss("questdesc",sys.task0,c)
call ss("questback",sys.task0,d)
call ss("questitem",sys.task0,e)
call ss("questdone",sys.task0,f)
set sys.task0=sys.task0+1
endfunction

private function setqitem takes string a returns nothing
endfunction


private function qtext0 takes nothing returns nothing

call settask("A Threat Within","Speak with Marshal McBride.
","I hope you strapped your belt on tight, young <class>, because there is work to do here in Northshire.
And I don't mean farming.
The Stormwind guards are hard pressed to keep the peace here, with so many of us in distant lands and so many threats pressing close. And so we're enlisting the aid of anyone willing to defend their home. And their alliance.
If you're here to answer the call, then speak with my superior, Marshal McBride. He's inside the abbey behind me.
",null,null,"Ah, good. Another volunteer. We're getting a lot of you these days.
I hope it's enough.
The human lands are threatened from without, and so many of our forces have been marshaled abroad. This, in turn, leaves room for corrupt and lawless groups to thrive within our borders.
It is a many-fronted battle we wage, <name>. Gird yourself for a long campaign.")

call settask("Kobold Camp Cleanup","Kill 10 Kobold Vermin, then return to Marshal McBride.
","Your first task is one of cleansing, <name>. A clan of kobolds have infested the woods to the north. Go there and fight the kobold vermin you find. Reduce their numbers so that we may one day drive them from Northshire.
","How goes the hunting, <name>? Have you found and defeated those vermin?
",null,"Well done, citizen. Those kobolds are thieves and cowards, but in large numbers they pose a threat to us. And the humans of Stormwind do not need another threat.
For defeating them, you have my gratitude.")

call settask("Investigate Echo Ridge","Kill 10 Kobold Workers, then report back to Marshal McBride.
","<name>, my scouts tell me that the kobold infestation is larger than we had thought. A group of kobold workers has camped near the Echo Ridge Mine to the north.
Go to the mine and remove them. We know there are at least 10. Kill them, see if there are more, then report back to me.
","Have you been to the mines? Are you ready to report?
",null,"I don't like hearing of all these kobolds in our mine. No good can come of this. Here, take this as payment, and when you're ready, speak to me again. I would like you to go back to the mines one more time...")

call settask("Skirmish at Echo Ridge","Kill 12 Kobold Laborers, then return to Marshal McBride at Northshire Abbey.
","Your previous investigations are proof that the Echo Ridge Mine needs purging. Return to the mine and help clear it of kobolds.
Waste no time, <name>. The longer the kobolds are left unmolested in the mine, the deeper a foothold they gain in Northshire.
","I know it's bloody work, <name>, but it's vital to the safety of Northshire. Are you ready to report?
",null,"Once again, you have earned my respect, and the gratitude of the Stormwind Army. There may yet be kobolds in the mine, but I will marshal others against them. We have further tasks for you.")

call settask("Report to Goldshire","Take Marshal McBride's Documents to Marshal Dughan in Goldshire.
","<name>, you are a <class> with proven interest in the security of Northshire. You are now tasked with the protection of the surrounding Elwynn Forest.
If you accept this duty, then I have prepared papers that must be delivered to Marshal Dughan in Goldshire. Goldshire lies along the southern road, past the border gates.
","You have word from McBride? Northshire is a garden compared to Elwynn Forest, but I wonder what Marshal McBride has to report.
Here, let me have his papers...
",null,"Well, it says here that you've been awarded Acting Deputy Status with the Stormwind Marshals. Congratulations.
And good luck - keeping Elwynn safe is no picnic... what with most the army busy doing who knows what for who knows which noble!
It's hard to keep track of politics in these dark days...")

call settask("The Fargodeep Mine","Explore the Fargodeep Mine, then return to Marshal Dughan in Goldshire.
","The mine in Northshire isn't the only one with problems! I have reports that the Fargodeep Mine in Elwynn has also become a haven for Kobolds.
Explore the mine and confirm these reports, then return to me. The mine is almost due south of Goldshire, between the Stonefield and Maclure homesteads
","What do you have to report, <name>? Have you been to the Fargodeep Mine?
",null,"This is bad news. What's next, dragons?!? We'll have to increase our patrols near that mine. Thanks for your efforts, <name>. And hold a moment... I might have another task for you.")

call settask("The Jasperlode Mine","Explore the Jasperlode Mine, then report back to Marshal Dughan in Goldshire.
","Thanks to you we know the Fargodeep Mine is infested with kobolds. Now we need a scout to investigate the more distant Jasperlode Mine.
Explore Jasperlode and confirm any kobold presence. To reach the mine, travel east along the road until you reach the Tower of Azora. From the tower, head north and you'll find the mine in the foothills.
","Hail, <name>. What do you have to report? Have you scouted the Jasperlode Mine?
",null,"Kobolds at the Jasperlode Mine, you say? Curses! The situation is worsening by the minute!
Thank you for the report, <name>. But I wish that the news you brought was good news.")

call settask("Westbrook Garrison Needs Help!","Go to the Westbrook Garrison and speak with Deputy Rainer.
","The Garrison on our western border sends word of increasing gnoll and thief activity. They're requesting we send more Stormwind soldiers... but we just don't have any to spare!
If you can help, we could use it. Go and speak with Deputy Rainer at the Westbrook Garrison and see what he needs done.
The Garrison is down the road to the west. After you cross the bridge over the small brook it will be to the right.
",null,null,"Marshall Dughan sent you, eh? Well you're not from the army, but if Dughan sent you then that's good enough for me!
Our situation is, to say the least, a stressed one. I hope you can give us a hand.")

call settask("Riverpaw Gnoll Bounty","Bring 8 Painted Gnoll Armbands to Deputy Rainer at the Barracks.
","Gnolls, brutish creatures with no decent business in these lands, have been seen along the borders of Elwynn Forest. A large pack of them, many more than we can handle alone, have infested the woods south of the guard tower yonder. Another group has infested the areas near Stone Cairn Lake to the east.
The Stormwind Army will commend whomever helps kill them. Bring me their painted gnoll armbands as proof of your deed.
","Hail, <name>. Have you been killing Gnolls...?
","Painted Gnoll Armband","I see you've been busy! You have our thanks, <name>.")


call settask("Wanted: 'Hogger'","Slay the gnoll Hogger and bring his Huge Gnoll Claw to Marshal Dughan.
","Wanted: Hogger
A huge gnoll, Hogger, is prowling the woods in southwestern Elwynn. He has overpowered all attempts at his capture.
The Stormwind Army has placed a generous bounty on the Gnoll. To earn the reward, bounty hunters should bring proof of Hogger's demise to Marshal Dughan in Goldshire.
","Yes, Hogger has been a real pain for me and my men. You have something to report about the beast?
","Huge Gnoll Claw","Hah! Well done! I was starting to think no one would take down that monster!
Here you are, <name>. And thanks - that Gnoll was giving me a headache the size of Blackrock Spire!")


call settask("Report to Gryan Stoutmantle","Talk to Gryan Stoutmantle. He usually can be found in the stone tower on Sentinel Hill, just off the road, in the middle of Westfall.
","Looks to me you've seen quite a bit of combat in your time, <class>. If you haven't already, you should report to Gryan Stoutmantle. He heads up the People's Militia, aimed at protecting the farmlands of Westfall. I bet he could use your help. You can usually find him in the stone tower on Sentinel Hill, just off the road in the middle of Westfall.
","An... Any luck??
",null,"Ah, so my friend sent you here? How kind.
Well the Stormwind Monarchy has abandoned our cause. Now it is up to the People's Militia to keep the land free from corruption. If our cause interests you, I can put your combat skills to use in the name of freedom.")

call settask("The People's Militia","Gryan Stoutmantle wants you to kill 30 Defias Smugglers then return to him on Sentinel Hill
","The People's Militia has but one goal: To defend the lands of Westfall and return peace to our surroundings. Unfortunately, the price of peace is often blood. 
One of my scouts has brought word of a band of Defias Smugglers wreaking havoc nearby. I have reports of Defias Smuggler sightings near the Jangolode Mine to the Northwest as well as at the Molsen Farm and Furlbrow's Pumpkin Farm. If you seek to join our ranks, slay 30 Defias Smugglers then return to me
","Perhaps I did not make myself clear, pledge. In order to prove your worth as a servant to The People's Militia and to the Light you need to slay 30 Defias Smugglers then return to me when the deed is done
",null,"Well done, <name>. My scout witnessed your valiant acts. You are proving yourself quite well so far")

call settask("The People's Militia","Gryan Stoutmantle wants you to kill 30 Defias Looters and return to him on Sentinel Hill
","A band of vicious Defias Pillagers has been seen plundering the Gold Coast Quarry, Moonbrook and the Alexston Farmstead. The People's Militia will not stand for such behavior. Dispatch immediately, <name>, and make the Light's presence known in Westfall.
The Gold Coast Quarry is near the shore, to the West of the tower. As the next step of your training, I want you to kill 15 of those foul Defias Pillagers and 15 Defias Looters
","We have not time to talk, <name>. The Defias Pillagers are denying the people of Westfall the peace and prosperity they deserve. Make sure at least 15 Defias Pillagers and 15 Defias Looters have been killed. That will send a clear message that corruption is not welcome here.
",null,"Your worth to The People's Militia has been validated by your brave acts thus far.")

call settask("The People's Militia","Gryan Stoutmantle wants you to kill 25 Defias Highwaymen then return to him on Sentinel Hill
","Some Defias have eluded us. My most trusted scout reports that these Defias have been looting and pillaging the countryside, all the way into Southern Westfall. We believe they are hiding out in the Dagger Hills, plotting their next move. Slay the wretches in the name of The People's Militia
","<name>, now is no time for idle chatter. If you still wish to prove yourself to The People's Militia you need to slay the Defias I notified you about earlier. Return to me when you have completed your duty
",null,"When I left the tainted lands of Lordaeron I returned to a grim state of affairs here in my homeland. But there is hope for Westfall yet. As proven by your valor in battle, it is obvious to me that you serve our cause with honor. It is with great pride that I induct thee into The People's Militia. May the Light shine upon you")

call settask("The Defias Brotherhood","Track down the Defias Messenger in Westfall and bring his message to Stoutmantle
","We need to discover the location of the Defias hideout. <name>, my scout reports that a Defias Messenger has been seen on the roads between Moonbrook, the Gold Coast Quarry and the Jangolode Mine. I want you to capture him. If he resists, kill him and bring me whatever he is carrying.
","<name>, were you able to gather any information? Did you locate the messenger?
","A Mysterious Message","This is indeed firm proof that VanCleef is in charge. Now all we need to know is where the Defias gang is hiding out.
We've had a stroke of luck while you were gone. We captured a thief trying to steal Saldean's wagon. He has promised to lead us to the hideout in exchange for his life. I want you to defend the traitor so he can reveal the hideout. Return to me once you have uncovered the location.")

call settask("The Defias Brotherhood","Escort the Defias Traitor to the secret hideout of the Defias Brotherhood. Once the Defias Traitor shows you where VanCleef and his men are hiding out, return to Gryan Stoutmantle with the information
","So Stoutmantle sends a scrawny <race> like you to protect me? Guess you'll have to do. Better bring some friends too. 
You know the deal, right? You watch my back and I'll take you to the Defias hideout. But you better be close by my side. The Defias gang wants my head now. If they see me with you, they'll try to kill me.
Let me know when you and any friends you can round up are ready to go
","What business do you have with me? I am a very busy man...
",null,"Most excellent, <name>! VanCleef is as good as ours now that we know where he is hiding.")

call settask("The Defias Brotherhood","Kill Edwin VanCleef and bring his head to Gryan Stoutmantle
","There is but one task left for you to complete. Edwin VanCleef must be assassinated. While it saddens me to condemn any man to a death sentence, it is for the greater good of the people of Westfall that VanCleef is laid to rest once and for all. Bring me the villain's head once the deed is done
","How goes the hunt for Edwin VanCleef?
","Head of VanCleef","<name>, your bravery is remarkable. The People's Militia thanks you for your service to the people of Westfall. With VanCleef dead, this marks the beginning of the end for the Defias Brotherhood. Hopefully some day soon peace will once again grace the plains of this fair land.
I salute you, <Lord/Lady>!")

/*
call settask("","
","
","
","","")
*/

endfunction
private function qtext6 takes nothing returns nothing
endfunction
function taskinit0 takes nothing  returns nothing
if sys.lang==0 then
call qtext0()
endif
if sys.lang==6 then
call qtext6()
endif
endfunction
endlibrary










library task1
private function settask takes string a,string b,string c,string d,string e,string f returns nothing
call ss("questtitle",sys.task1,a)
call ss("questtip",sys.task1,b)
call ss("questdesc",sys.task1,c)
call ss("questback",sys.task1,d)
call ss("questitem",sys.task1,e)
call ss("questdone",sys.task1,f)
set sys.task1=sys.task1+1
endfunction

private function setqitem takes string a returns nothing
call ss("questitem",sys.task1,a)
endfunction

private function qtext0 takes nothing returns nothing
call settask("Eagan Peltskinner","Speak with Eagan Peltskinner.
","Eagan Peltskinner is looking for someone to hunt wolves for him. That's good news, because we're seeing a lot more wolves in Northshire Valley lately.
If you're interested then speak with Eagan. He's around the side of the abbey, to the left.
",null,null,"That's true. I'm looking for someone to hunt me some wolves! Are you that person?")


call settask("Wolves Across the Border","Bring 8 pieces of Tough Wolf Meat to Eagan Peltskinner outside Northshire Abbey.
","I hate those nasty timber wolves! But I sure like eating wolf steaks... Bring me tough wolf meat and I will exchange it for something you'll find useful.
Tough wolf meat is gathered from hunting the timber wolves and young wolves wandering the Northshire countryside.
","Hey <name>. I'm getting hungry...did you get that tough wolf meat?
","Tough Wolf Meat","You've been busy! I can't wait to cook up that wolf meat")


call settask("Milly Osworth","Speak with Milly Osworth.
","You've shown yourself a dependable <class>, <name>. Dependable, and not afraid to get your hands dirty, eh?
I have a friend, Milly Osworth, who's in some trouble. She's over with her wagon on the other side of the abbey, near the stable. I'm sure she could use a pair of hands like yours.
",null,null,"Oh, Deputy Willem told you to speak with me? He's a brave man and always willing to help, but his duties keep him stuck at Northshire Abbey and I'm afraid the problem I have today is beyond him.
Perhaps you can help me?")


call settask("Milly's Harvest","Bring 8 crates of Milly's Harvest to Milly Osworth at Northshire Abbey.
","A gang of brigands, the Defias, moved into the Northshire Vineyards while I was harvesting! I reported it to the Northshire guards and they assured me they'd take care of things, but... I'm afraid for my crop of grapes! If the Defias don't steal them then I fear our guards will trample them when they chase away the thugs.
Please, you must help me! I gathered most of my grapes into buckets, but I left them in the vineyards to the southeast.
Bring me those buckets! Save my harvest!
","Do you have my harvest, <name>?
","Milly's Harvest","Oh thank you, <name>! You saved my harvest! And I hope you showed a few of those Defias that they can't cause trouble around here.
We might be short on guards these days, but we're lucky to have heroes like you to protect us!")

call settask("Grape Manifest","Bring the Grape Manifest to Brother Neals in Northshire Abbey.
","Now that my crop is saved, take this Grape Manifest to Brother Neals. He manages the store of food and drink in Northshire, and I'm sure he'll be delighted to hear that he has fresh grapes.
You'll find Brother Neals in the abbey, in the bell tower... where he likes to taste his wine.
","You look to be in fine spirits! Come! Have a seat, and have a drink!
",null,"Let's see here...
Oh my! Milly's grapes have been saved! When she told me that brigands overran her vineyards I nearly despaired, but my faith in the Light did not waver!
And through your bravery, we now have grapes for more wine! May the Light bless you, <name>, and keep you safe!")

call settask("Gold Dust Exchange","Bring 10 Gold Dust to Remy 'Two Times' in Goldshire. Gold Dust is gathered from Kobolds in Elwynn Forest.
","The Kobolds in these parts sometimes carry Gold Dust on them. I could really use the stuff - bring me a load of it and I'll give you the best price in town...best price in town!
You can find kobolds in the Fargodeep Mine to the south, and around the Jasperlode Mine to the northeast. 
","Psst! You have that Gold Dust for me...for me?
","Gold Dust","Thanks for the dust, <name>. Here's your cash, and...here is a token from associates of mine. You might find it useful...useful.")


call settask("Kobold Candles","Bring 8 Large Candles to William Pestle in Goldshire.
","Hello, <good sir/my lady>! Do you have a moment?
My brother and I run an apothecary in Stormwind, and I'm here to gather large candles for their wax. Can you help me?
You can get large candles from kobolds, and I hear rumors that kobolds are infesting the Elwynn mines ... the Fargodeep mine to the south and Jasperlode Mine to the east. I suggest looking for candles in one of those places. 
","Did you gather those candles yet?
","Large Candle","You were busy hunting kobolds, were you? Thanks for the candles, <name>, and here's your reward...")


call settask("A Fishy Peril","Remy 'Two Times' wants you to speak with Marshal Dughan in Goldshire.
","<name>, there's a new threat in Elwynn Forest! Murlocs are swimming up the streams of eastern Elwynn, scaring away fish and attacking gentle folk!
I warned Marshal Dughan, but he's more worried about the gnolls and the bandits. He's not convinced that the murlocs are a danger.
Please, <name>, speak to Dughan and persuade him to send more troops to the east!
",null,null,"Yes, I spoke with Remy. I respect him as a merchant, though all reports of Murlocs to the east have been sketchy at best.
Your concerns are noted, but unless I receive a military report of a murloc threat, we can't afford to send more troops east.")


call settask("Further Concerns","Marshal Dughan wants you to speak with Guard Thomas.
","If you are concerned that the rumors of murlocs are true, then do this -- travel to the eastern Elwynn bridge and speak with Guard Thomas. He has been stationed at the bridge for the past week and will know the state of the area.
Bring me his report.
",null,null,"Yes, murlocs have settled in and around the streams of eastern Elwynn. We don't know why they are here, but they are aggressive and at least semi-intelligent.")


call settask("Find the Lost Guards","Guard Thomas wants you to travel north up the river and search for the two lost guards, Rolf and Malakai.
","A few days ago we sent two Guards, Rolf and Malakai, to investigate along the river, and they have not yet returned. To complete my report, I must know what happened to those men.
Travel north along the river and find the guards... or their remains.
",null,null,"Although much has been stripped from the corpse, strewn nearby is a medallion with the words: 'Footman Malakai Stone' etched upon it.")


call settask("Discover Rolf's Fate","Search the murloc village for Rolf, or signs of his death.
","Upon further searching the area, you find webbed footprints leading east along the shore of Stone Cairn Lake. In the distance to the east, you can just barely see a Murloc village.
Perhaps Rolf's fate ended there...
",null,null,"You find around the neck of the corpse a metal medallion inscribed with the words 'Footman Rolf Hartford.'")


call settask("Report to Thomas","Deliver Rolf and Malakai's Medallions to Guard Thomas at the eastern Elwynn bridge.
","Now that you have both medallions, deliver them to Guard Thomas at the bridge so that he might know the fate of his murdered guards.
","Hello, <name>. Have you discovered the fates of Rolf and Malakai?
",null,"You have confirmed my fears, <name>. The murlocs are a threat we cannot ignore.")


call settask("Deliver Thomas' Report","Report to Marshal Dughan in Goldshire.
","Tell Marshal Dughan of Malakai and Rolf's deaths, and report to him that the Murlocs in eastern Elwynn cannot be contained by our current troop presence.
I know we don't have many troops to spare, but hopefully Dughan can find someone.
",null,null,"Hmm, this news is troubling. Already our defenses are stretched thin, and losing Rolf and Malakai to those murlocs put us in an even worse position.
If things don't improve, there will be fighting in Goldshire by the week's end!")

call settask("Cloth and Leather Armor","Give Sara Timberlain the Stormwind Armor Marker.
","For your shrewdness and valor, I have a marker here that is good for one piece of armor. I want you to take it to Sara Timberlain at the Eastvale Logging Camp. Give her the marker, and she will fashion the armor for you. And after you receive it, <name>, use it in the defense of Elwynn.
The Eastvale Logging Camp is beyond Guard Thomas' post to the east.
","I have been commissioned by the Stormwind Army to supply their people with cloth and leather armor.
If you have a marker for me, then I'd be happy to make you something.
",null,"Ah, thank you for the marker. Please feel free to pick your choice of armor.
Luck to you, brave <class>. And may this armor serve you well.")

call settask("A Bundle of Trouble","Bring 8 Bundles of Wood to Raelen at the Eastvale Logging Camp.
","I've got a real problem on my hands. I have a deadline looming for an order of lumber, and I'm running out of time. The wolves and bears north of here have chased my workers away from the bundles of wood that they've already chopped.
I've already talked to Deputy Rainer about clearing the animals, but I need someone to go collect the wood for me. If you could collect eight bundles of wood for me I might just make my deadline.
","That deadline isn't getting any further away, <class>. Please hurry and collect those bundles of wood.
","Bundle of Wood","Excellent! Thanks to you, I should be able to complete the order in time. To show my gratitude, I would like to offer some coin as compensation for your troubles.
Thank you and farewell.")

call settask("Protect the Frontier","Kill 13 Prowlers, and then return to Guard Thomas at the east Elwynn bridge.
","Hail, <name>. Wild animals are growing more and more aggressive the farther we get from Goldshire, and the Eastvale Logging Camp suffers nearly constant attacks from wolves and bears!
We could use your help out here.
","Have you killed those wolves and bears?
",null,"Thanks a lot for the help, <name>. Something in the forest must be making these animals so bold.
Whatever it is, I hope it stays there.")

call settask("Bounty on Murlocs","Bring 8 Torn Murloc Fins to Guard Thomas at the east Elwynn bridge.
","The Stormwind Army has placed a bounty on murloc lurkers and foragers in Elwynn. Slaughter them and bring me their torn murloc fins, and the Stormwind Army will reward you well.
The murlocs have built a village at Stone Cairn Lake north of here, and another to the south where the stream forks.
","How goes the hunting, <name>?
","Torn Murloc Fin","You have the fins? Great! Marshal Dughan is anxious about the Murloc situation in eastern Elwynn, and I'd like to tell him that it's becoming under control.
Your actions have helped realize that.")

call settask("Westfall Stew","Verna Furlbrow wants you to deliver her recipe for Westfall Stew to Salma Saldean
","I never thought the day would come when I'd leave the farm. But the fields are overrun with thieves and it's far too dangerous for us here now. As soon as Farmer Furlbrow gets the wagon fixed, we'll be on our way. 
Maybe you could do me a favor? Let me scribble down my recipe for Westfall stew. Please take it to Salma Saldean over on the farm yonder. The Saldean's farm is just beyond the fork in the road
","I'm going to miss that Verna Furlbrow so much. I don't suppose you happened to see her on your way here?
",null,"That Verna was always such a sweet lass. We'll miss her here in Westfall but between you and me, she's a city girl at heart and Stormwind will suit her just fine. But enough gossip! Now we can make Westfall Stew!")

call settask("Westfall Stew","Salma Saldean wants 12 Murloc Eyes.
","Help me make some Westfall Stew! Come back with the following ingredients:
12 Murloc Eyes
","Come back with the following ingredients:
12 Murloc Eyes
","Murloc Eye","That Okra will thicken up this broth nicely! Now we just add the Stringy Vulture Meat, a few Murloc Eyes and those delicious Goretusk Snouts. And we're done! For all your help, <name>, I want you to take today's first batch of Westfall Stew!")

call settask("Goretusk Liver Pie","Salma Saldean needs 8 Goretusk livers to make a Goretusk Liver Pie
","The onions are peeled. The garlic is minced. The rosemary is crushed. The crust has been baked. The dill weed is chopped. The gravy is simmering. Now all I need for my famous meat pie are 8 Goretusk Livers!
","All I need for my famous meat pie are 8 Goretusk Livers!
","Goretusk liver","These are just perfect, <name>! Thank you so much. Farmer Saldean and I are going to feast tonight. And here is a little something for you, for the hard work. You didn't think I was going to let a <class> like you go hungry, did you?")

call settask("Poor Old Blanchy","Verna Furlbrow in Westfall wants you to bring her 8 Handfuls of Oats
","Poor Old Blanchy! Such a tired beast after all the work we put her through. I fed her before we left the farm, but we weren't expecting the wagon to break on us. If you could bring her a few handfuls of oats from the fields, I'd be grateful.
I bet you could find some around all of the farms in Westfall, if you can steer clear of those horrific machines that have taken over. There are several farms southwest of here
","Old Blanchy is on her last leg. Did you happen to find any oats for her?
","Handfuls of Oat","Thank you so much, <name>! Poor Old Blanchy will be so happy!")

call settask("The Forgotten Heirloom","Farmer Furlbrow wants you to retrieve his pocket watch from the wardrobe in his farmhouse at the pumpkin farm to the West.
","It was horrible! Verna woke me when she heard a ruckus in the fields. The fields were full of hooligans. We left in a rush and I forgot to pack my pocket watch. Verna's pa gave me that watch on our wedding day and I feel just sick knowing those thieves have it. I left the pocket watch in the wardrobe at the farmhouse. Look for the field of pumpkins to the West -- you can't miss it. If you bring it back to me, I'd sure be grateful!
","Don't suppose you were able to get my watch?
","Furlbrow's Pocket Watch","My watch! Thank you so much, kind sir!
We are but poor farmers and we have lost our land but please accept this reward as a token of our appreciation.")

call settask("The Killing Fields","Farmer Saldean wants you to kill 20 Harvest Watchers
","Look at what has happened to this place! These lands were once occupied by good farm folk. But the damned thieves have driven them all off. Not me, though! But it seems some Harvest Watchers have taken over the fields.
If you're up for the work, I'd like you to go out and kill twenty of them. Come back when you're done for your pay. If you finish up with the ones in my field, clear them from the neighboring fields as well.
","Ah, I see you're back! I hope you've been hard at work clearing those fields of those Harvest Watchers. Have you killed twenty yet?
",null,"Good work, friend. You have earned your pay well. Who knows, perhaps Westfall will prosper once again.")

call settask("Collecting Memories","Retrieve 4 Miners' Union Cards and return them to Wilder Thistlenettle in Stormwind
","Many of my friends perished that horrible day when the mine tunnel caved in. If your adventures happen to bring you into that wing of the mine in Moonbrook, please keep an eye out for any sign which might identify them. If you come across any of their Miners' Union Cards, bring them back to me and I'll make sure their families get some resolution from this horrible accident
","Were you able to retrieve any of my old co-worker's Miners' Union Cards?
","Miners' Union Card","Thank you for collecting these, <name>. Your efforts will help bring peace to the dead in the wake of this tragedy. I will see to it that the families are notified.")

/*
call settask("","
","
","
","","")
*/
endfunction
private function qtext6 takes nothing returns nothing
endfunction


function taskinit1 takes nothing  returns nothing
if sys.lang==0 then
call qtext0()
endif
if sys.lang==6 then
call qtext6()
endif
endfunction

endlibrary





library task2
private function settask takes string a,string b,string c,string d,string e,string f returns nothing
call ss("questtitle",sys.task2,a)
call ss("questtip",sys.task2,b)
call ss("questdesc",sys.task2,c)
call ss("questback",sys.task2,d)
call ss("questitem",sys.task2,e)
call ss("questdone",sys.task2,f)
set sys.task2=sys.task2+1
endfunction


private function qtext0 takes nothing returns nothing
call settask("Brotherhood of Thieves","Bring 12 Red Burlap Bandanas to Deputy Willem outside the Northshire Abbey.
","Recently, a new group of thieves has been hanging around Northshire. They call themselves the Defias Brotherhood, and have been seen across the river to the east.
I don't know what they're up to, but I'm sure it's not good! Bring me the bandanas they wear, and I'll reward you with a weapon.
","Have you gathered those bandanas for me yet?
","Red Burlap Bandana","Back with some bandanas, I see. The Stormwind Army appreciates your help.")


call settask("Bounty on Garrick Padfoot","Kill Garrick Padfoot and bring his head to Deputy Willem at Northshire Abbey.
","Garrick Padfoot - a cutthroat who's plagued our farmers and merchants for weeks - was seen at a shack near the vineyards, which lies east of the Abbey and across the bridge. Bring me the villain's head, and earn his bounty!
But be wary, <name>. Garrick has gathered a gang of thugs around him. He will not be an easy man to reach.
","Did you find Garrick's shack? Are we finally free of that villain?
","Garrick's Head","Hah - you caught him! You've done Elwynn a great service, and earned a nice bounty!")


call settask("Red Linen Goods","Bring 6 Red Linen Bandanas to Sara Timberlain at the Eastvale Logging Camp.
","The Defias gang in Northshire wears burlap masks, but the Defias in Elwynn wear linen which I can use to make fine linen goods.
Bring me red linen bandanas and I'll use them to fashion something for you.
Defias gang members have camps pocketed throughout Elwynn.
","I'm running low on linen, <name>. Do you have any for me?
","Red Linen Bandana","Ah, these are nice bandanas, if a little rough...")


call settask("The Collector","Go to Marshal Dughan in Goldshire and give him The Collector's Schedule.
","This note is a schedule with a list of days and times when a person -- described only as 'The Collector' -- will receive a shipment of gold from the mines in Elwynn Forest.
From the schedule, it looks as if the Collector resides near the Brackwell Pumpkin Patch in eastern Elwynn.
This sounds important. You should report it to Marshal Dughan in Goldshire.
","What?!? We haven't had our people working the Elwynn mines for months!
Let me see that note you have...
",null,"Hm... I have heard of this 'Collector' but I don't know whom he's working for. Thank you for the schedule. It will help us solve this mystery.")


call settask("Manhunt","Find and kill 'the Collector' then return to Marshal Dughan with The Collector's Ring.
","If the 'Collector' is taking gold from our mines then he's stealing from the kingdom! Bring the Collector to justice,and bring me the ring mentioned in the pickup schedule you gave me. It may tell us whom the Collector is working for...
That Pickup Schedule says the Collector is hiding out at the Brackwell Pumpkin Patch. You should search for him there.
","Did you find the Collector? Did you discover whom he's working for?
","The Collector's Ring","You found him? Well done, <name>. He won't be 'collecting' from the Elwynn Mines again!
And this ring you found is interesting... it's a membership ring for the old Stonemason's Guild in Stormwind. Why would a lowly thief have an artisan guild ring, and why are the Defias Thieves collecting money from our mines?
Difficult questions. I hope one day we'll have answers.")

call settask("Continue to Stormwind","Buy a gryphon ride from the gryphon master Thor, then bring Lewis' Note to Osric Strang, in the shop Limited Immunity, in the Old Town of Stormwind
","For a small fee, you can take a gryphon to Stormwind, so you can deliver Lewis' note to Osric. You won't get there faster any other way.
If that sounds acceptable, then just speak to me again when you're ready for the ride. I'll charge you a little, but trust me; it'll be worth it!
","You've been traveling, eh? Have you been anywhere interesting?
",null,"Ah, a note from Quartermaster Lewis? I'm not surprised he needs more gear. Sentinel Hill is far away, in a land Stormwind has all but forgotten.
Well thank you, <name>. Here's some money to cover your travel costs.")

call settask("Dungar Longdrink","Bring Osric's Crate to Dungar Longdrink the gryphon master.
","<name>, I gathered into this crate everything Lewis asked for. Can you take it to him?
If you've already spoken to Thor in Westfall, then you can take a gryphon back to him. Dungar Longdrink is our gryphon master, over in the trade district.
Speak with Dungar, then get this crate to Lewis as fast as you can. We don't want our fighting men and women in Westfall to go without fresh equipment!
","Is that sweat on your brow, lad? You've been running too much. Next time, take a gryphon!
",null,"A crate for Westfall, eh? Have you been to Westall before? If so, then it's no problem, my friend. I have plenty of gryphons trained to fly that route!")

call settask("Keeper of the Flame","Bring 5 Flasks of Oil to Captain Grayson at the Westfall Lighthouse
","The night the Lighthouse Keeper's family died was horrible. I watched, helpless, as Old Murk-Eye led the attack. But what's done is done and now my concern is for the lives of the sailors on The Great Sea whose ships come close to the perilous rocks of the coastline. With no one to keep watch on the flame the responsibility has fallen upon me.
Help me keep the torch lit by bringing me 5 flasks of oil from the Harvest Monsters
","The flame will not burn for long without oil, <name>.
","Flask of Oil","Praise you, brave <class>. The rocks of the Westfall Coast shall be lit thanks to your hard work. Many lives will be spared so long as the torch is kept lit.
I died needlessly on this very shore. My afterlife plight is to see that no others follow my destiny")

call settask("The Coast Isn't Clear","Kill 28 Oracles and return to Captain Grayson at the Westfall Lighthouse
","You probably noticed all of the shipwrecks along the coast. The Great Sea is treacherous indeed. The coast of Westfall needs to be kept clear, so that if sailors find their way to our beaches, they are safe. The Murlocs are trouble though.
Kill 28 Oracles and I will see to it that you are rewarded
","Kill 28 Oracles and I will see to it that you are rewarded.
",null,"Well done, <name>. You have quite a knack for combat. Thanks to you the Coast of Westfall is a safer place.")

call settask("The Coastal Menace","Bring a scale of Old Murk-Eye to Captain Grayson at the Westfall Lighthouse.
","When my life was ended upon the rocks, I had no clue what the afterlife held for me. The Lighthouse was black that night because Old Murk-Eye had scared the keeper's family off. They returned and re-lit the flame but Old Murk-Eye coerced the weaker minded murlocs to raid the Lighthouse with him once again. The second time the family was not so lucky and before my eyes they perished helplessly.
Slay Old Murk-Eye if you see him along the shore and bring me one of his scales and I shall reward you
","Have you laid waste to the menace known as Old Murk-Eye yet? He has been spotted roaming the coastline of Westfall.
Return to me when the foul beast is dead.
","Scale of Old Murk-Eye","So the foul heathen, Murk-Eye is dead. Well done, <name>. By your hands one life was laid to rest but perhaps many more were saved. The Great Sea, wrought with danger as it is, shall be a wee bit safer this night thanks to your heroics.")

call settask("Oh Brother. . .","Bring Foreman Thistlenettle's Explorers' League Badge to Wilder Thistlenettle in Stormwind
","We were deep in a vast mine in Westfall, hidden beneath a barn in Moonbrook. No clue where these stinkin' thieving types came from. Anyway, the mine tunnel collapsed on us. I got out but the others... well... the others haven't been heard from.
You look like you might have better luck in there. If you could look for my brother, I'd be thankful. He always carried his Explorers' League Badge. If you can't find him, that badge would at least give me some peace of mind
","Did you find any sign of my brother? Is there any hope after all this time?
","Thistlenettle's Badge","My suspicions were correct. My poor brother.... Well, thank you for bringing some conclusion to this mystery, even if the conclusion was grim.")


/*
call settask("","
","
","
","","")
*/

endfunction

private function qtext6 takes nothing returns nothing
endfunction
function taskinit2 takes nothing  returns nothing
if sys.lang==0 then
call qtext0()
endif
if sys.lang==6 then
call qtext6()
endif
endfunction
endlibrary




library task3
private function settask takes string a,string b,string c,string d,string e,string f returns nothing
call ss("questtitle",sys.task3,a)
call ss("questtip",sys.task3,b)
call ss("questdesc",sys.task3,c)
call ss("questback",sys.task3,d)
call ss("questitem",sys.task3,e)
call ss("questdone",sys.task3,f)
set sys.task3=sys.task3+1
endfunction

private function setqitem takes string a returns nothing
call ss("questitem",sys.task3,a)
endfunction

private function qtext0 takes nothing returns nothing

call settask("Young Lovers","Give Maybell's Love Letter to Tommy Joe Stonefield
","Oh, I'm cursed! My heart belongs to Tommy Joe Stonefield, but our families are bitter enemies. So I can't see him, even though my eyes ache to gaze upon that handsome face!
Please, take this letter and give it to Tommy Joe. He's usually at the river to the west of the Stonefield Farm, which is due west of here.
","You have what?? Maybell is the light of my dull life. Hurry, let me see her letter!
",null,"Ah! I can't stand us being apart. I have to see her!!")

call settask("Speak with Gramma","Speak with Gramma Stonefield.
","Please, <name>, talk with my Gramma. If anyone can find a way to bring me together with Maybell, she can.
She's inside our house east of here.
","I can't wait to hear how my friends react!
They'll never expect it
",null,"While our families are feuding, Tommy Joe and Maybell don't have much of a future, but... maybe we can get them together for just a little while.
Hm, what can we do...")


call settask("Note to William","Take Gramma Stonefield's Note to William Pestle.
","I bet William Pestle has a potion to unite our two young lovers!
Here, take this note to William. He's staying at the Lion's Pride Inn in Goldshire.
","You have a note from 'Gramma' Stonefield, eh? I haven't seen Mildred in years! I wonder what she has to say...
",null,"My heart goes out to those two poor souls, Maybell and Tommy Joe. I remember being young and in love, once.
There must be something I can do to help them! Let me think...")

call settask("Collecting Kelp","Bring 4 Crystal Kelp Fronds to William Pestle in Goldshire.
","I can make an invisibility liquor for Maybell, so she can slip away from the Maclure Vineyards and go to Tommy Joe. But to make the Liquor, I need some crystal kelp.
Although the kelp usually grows in the ocean... sometimes murlocs collect it. See if the murlocs near Crystal Lake have any. Crystal Lake is just east of Goldshire.
","Do you have that crystal kelp? I'm sure Maybell is anxious to see her beau...
","Crystal Kelp Frond","You got them. Good show! Now, just one moment while I concoct the potion...")

call settask("The Escape","Take the Invisibility Liquor to Maybell Maclure.
","Take this invisibility liquor to young Maybell. It should last long enough for her to visit Tommy Joe.
","Did you deliver my letter to Tommy Joe? What did he say??
",null,"Oh...my! I feel guilty deceiving my family, but my feelings for Tommy Joe are too strong to ignore.
Thank you, <name>. I'll drink this liquor as soon as I have the chance and sneak away to my love.
And for you... please take this.")

call settask("Patrolling Westfall","Bring 8 Gnoll Paws to Captain Danuvin on Sentinel Hill
","Stormwind has abandoned us. A foul wind of depravity rustles through the plains of Westfall. This was my homeland and I will not turn my back on the citizens who choose to remain here. We, the former farmers, shall make our stand.
Your task, should you choose to accept, is to patrol the grasslands of Westfall. Track down and slay the vile Gnolls that seem to be working in conjunction with the Deadmines thieves. Bring me eight Gnoll Paws and I will reward your bravery.
","Have you collected 8 paws from those treacherous Gnolls yet?
","Gnoll Paw","Well done, <name>. With valiant adventurers such as yourself fighting alongside The People's Militia, Westfall just might return to the prosperous breadbasket it once was. Please accept this in recognition of your tireless efforts.")

call settask("Red Leather Bandanas","Bring 15 Red Leather Bandanas to Scout Galiaan at Sentinel Hill
","The Defias Front is constantly shifting. I've been following their movements for quite some time now. On a side note, I've ascertained that many members of the gang can be tracked by the Red Leather Bandanas they wear.
Bring me 15 of these Bandanas and I'll see to it you are rewarded
","Bring me 15 red leather bandanas and I'll pay you well
","Red Leather Bandana","Nice work, <race>. Please accept one of these items as payment for all your hard work")

call settask("Red Silk Bandanas","Scout Riell at the Sentinel Hill Tower wants you to bring her 10 Red Silk Bandanas.
","It's no secret that the trademark of the Defias Gang is their Red Bandanas. But we've learned that the material from which these bandanas are made signifies the member's rank.
That being said, I want you to eliminate as many high ranking Defias members as you can. The highest ranking members will undoubtedly be found in VanCleef's secret hideout. When you're done bring me 10 Red Silk Bandanas as proof of their deaths and I will reward you. Good luck, <name>.
","Have you been reclaiming our land from the Defias gang? If so show me 10 Red Silk Bandanas as proof.
","Red Silk Bandana","Well done, <name>! On behalf of The People's Militia I salute you for your efforts. Soon we will return this land to the people with help from brave souls like you.")




/*
call settask("","
","
","
","","")
*/
endfunction
private function qtext6 takes nothing returns nothing
endfunction
function taskinit3 takes nothing  returns nothing
if sys.lang==0 then
call qtext0()
endif
if sys.lang==6 then
call qtext6()
endif
endfunction
endlibrary



library task4

private function settask takes string a,string b,string c,string d,string e,string f returns nothing
call ss("questtitle",sys.task4,a)
call ss("questtip",sys.task4,b)
call ss("questdesc",sys.task4,c)
call ss("questback",sys.task4,d)
call ss("questitem",sys.task4,e)
call ss("questdone",sys.task4,f)
set sys.task4=sys.task4+1
endfunction

function qtext0 takes nothing returns nothing

call settask("Lost Necklace","Speak with Billy Maclure.
","I lost my necklace, and think that guttersnipe Billy Maclure took it! He's usually scuttling like a rat around the Maclure vineyards east of here. 
Get my necklace back for me, and you'll warm an old widow's heart.
",null,null,"You lost a what? Well I didn't take no necklace, because I ain't no thief!
I might know who did but...<grin>...I'm too hungry to remember.")

call settask("Pie for Billy","Bring 4 Chunks of Boar Meat to Auntie Bernice Stonefield at the Stonefield's Farm
","Maybe if I got a pie, I could tell you who has that necklace. And you know, I think that old Bernice lady at that other farm makes great Pork Belly Pies...
Maybe if you gave her some chunks of boar meat from the boars that hang around our farms, and told her what it was for, she'd bake up a pie for you.
","I don't think it's right feeding the boy who stole my necklace in the first place, but if that's what it takes to get back what's mine, then so be it!
Do you have that boar meat?
","Chunk of Boar Meat","Though this wild boar meat is tough, simmer it enough and it sure does make for some tasty pie!")

call settask("Back to Billy","Bring the Pork Belly Pie to Billy Maclure at the Maclure Vineyards.
","Here you go. And when you give this pie to that Billy, you tell him I hope he chokes on it!
","Ugh... I'm starving! Do you have that pie for me, <name>?
",null,"Mm, yum! This pie is the best!
I think my memory is coming back to me...")

call settask("Goldtooth","Bring Bernice's Necklace to 'Auntie' Bernice Stonefield at the Stonefield Farm.
","I was playing near the Fargodeep Mine, and I think I dropped, er...I mean I saw, the old lady's necklace. Don't ask me how it got there...it wasn't me!
Well anyway, I saw this big, gold-toothed kobold pick up the necklace and run into the mine. Go find that kobold and you'll find the necklace, I swear!
","Hello, <name>. Have you found my necklace?
","Bernice's Necklace","Oh, you found it! Thank you, thank you dear!
Here, take this. It was my husband's and he always said it was lucky. If only he didn't forget it on his last campaign! *sniff*")

call settask("Princess Must Die!","Kill Princess, grab her collar, then bring it back to Ma Stonefield at the Stonefield Farm.
","The Brackwells have a prize-winning pig, Princess. The sow is HUGE, and she got that way from sneaking over here and eating my veggies!
So before she comes to our fields...Princess must die! Bring me her collar as proof of the deed and I'll give you something for your time!
Princess is usually over at the Brackwell Pumpkin Patch, to the east and beyond the Maclure farm. Get her before she gets hungry and comes back here!
","Did you see her yet? Did you get her?
","Brass Collar","Thank goodness! That pig was getting so big she'd have eaten our whole crop! Thank you, <name>.
Now, do either of these suit you?")


call settask("Captain Sander's Hidden Treasure","Find Captain Sanders' footlocker and search it for the next clue.
","If ye be readin' this, it means that Ol' Captain Sanders is in a watery grave. So my treasure is yours now, ye jest need to follow the clues. 
First ye need to find me footlocker. It's probably half-buried in sand by now, along the Western Coast of Westfall near the shipwreck. There be lots of shipwrecks but only one rusty anchor on the coast. Find that anchor and you'll find me locker! Look in there for the next clue.
",null,null,"The footlocker slowly creaks open. Sand and water seem to be its only contents. But wait! A small crab scurries out with a clue to the treasure in his claws!")

call settask("Captain Sander's Hidden Treasure","Find the old barrel near the ruined chimney and search it for your next clue
","The clue to the treasure reads: Good work, matey! Now ye need to head due east. East up the bluffs, east to the road. Look for the ol' chimney ruins near the side of the road. There you'll find an old barrel with your next clue.
",null,null,"Good work, treasure hunter!")

call settask("Captain Sander's Hidden Treasure","Search the empty jug next to the windmill for the next clue
","Searching through the barrel you discover another piece of parchment. This one reads: Now from this here barrel, face ye North. Straight as the crow flies, keep ye walkin' till you see the empty jug next to the lone windmill on the sea bluffs. If ye poke around that jug, ye just might find what you're lookin' for.
",null,null,"You're on your way to the jackpot, treasure seeker!")

call settask("Captain Sander's Hidden Treasure","Locate Captain Sanders' chest and open it for your reward
","Sure enough, deep within the Old Jug there is another clue to Sander's treasure. The ink has run in some places and the paper smells like whiskey but you can make out some of the text: Now that ye found me ol' whiskey jug, you're almost to the treasure! Just face West from the bottle and walk down to the shore. Once ye get to the water, keep going! Swim straight west till you find the island with me treasure chest!
",null,null,"The hinges on the old chest are rusty but they still work. You force the chest open and take the booty.
Congratulations!")


call settask("Humble Beginnings","Go to Baros Alexston's house in Westfall and search for his compass, then return it to him in Cathedral Square of Stormwind
","It seems an eternity since I was a boy working the farm in Westfall. They say you can never go back, and it's true. Doubly true in my case, my family's home has been burned down and taken over by thieves.
I have spoken with my father about the fate of some of my possessions, including my first compass. He was unable to save them. However, he also says that they should be hidden away on the farm.
You'll find the Alexston Farmstead west of Sentinel Hill. Perhaps you could go and retrieve it for me?
","<name>! Did you have any luck?
","A Simple Compass","Oh, thank you, <name>! It's of no practical use to me, but the sentimental value... Needless to say, thank you for bringing this to me... at some cost to your own well-being, not to mention the time it took to go all the way down to Westfall. You have my gratitude, and have this as a token of my thanks.")

call settask("Underground Assault","Retrieve the Gnoam Sprecklesprocket from the Deadmines and return it to Shoni the Shilent in Stormwind
","Gnomeregan has fallen under the control of those dastardly troggs! The situation is grave but perhaps you can help, <name>.
Deep in the Deadmines is a functional goblin shredder. Find that shredder and bring back the intact power supply. With the shredder's power supply, we can give our gyrodrillmatic excavationators the power they need to break through the rocky underground borders of Gnomeregan, opening the way for a gnomish assault!
","Have you found the Gnoam Sprecklesprocket, <name>?
","Gnoam Sprecklesprocket","Well done, <name>. Thanks to you, Gnomeregan is one step closer to its day of liberation!")


/*
call settask("","
","
","
","","")
*/

endfunction
private function qtext6 takes nothing returns nothing
endfunction
function taskinit4 takes nothing  returns nothing
if sys.lang==0 then
call qtext0()
endif
if sys.lang==6 then
call qtext6()
endif
endfunction
endlibrary

library quest0 initializer init uses sys

private function setquest takes integer a,integer b,integer c,integer d,integer e,integer f,integer g,integer h,integer i,integer j returns nothing
call si("questlevel",sys.quest0,a)
call si("questclass",sys.quest0,b)
call si("questtype",sys.quest0,c)
call si("questdrop",sys.quest0,d)
call si("questnum",sys.quest0,e)
call si("questaward",sys.quest0,f)
call si("questtime",sys.quest0,g)
call si("questgiver",sys.quest0,h)
call si("questanwser",sys.quest0,i)
call si("questtarget",sys.quest0,j)
set sys.quest0=sys.quest0+1
endfunction

private function setqxy takes integer a,integer b returns nothing
call si("qx",sys.quest0,100*a)
call si("qy",sys.quest0,100*b)
endfunction


private function taskinit takes nothing returns nothing
call setquest(1,0,0,0,0,0,0,1,2,0)

call setqxy(17,-29)
call setquest(1,0,0,0,10,0,0,2,2,2)

call setqxy(30,-15)
call setquest(2,0,0,0,10,0,0,2,2,3)

call setqxy(-17,-34)
call setquest(3,0,0,0,12,1,0,2,2,4)

call setquest(5,0,0,0,0,0,0,2,6,0)

call setqxy(22,-60)
call setquest(7,0,1,0,1,0,0,6,6,2)

call setqxy(-54,38)
call setquest(10,0,1,0,1,1,0,6,6,3)

call setquest(10,0,0,0,0,0,0,6,10,0)

call setqxy(32,21)
call setquest(10,0,0,80,8,0,0,10,10,10)

call setqxy(27,33)
call setquest(11,1,0,100,1,1,0,10,6,11)

call setquest(11,0,0,0,0,0,0,6,21,0)

call setquest(13,0,0,30,0,0,0,21,21,21)
call setquest(16,0,0,30,0,0,0,21,21,24)
call setquest(18,0,0,25,0,0,0,21,21,27)
call setquest(19,0,0,1,100,0,0,21,21,26)
call setquest(20,0,2,1,0,0,0,32,21,0)
call setquest(20,1,0,1,100,0,0,21,21,42)
/*
call setquest(1,0,0,0,0,0,0,0,1,0)
*/

endfunction

private function init takes nothing  returns nothing
call taskinit()
endfunction

endlibrary



library quest1 initializer init requires sys

private function setquest takes integer a,integer b,integer c,integer d,integer e,integer f,integer g,integer h,integer i,integer j returns nothing
call si("questlevel",sys.quest1,a)
call si("questclass",sys.quest1,b)
call si("questtype",sys.quest1,c)
call si("questdrop",sys.quest1,d)
call si("questnum",sys.quest1,e)
call si("questaward",sys.quest1,f)
call si("questtime",sys.quest1,g)
call si("questgiver",sys.quest1,h)
call si("questanwser",sys.quest1,i)
call si("questtarget",sys.quest1,j)
set sys.quest1=sys.quest1+1
endfunction

private function setqxy takes integer a,integer b returns nothing
call si("qx",sys.quest1,100*a)
call si("qy",sys.quest1,100*b)
endfunction

private function taskinit takes nothing returns nothing
call setquest(1,0,0,0,0,0,0,1,3,0)

call setqxy(21,-5)
call setquest(1,0,0,100,8,0,0,3,3,1)

call setquest(3,0,0,0,0,0,0,3,4,0)

call setqxy(-39,4)
call setquest(4,0,1,80,8,1,0,4,4,1)

call setquest(5,0,0,0,0,0,0,4,5,0)

call setqxy(36,-54)
call setquest(7,0,0,80,10,0,0,7,7,7)

call setqxy(-55,31)
call setquest(8,0,0,70,8,0,0,8,8,8)

call setquest(8,0,0,0,0,0,0,7,6,0)

call setquest(8,0,0,0,0,0,0,6,14,0)

call setquest(8,0,0,0,0,0,0,14,15,0)

call setquest(8,0,0,0,0,0,0,15,16,0)

call setquest(8,0,0,0,0,0,0,16,14,0)

call setquest(8,0,0,0,0,0,0,14,6,0)

call setquest(10,0,0,0,0,1,0,6,9,0)

call setqxy(-41,-41)
call setquest(10,0,1,80,8,0,0,17,17,4)

call setqxy(-18,-36)
call setquest(10,0,0,0,13,0,0,14,14,14)

call setqxy(-16,-9)
call setquest(10,0,0,70,8,1,0,14,14,15)

call setquest(12,0,0,0,0,0,0,24,25,0)
call setquest(12,0,0,12,50,0,0,25,25,19)
call setquest(14,0,0,8,40,0,0,25,25,20)
call setquest(15,0,0,8,80,0,0,26,26,5)
call setquest(15,0,0,1,100,0,0,26,26,6)
call setquest(15,0,0,20,0,0,0,29,29,23)
call setquest(18,0,0,4,50,0,0,33,33,30)
/*
call setquest(1,0,0,0,0,0,0,0,1,0)
*/
endfunction
private function init takes nothing  returns nothing
call taskinit()
endfunction
endlibrary




library quest2 initializer init uses sys

private function setquest takes integer a,integer b,integer c,integer d,integer e,integer f,integer g,integer h,integer i,integer j returns nothing
call si("questlevel",sys.quest2,a)
call si("questclass",sys.quest2,b)
call si("questtype",sys.quest2,c)
call si("questdrop",sys.quest2,d)
call si("questnum",sys.quest2,e)
call si("questaward",sys.quest2,f)
call si("questtime",sys.quest2,g)
call si("questgiver",sys.quest2,h)
call si("questanwser",sys.quest2,i)
call si("questtarget",sys.quest2,j)
set sys.quest2=sys.quest2+1
endfunction

private function setqxy takes integer a,integer b returns nothing
call si("qx",sys.quest2,100*a)
call si("qy",sys.quest2,100*b)
endfunction

private function taskinit takes nothing returns nothing
call setqxy(-27,14)
call setquest(4,0,0,80,12,0,0,1,1,5)

call setqxy(-22,27)
call setquest(5,0,0,100,1,1,0,1,1,6)

call setqxy(-40,-34)
call setquest(9,0,0,70,6,0,0,9,9,9)

call setquest(10,0,0,0,0,0,0,9,6,0)

call setqxy(-47,-41)
call setquest(10,0,0,100,1,1,0,6,6,12)

call setquest(12,0,0,0,0,0,0,22,23,0)
call setquest(12,0,0,0,0,0,0,23,22,0)
call setquest(18,0,0,5,60,0,0,31,31,25)
call setquest(19,0,0,28,0,0,0,31,31,28)
call setquest(20,0,0,1,100,0,0,31,31,29)
call setquest(20,0,0,1,100,0,0,33,33,31)

/*
call setquest(1,0,0,0,0,0,0,0,1,0)
*/

endfunction
private function init takes nothing  returns nothing
call taskinit()
endfunction
endlibrary

library quest3 initializer init requires sys

private function setquest takes integer a,integer b,integer c,integer d,integer e,integer f,integer g,integer h,integer i,integer j returns nothing
call si("questlevel",sys.quest3,a)
call si("questclass",sys.quest3,b)
call si("questtype",sys.quest3,c)
call si("questdrop",sys.quest3,d)
call si("questnum",sys.quest3,e)
call si("questaward",sys.quest3,f)
call si("questtime",sys.quest3,g)
call si("questgiver",sys.quest3,h)
call si("questanwser",sys.quest3,i)
call si("questtarget",sys.quest3,j)
set sys.quest3=sys.quest3+1
endfunction

private function setqxy takes integer a,integer b returns nothing
call si("qx",sys.quest3,100*a)
call si("qy",sys.quest3,100*b)
endfunction

private function taskinit takes nothing returns nothing

call setquest(6,0,0,0,0,0,0,11,12,0)

call setquest(6,0,0,0,0,0,0,12,13,0)

call setquest(6,0,0,0,0,0,0,13,8,0)

call setqxy(-40,9)
call setquest(7,0,0,60,4,0,0,8,8,13)

call setquest(7,0,0,0,0,1,0,8,11,0)
call setquest(14,0,0,8,50,0,0,27,27,22)
call setquest(15,0,0,15,60,0,0,28,28,24)
call setquest(18,0,0,10,70,0,0,28,28,32)

/*
call setquest(1,0,0,0,0,0,0,9,10,0)
*/
endfunction
private function init takes nothing  returns nothing
call taskinit()
endfunction
endlibrary

library quest4 initializer init requires sys

private function setquest takes integer a,integer b,integer c,integer d,integer e,integer f,integer g,integer h,integer i,integer j returns nothing
call si("questlevel",sys.quest4,a)
call si("questclass",sys.quest4,b)
call si("questtype",sys.quest4,c)
call si("questdrop",sys.quest4,d)
call si("questnum",sys.quest4,e)
call si("questaward",sys.quest4,f)
call si("questtime",sys.quest4,g)
call si("questgiver",sys.quest4,h)
call si("questanwser",sys.quest4,i)
call si("questtarget",sys.quest4,j)

set sys.quest4=sys.quest4+1
endfunction

private function setqxy takes integer a,integer b returns nothing
call si("qx",sys.quest4,100*a)
call si("qy",sys.quest4,100*b)
endfunction

private function taskinit takes nothing returns nothing

call setquest(6,0,0,0,0,0,0,18,19,0)

call setqxy(0,0)
call setquest(7,0,0,60,4,0,0,19,18,16)

call setquest(7,0,0,0,0,0,0,18,19,0)

call setqxy(26,-59)
call setquest(8,0,0,100,1,1,0,19,18,17)

call setqxy(-25,-61)
call setquest(10,0,0,100,1,1,0,20,20,18)
call setquest(12,0,0,0,0,0,0,36,37,0)
call setquest(13,0,0,0,0,0,0,37,38,0)
call setquest(15,0,0,0,0,0,0,38,39,0)
call setquest(16,0,0,0,0,0,0,39,40,0)
call setquest(18,0,0,1,100,0,0,34,34,7)
call setquest(20,0,0,1,100,0,0,35,35,38)
/*
call setquest(1,0,0,0,0,0,0,10,11,0)
*/
endfunction

private function init takes nothing  returns nothing
call taskinit()
endfunction
endlibrary


library gear initializer init requires sys
function setmisc takes integer a,integer b,integer c returns nothing
    call si("itemorder",b,a)
    call si("itemid",a,b)
    call si("cost",a,c)

endfunction


private function gearinit takes nothing returns nothing

call si("flightpoint",'I007',0)
call si("flightpoint",'I008',1)
call si("flightpoint",'I00A',2)
call si("flightpoint",'I00H',3)

call si("baseitem",0,'I00U')
call si("baseitem",1,'I00V')
call si("baseitem",2,'I00W')
call si("baseitem",3,'I00X')
call si("baseitem",4,'I00Y')
//potion
call setmisc(9000,'I00K',50)
call setmisc(9001,'I00R',200)
call setmisc(9002,'I00L',100)
call setmisc(9003,'I00S',500)
call setmisc(9004,'I00M',200)
call setmisc(9005,'I00T',1000)
call setmisc(9006,'I00N',500)
call setmisc(9007,'I00Z',2000)
call setmisc(9008,'I00O',1000)
call setmisc(9009,'I010',5000)
call setmisc(9010,'I00P',2000)
call setmisc(9011,'I011',10000)
call setmisc(9012,'I00Q',5000)
call setmisc(9013,'I012',20000)
endfunction


private function init takes nothing  returns nothing
call gearinit()
endfunction
endlibrary




library gearstring uses sys

private function setgear takes string a,string b returns nothing
    local integer x=li("itemlevel",sys.itemz)
    local integer y=li("itemclass",sys.itemz)
    local integer j=li("itemtype",sys.itemz)
    local integer k=0
    local integer m=0
    local integer v=0
    call SaveStr(H,StringHash("gearname"),sys.itemz,a)
    call SaveStr(H,StringHash("itemdesc"),sys.itemz,b)

set m=x*5+y+1
if j==3 then
set k=4
else
if j==6 then
set k=2
else
set k=3
endif
endif

set v=li("price",y)*k*m*100
call si("cost",sys.itemz,v)
set sys.itemz=sys.itemz+1
endfunction

function gsinit0 takes nothing returns nothing
call ss("weaponname",2,"staff")
call ss("weaponname",3,"sword")
call ss("weaponname",4,"axe")
call ss("weaponname",5,"hammer")
call ss("partname",1,"head")
call ss("partname",2,"chest")
call ss("partname",4,"legs")
call ss("partname",5,"feet")
call ss("partname",6,"rings")
//5
//white
set sys.itemz=1000
call setgear("Gamemaster's Robe")
call setgear("Frostmane Leather Vest")
call setgear("Barkmail Vest")
call setgear("Dented Buckler")
call setgear("Bent Staff")
call setgear("Tarnished Bastard Sword")
call setgear("Worn Battleaxe")
call setgear("Battleworn Hammer")
call setgear("Webbed Pants")
call setgear("")
call setgear("")
call setgear("")
call setgear("")
call setgear("")
call setgear("")
call setgear("")
call setgear("")




//green
set sys.itemz=1050
call setgear("Light Magesmith Robe")
call setgear("Cracked Leather Vest")
call setgear("Frostmane Chain Vest")
call setgear("Small Shield")
call setgear("Handcrafted Staff")
call setgear("Bastard Sword")
call setgear("Broad Axe")
call setgear("Large Club")
call setgear("Dwarven Cloth Britches")
call setgear("")
call setgear("")
call setgear("")
call setgear("")
call setgear("")
call setgear("")
call setgear("")

//10
//white
set sys.itemz=1100
call setgear("Scarlet Initiate Robes")
call setgear("Dirty Leather Vest")
call setgear("Jagged Chain Vest")
call setgear("Deathguard Buckler")
call setgear("Crooked Staff")
call setgear("Forsaken Bastard Sword")
call setgear("Brave's Axe")
call setgear("Anvilmar Sledge")
call setgear("Ripped Pants")
call setgear("")
call setgear("")
call setgear("")
call setgear("")
call setgear("")
call setgear("")
call setgear("")
//green
set sys.itemz=1150
call setgear("Flax Vest")
call setgear("Layered Tunic")
call setgear("Rugged Mail Vest")
call setgear("Dented Buckler")
call setgear("Short Staff")
call setgear("Practice Sword")
call setgear("Thistlewood Axe")
call setgear("Militia Warhammer")
call setgear("Sedgeweed Britches")
call setgear("")
call setgear("")
call setgear("")
call setgear("")
call setgear("")
call setgear("")
call setgear("")



//15
//white
call setgear("Soft Wool Vest")
call setgear("Nomadic Vest")
call setgear("Rusted Chain Vest")
call setgear("Dwarven Kite Shield")
call setgear("Elder's Cane")
call setgear("Two-handed Sword")
call setgear("Large Axe")
call setgear("Kobold Mining Shovel")
call setgear("Tapered Pants")
call setgear("")
call setgear("")
call setgear("")
call setgear("")
call setgear("")
call setgear("")
call setgear("")
//green
set sys.itemz=1250
call setgear("Tattered Cloth Vest")
call setgear("Scavenger Tunic")
call setgear("Tarnished Chain Vest")
call setgear("Large Round Shield")
call setgear("Executor Staff")
call setgear("Copper Claymore")
call setgear("Wood Chopper")
call setgear("Farmer's Shovel")
call setgear("Tattered Cloth Pants")
call setgear("")
call setgear("")
call setgear("")
call setgear("")
call setgear("")
call setgear("")
call setgear("")






//20
//white
set sys.itemz=1300
call setgear("Crown of the Fire Festival")
call setgear("Studded Hat")
call setgear("Augmented Chain Helm")
call setgear("Thin Cloth Armor")
call setgear("Woodland Tunic")
call setgear("Mountaineer Chestpiece")
call setgear("Large Wooden Shield")
call setgear("Militia Quarterstaff")
call setgear("Claymore")
call setgear("Double-bladed Axe")
call setgear("Beatstick")
call setgear("Thin Cloth Pants")
call setgear("")
call setgear("")
call setgear("")
call setgear("")
call setgear("")
call setgear("")
call setgear("")
call setgear("")
call setgear("")
call setgear("")
call setgear("")
call setgear("")
call setgear("")
call setgear("")
call setgear("")
call setgear("")
call setgear("")
call setgear("")
call setgear("")
call setgear("")
//green
set sys.itemz=1350
call setgear("Gamemaster Hood")
call setgear("Reinforced Leather Cap")
call setgear("Brigandine Helm")
call setgear("Woodland Robes")
call setgear("Handstitched Leather Vest")
call setgear("Rough Copper Vest")
call setgear("Pikeman Shield")
call setgear("Primitive Walking Stick")
call setgear("Espadon")
call setgear("Vile Fin Battle Axe")
call setgear("Wooden Mallet")
call setgear("Simple Linen Pants")
call setgear("")
call setgear("")
call setgear("")
call setgear("")
call setgear("")
call setgear("")
call setgear("")
call setgear("")
call setgear("")
call setgear("")
call setgear("")
call setgear("")
call setgear("")
call setgear("")
call setgear("")
call setgear("")
call setgear("")
call setgear("")
call setgear("")
call setgear("")
//blue
set sys.itemz=1400
call setgear("Lucky Fishing Hat")
call setgear("Humbert's Helm")
call setgear("Brutal Helm")
call setgear("Brown Linen Vest")
call setgear("Light Scorpid Armor")
call setgear("Light Chain Armor")
call setgear("Thick Bark Buckler")
call setgear("Smooth Walking Staff")
call setgear("Bronze Greatsword")
call setgear("Tabar")
call setgear("Thicket Hammer")
call setgear("Solliden's Trousers")
call setgear("")
call setgear("")
call setgear("")
call setgear("")
call setgear("")
call setgear("")
call setgear("")
call setgear("")
call setgear("")
call setgear("")
call setgear("")
call setgear("")
call setgear("")
call setgear("")
call setgear("")
call setgear("")
call setgear("")
call setgear("")
call setgear("")
call setgear("")



endfunction
function gsinit6 takes nothing returns nothing
endfunction


function gsinit takes nothing  returns nothing
if sys.lang==0 then
call gsinit0()
endif
if sys.lang==0 then
call gsinit6()
endif
endfunction
endlibrary





library tip needs sys

function settip takes integer a,string b returns nothing
call SaveStr(H,StringHash("tip"),a,b)
endfunction

function tip0 takes nothing returns nothing
call settip(0,"|c0000ff00按小键盘下键可以下马|r")
call settip(1,"|c0000ff00商人出售各种药水和装备|r")
call settip(2,"|c0000ff00点击装备技能可以在药水栏和装备栏之间切换|r")
call settip(3,"|c0000ff00点击仓库技能可以在5个仓库栏位之间切换|r")
call settip(4,"|c0000ff00使用常用技能(H)里的探索技能(Q)来完成采集或者探索任务|r")
call settip(5,"|c0000ff00普通怪物(白名)和稀有(黄名)5%掉落白装,0.5%掉落绿装,0.05%掉落蓝装(怪物需大于15级),0.005%掉落紫装(怪物需大于40级)|r")
call settip(6,"|c0000ff00副本金英(绿名)5%掉落绿装,0.5%掉落蓝装|r")
call settip(7,"|c0000ff00副本BOSS(蓝名)80%掉落蓝装,20%掉落绿装|r")
call settip(8,"|c0000ff00猎人抓捕怪物成功几率:普通80%,稀有50%,金英5%,BOSS1%|r")
call settip(9,"|c0000ff00怪物刷新时间:普通40s,稀有60s,金英600s,BOSS1200s|r")
call settip(10,"|c0000ff00绿名技能为小技能，蓝名技能为大技能|r")
call settip(11,"|c0000ff00副本BOSS和金英掉落固定部位|r")
call settip(12,"|c0000ff00请在退出游戏前手动存档，点击常用技能里的保存存档技能即可|r")
call settip(13,"|c0000ff00本地图系列分为分为多个地图区域,你需要完成上个地图的全部任务才能进入下一章地图进行游戏，存档互通|r")
call settip(14,"|c0000ff00若你喜欢本地图,请打赏作者:paypal:cancerelflol@gmail.com|r")

endfunction

function tip6 takes nothing returns nothing
endfunction

function tipinit takes nothing  returns nothing
if sys.lang==0 then
call tip0()
endif
if sys.lang==6 then
call tip6()
endif
endfunction
endlibrary