local a={}local b=1;local c=0;local d,e;local function f()if e.restrictActions then extensions.core_input_actionFilter.setGroup('uj_base',e.disabledActions)extensions.core_input_actionFilter.addAction(0,'uj_base',true)log("I",d.name,"disabled "..#e.disabledActions.." actions")end end;local function g()guihooks.trigger('ScenarioChange',{name=e.motd.title,description=e.motd.description,introType=e.motd.type})end;local function h(i,j)local k=core_environment.getTimeOfDay()k.time=math.abs(i+j/60-12)/12*0.5;core_environment.setTimeOfDay(k)print(k.time)end;local function l()if e.setTime then local m=os.date("!*t",os.time()+e.timeOffsetHours*60*60)h(m.hour,m.min)end end;local function n(j)if e.syncTime then local m=os.date("!*t",os.time()+(e.timeOffsetHours*60+j)*60)h(m.hour,m.min)end end;local function o()d=jsonReadFile("settings/resource.json")e=require("settings/config")guihooks.trigger("ChangeState",{state="scenario-start"})if e.restrictMenu then extensions.core_gamestate.setGameState("scenario","freeroam","uj_base")end;f()l()log("I",d.name,"version "..d.version.." loaded")end;local function p()extensions.core_input_actionFilter.addAction(0,'uj_base',false)extensions.core_gamestate.setGameState("freeroam","freeroam","freeroam")log("I",d.name,"version "..d.version.." unloaded, goodbye!")end;local function q(r,s,t)c=c+r;if c>=b then n(c/60)end end;local function u(v)g()end;local function w(x)if e.motd.type=="selectableVehicle"then g()if x.model and x.config then local y=createPlayerSpawningData(x.model,x.config,x.color,x.licenseText)local z=be:getPlayerVehicle(0)if z then core_vehicles.replaceVehicle(y.model,y.options)else core_vehicles.spawnNewVehicle(y.model,y.options)end;freezeAll(1)end end end;a.onExtensionLoaded=o;a.onExtensionUnloaded=p;a.onUpdate=q;a.onScenarioUIReady=u;a.onVehicleSelected=w;return a