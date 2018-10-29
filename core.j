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



