local a=require("computer")local b=require("component")local c=b.gpu;local d=require("event")local e=require("ECSAPI")local f=require("term")local g=require("unicode")local h=require("filesystem")local i=require("TabletOSCore")local j=require("gui")_G.Math=math;local k={}local l=require("shell")local m={}f.clear()local n,o=c.getResolution()local function p()c.setBackground(0x610B5E)c.fill(1,25,80,1," ")c.set(40,25,"●")c.set(35,25,"◀")c.set(45,25,"▶")c.setBackground(0xFFFF00)c.setForeground(0x610B5E)c.set(1,25,"M")c.setBackground(0x000000)c.setForeground(0xFFFFFF)end;local function q(r,s,t,u,v,w)if v>=r and v<=t and w>=s and w<=u then return true end;return false end;local x={}function drawMenu()local y={{y=20,name=i.getLanguagePackages().fileManager,callback=function()e.drawOldPixels(m)dofile("/apps/fileManager.lua")drawWorkTable()end},{y=21,name=i.getLanguagePackages().monitorOnline,callback=function()dofile("/apps/monitorOnline.lua")c.setBackground(0x610B5E)c.setForeground(0xFFFFFF)c.fill(1,1,70,1," ")c.setBackground(0x000000)c.fill(1,2,80,23," ")drawWorkTable()end},{y=22,name=i.getLanguagePackages().settings,callback=function()k.settings()c.setBackground(0x610B5E)c.setForeground(0xFFFFFF)c.fill(1,1,70,1," ")c.setBackground(0x000000)c.fill(1,2,80,23," ")drawWorkTable()end},{y=23,name=i.getLanguagePackages().reboot,callback=function()a.shutdown(true)end},{y=24,name=i.getLanguagePackages().shutdown,callback=function()a.shutdown()end}}local function z(s)for A=1,#y do if s==y[A].y then return true,y[A].callback end end;return false,function()return false end end;x=e.rememberOldPixels(1,10,15,24)local B=c.setBackground(0xFFFFFF)local C=c.setForeground(0x000000)c.fill(1,10,15,15," ")for A=1,#y do c.set(1,y[A].y,y[A].name)end;c.setForeground(C)c.setBackground(B)while true do local D={d.pull("touch")}if q(1,10,15,24,D[3],D[4])then local E,F=z(D[4])if E then e.drawOldPixels(m)local G=e.rememberOldPixels(1,1,80,25)F()e.drawOldPixels(G)drawWorkTable()break end else c.setForeground(0xFFFFFF)c.setBackground(0x000000)c.fill(1,10,10,15," ")e.drawOldPixels(x)x={}a.pushSignal(table.unpack(D))break end end end;local function H(I)local a=require("computer")local b=require("component")local c=b.gpu;local function centerText(s,J)local r=Math.floor(n/2-g.len(J)/2)c.set(r,s,J)end;c.setBackground(0x0000FF)c.fill(1,1,n,o," ")centerText(o/2,i.getLanguagePackages().logout)k=nil;_G=nil;io=nil;os=nil;package=nil;c.fill(1,1,80,25," ")centerText(o/2,i.getLanguagePackages().shutdownI)os.sleep(0.4)a.shutdown(I)end;function k.settings()c.setBackground(0x610B5E)c.setForeground(0xFFFFFF)c.set(1,1,i.getLanguagePackages().settings)c.setBackground(0xCCCCCC)c.fill(1,2,80,23," ")c.setForeground(0xFFFFFF)c.set(1,2,i.getLanguagePackages().language)local K={}local L=false;local function M()K=e.rememberOldPixels(1,2,80,24)c.setBackground(0xCCCCCC)c.setForeground(0xFFFFFF)c.fill(1,2,80,23," ")centerText(2,i.getLanguagePackages().selLanguage)centerText(3,"English")centerText(4,"Русский")while true do local D={d.pull("touch")}if D[4]==3 then i.changeLanguage("en")c.setBackground(0x610B5E)c.setForeground(0xFFFFFF)c.fill(1,1,70,1," ")c.set(1,1,i.getLanguagePackages().settings)c.setBackground(0xCCCCCC)c.fill(1,2,80,23," ")c.setForeground(0xFFFFFF)c.set(1,2,i.getLanguagePackages().language)break elseif D[4]==4 then i.changeLanguage("ru")c.setBackground(0x610B5E)c.setForeground(0xFFFFFF)c.fill(1,1,70,1," ")c.set(1,1,i.getLanguagePackages().settings)c.setBackground(0xCCCCCC)c.fill(1,2,80,23," ")c.setForeground(0xFFFFFF)c.set(1,2,i.getLanguagePackages().language)e.drawOldPixels(K)break elseif D[3]==1 and D[4]==25 then drawMenu()startClickListenerM()elseif D[3]==40 and D[4]==25 then L=true;c.setBackground(0x610B5E)c.setForeground(0xFFFFFF)c.fill(1,1,70,1," ")c.set(1,1,i.getLanguagePackages().settings)c.setBackground(0xCCCCCC)c.fill(1,2,80,23," ")c.setForeground(0xFFFFFF)c.set(1,2,i.getLanguagePackages().language)e.drawOldPixels(K)break elseif D[3]==35 and D[4]==25 then c.setBackground(0x610B5E)c.setForeground(0xFFFFFF)c.fill(1,1,70,1," ")c.set(1,1,i.getLanguagePackages().settings)c.setBackground(0xCCCCCC)c.fill(1,2,80,23," ")c.setForeground(0xFFFFFF)c.set(1,2,i.getLanguagePackages().language)e.drawOldPixels(K)break end end end;while true do local D={d.pull("touch")}if D[3]==1 and D[4]==25 then drawMenu()startClickListenerM()elseif D[4]==2 then M()i.language=i.getLanguage()elseif D[3]==40 and D[4]==25 then break elseif D[3]==35 and D[4]==25 then break end;if L==true then break end;c.setBackground(0x610B5E)c.setForeground(0xFFFFFF)c.fill(1,1,77,1," ")local N=i.getLanguagePackages().power;local O=g.len(N)c.setBackground(0xFFFF00)c.setForeground(0x610B5E)c.set(76-O,1,N)c.setBackground(0x000000)c.setForeground(0xFFFFFF)end end;_G.oldEnergy=100;_G.timerID=100;function statusBar()local b=require("component")local c=b.gpu;local P=Math.floor(a.energy()/a.maxEnergy()*100)local Q=string.gsub(string.format("%q",math.floor(a.energy()/a.maxEnergy()*100)),"\"","")local O=Math.floor(g.len(Q)/2)local R=c.setBackground(0x610B5E)local S=c.setForeground(0xFFFFFF)c.set(79-O,1,Q)c.set(80,1,"%")c.setBackground(R)c.setForeground(S)if P<6 then require("term").clear()print("Not enough energy! Shutdown tablet... ")require("computer").shutdown()end;if not P==oldEnergy then a.pushSignal("energyChange",oldEnergy,P)end;oldEnergy=P end;local function T()c.setBackground(0x610B5E)c.setForeground(0xFFFFFF)c.fill(1,1,80,1," ")local N=i.getLanguagePackages().power;local O=g.len(N)c.setBackground(0xFFFF00)c.setForeground(0x610B5E)c.set(76-O,1,N)c.setBackground(0x000000)c.setForeground(0xFFFFFF)_G.timerID=d.timer(1,statusBar,math.huge)timerID=_G.timerID end;workTable={}function drawWorkTable()workTable={}j.setColors(0x000000,0xFFFFFF)c.fill(1,2,80,23," ")local function U()local V="/usr/table/"h.makeDirectory(V)local W={}for X in h.list(V)do if h.exists(V..X)and not h.isDirectory(V..X)then table.insert(W,V..X)end end;return W end;local W=U()for A=1,#W do local Y=math.ceil(A/4)+1;local n=20;local o=1;local Z=(A-1)*n+1-(Y-2)*n*4-1;local _=Y;local a0=function()l.execute(W[A])end;local a1=math.floor(math.random()*0xFFFFFF)local a2=0xFFFFFF-a1;j.drawButton(Z+1,_,n,o,h.name(W[A]),a1,a2)local a3={x=Z,y=_,w=n,h=o,callback=a0}table.insert(workTable,a3)end end;T()p()drawWorkTable()listener=function(...)local D={...}if D[3]==1 and D[4]==25 then m=e.rememberOldPixels(1,2,80,24)drawMenu()e.drawOldPixels(m)elseif D[3]==45 and D[4]==25 then d.cancel(timerID)d.ignore("touch",listener)f.clear()while true do local a4,a5=xpcall(loadfile("/apps/shell.lua"),function(a6)return tostring(a6).."\n"..debug.traceback()end)if not a4 then io.stderr:write((a5~=nil and tostring(a5)or"unknown error").."\n")io.write("Press any key to continue.\n")os.sleep(0.5)require("event").pull("key")end end end;local N=i.getLanguagePackages().power;local O=g.len(N)if q(76-O,1,76,1,D[3],D[4])then local a7=e.rememberOldPixels(1,1,80,25)e.clearScreen(0x000000)e.waitForTouchOrClick()e.drawOldPixels(a7)end end;_G.listener=listener;_G.eventListener=d.listen("touch",listener)while true do local D={d.pull("touch")}for A=1,#workTable do local a8=workTable[A]if q(a8.x,a8.y,a8.x+a8.w-1,a8.y+a8.h-1,D[3],D[4])then d.cancel(_G.timerID)d.ignore("touch",_G.listener)local a9,a5=i.saveDisplayAndCallFunction(a8.callback)drawWorkTable()_G.timerID=d.timer(1,statusBar,math.huge)eventListener=d.listen("touch",listener)if not a9 and a5 then i.saveDisplayAndCallFunction(e.error,a5)end end end end
