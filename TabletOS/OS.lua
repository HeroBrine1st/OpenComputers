local a=require("computer")local b=require("component")local c=b.gpu;local d=require("event")local e=require("ECSAPI")local f=require("term")local g=require("unicode")local h=require("filesystem")local i=require("TabletOSCore")local j=require("gui")_G.Math=math;local k={}local l=require("shell")local m={}f.clear()local n,o=c.getResolution()local function p()c.setBackground(0x610B5E)c.fill(1,25,80,1," ")c.set(40,25,"●")c.set(35,25,"◀")c.set(45,25,"▶")c.setBackground(0xFFFF00)c.setForeground(0x610B5E)c.set(1,25,"M")c.setBackground(0x000000)c.setForeground(0xFFFFFF)end;function executeTouch(q,r,s)for t=1,#s do if e.clickedAtArea(s.x1,s.y1,s.x2,s.y2,q,r)then local u,v=xpcall(s.callback,debug.traceback)return u,v end end end;local function w(x,y,z,A,q,r)if q>=x and q<=z and r>=y and r<=A then return true end;return false end;local B={}function drawMenu()local C={{y=20,name=i.getLanguagePackages().fileManager,callback=function()e.drawOldPixels(m)dofile("/apps/fileManager.lua")drawWorkTable()end},{y=21,name=i.getLanguagePackages().monitorOnline,callback=function()dofile("/apps/monitorOnline.lua")c.setBackground(0x610B5E)c.setForeground(0xFFFFFF)c.fill(1,1,70,1," ")c.setBackground(0x000000)c.fill(1,2,80,23," ")end},{y=22,name=i.getLanguagePackages().settings,callback=function()k.settings()c.setBackground(0x610B5E)c.setForeground(0xFFFFFF)c.fill(1,1,70,1," ")c.setBackground(0x000000)c.fill(1,2,80,23," ")end},{y=23,name=i.getLanguagePackages().reboot,callback=function()a.shutdown(true)end},{y=24,name=i.getLanguagePackages().shutdown,callback=function()a.shutdown()end}}local function D(y)for t=1,#C do if y==C[t].y then return true,C[t].callback end end;return false,function()return false end end;B=e.rememberOldPixels(1,10,15,24)local E=c.setBackground(0xFFFFFF)local F=c.setForeground(0x000000)c.fill(1,10,15,15," ")for t=1,#C do c.set(1,C[t].y,C[t].name)end;c.setForeground(F)c.setBackground(E)while true do local G={d.pull("touch")}if w(1,10,15,24,G[3],G[4])then local H,I=D(G[4])if H then e.drawOldPixels(m)local J=e.rememberOldPixels(1,1,80,25)I()e.drawOldPixels(J)drawWorkTable()break end else c.setForeground(0xFFFFFF)c.setBackground(0x000000)c.fill(1,10,10,15," ")e.drawOldPixels(B)B={}a.pushSignal(table.unpack(G))break end end end;local function K(L)local a=require("computer")local b=require("component")local c=b.gpu;local function centerText(y,M)local x=Math.floor(n/2-g.len(M)/2)c.set(x,y,M)end;c.setBackground(0x0000FF)c.fill(1,1,n,o," ")centerText(o/2,i.getLanguagePackages().logout)k=nil;_G=nil;io=nil;os=nil;package=nil;c.fill(1,1,80,25," ")centerText(o/2,i.getLanguagePackages().shutdownI)os.sleep(0.4)a.shutdown(L)end;function k.settings()c.setBackground(0x610B5E)c.setForeground(0xFFFFFF)c.set(1,1,i.getLanguagePackages().settings)c.setBackground(0xCCCCCC)c.fill(1,2,80,23," ")c.setForeground(0xFFFFFF)c.set(1,2,i.getLanguagePackages().language)local N={}local O=false;local function P()N=e.rememberOldPixels(1,2,80,24)c.setBackground(0xCCCCCC)c.setForeground(0xFFFFFF)c.fill(1,2,80,23," ")centerText(2,i.getLanguagePackages().selLanguage)centerText(3,"English")centerText(4,"Русский")while true do local G={d.pull("touch")}if G[4]==3 then i.changeLanguage("en")c.setBackground(0x610B5E)c.setForeground(0xFFFFFF)c.fill(1,1,70,1," ")c.set(1,1,i.getLanguagePackages().settings)c.setBackground(0xCCCCCC)c.fill(1,2,80,23," ")c.setForeground(0xFFFFFF)c.set(1,2,i.getLanguagePackages().language)break elseif G[4]==4 then i.changeLanguage("ru")c.setBackground(0x610B5E)c.setForeground(0xFFFFFF)c.fill(1,1,70,1," ")c.set(1,1,i.getLanguagePackages().settings)c.setBackground(0xCCCCCC)c.fill(1,2,80,23," ")c.setForeground(0xFFFFFF)c.set(1,2,i.getLanguagePackages().language)e.drawOldPixels(N)break elseif G[3]==1 and G[4]==25 then drawMenu()startClickListenerM()elseif G[3]==40 and G[4]==25 then O=true;c.setBackground(0x610B5E)c.setForeground(0xFFFFFF)c.fill(1,1,70,1," ")c.set(1,1,i.getLanguagePackages().settings)c.setBackground(0xCCCCCC)c.fill(1,2,80,23," ")c.setForeground(0xFFFFFF)c.set(1,2,i.getLanguagePackages().language)e.drawOldPixels(N)break elseif G[3]==35 and G[4]==25 then c.setBackground(0x610B5E)c.setForeground(0xFFFFFF)c.fill(1,1,70,1," ")c.set(1,1,i.getLanguagePackages().settings)c.setBackground(0xCCCCCC)c.fill(1,2,80,23," ")c.setForeground(0xFFFFFF)c.set(1,2,i.getLanguagePackages().language)e.drawOldPixels(N)break end end end;while true do local G={d.pull("touch")}if G[3]==1 and G[4]==25 then drawMenu()startClickListenerM()elseif G[4]==2 then P()i.language=i.getLanguage()elseif G[3]==40 and G[4]==25 then break elseif G[3]==35 and G[4]==25 then break end;if O==true then break end;c.setBackground(0x610B5E)c.setForeground(0xFFFFFF)c.fill(1,1,77,1," ")local Q=i.getLanguagePackages().power;local R=g.len(Q)c.setBackground(0xFFFF00)c.setForeground(0x610B5E)c.set(76-R,1,Q)c.setBackground(0x000000)c.setForeground(0xFFFFFF)end end;_G.oldEnergy=100;_G.timerID=100;function statusBar()local b=require("component")local c=b.gpu;local S=Math.floor(a.energy()/a.maxEnergy()*100)local T=string.gsub(string.format("%q",math.floor(a.energy()/a.maxEnergy()*100)),"\"","")local R=Math.floor(g.len(T)/2)local U=c.setBackground(0x610B5E)local V=c.setForeground(0xFFFFFF)c.set(79-R,1,T)c.set(80,1,"%")c.setBackground(U)c.setForeground(V)if S<6 then require("term").clear()print("Not enough energy! Shutdown tablet... ")require("computer").shutdown()end;if not S==oldEnergy then a.pushSignal("energyChange",oldEnergy,S)end;oldEnergy=S end;local function W()c.setBackground(0x610B5E)c.setForeground(0xFFFFFF)c.fill(1,1,80,1," ")local Q=i.getLanguagePackages().power;local R=g.len(Q)c.setBackground(0xFFFF00)c.setForeground(0x610B5E)c.set(76-R,1,Q)c.setBackground(0x000000)c.setForeground(0xFFFFFF)_G.timerID=d.timer(1,statusBar,math.huge)timerID=_G.timerID end;workTable={}function drawWorkTable()workTable={}j.setColors(0x000000,0xFFFFFF)c.fill(1,2,80,23," ")local function X()local Y="/usr/table/"h.makeDirectory(Y)local Z={}for _ in h.list(Y)do if h.exists(Y.._)and not h.isDirectory(Y.._)then table.insert(Z,Y.._)end end;return Z end;local Z=X()for t=1,#Z do local a0=math.ceil(t/4)+1;local n=20;local o=1;local a1=(t-1)*n+1-(a0-2)*n*8-1;local a2=a0;local a3=function()l.execute(Z[t])end;local a4=math.floor(math.random()*0xFFFFFF)local a5=0xFFFFFF-a4;j.drawButton(a1+1,a2,n,o,h.name(Z[t]),a4,a5)local a6={x=a1,y=a2,w=n,h=o,callback=a3}table.insert(workTable,a6)end end;W()p()drawWorkTable()listener=function(...)local G={...}if G[3]==1 and G[4]==25 then m=e.rememberOldPixels(1,2,80,24)drawMenu()e.drawOldPixels(m)elseif G[3]==45 and G[4]==25 then d.cancel(timerID)d.ignore("touch",listener)f.clear()while true do local a7,v=xpcall(loadfile("/apps/shell.lua"),function(a8)return tostring(a8).."\n"..debug.traceback()end)if not a7 then io.stderr:write((v~=nil and tostring(v)or"unknown error").."\n")io.write("Press any key to continue.\n")os.sleep(0.5)require("event").pull("key")end end end;local Q=i.getLanguagePackages().power;local R=g.len(Q)if w(76-R,1,76,1,G[3],G[4])then local a9=e.rememberOldPixels(1,1,80,25)e.clearScreen(0x000000)e.waitForTouchOrClick()e.drawOldPixels(a9)end end;_G.listener=listener;_G.eventListener=d.listen("touch",listener)while true do local G={d.pull("touch")}for t=1,#workTable do local aa=workTable[t]if w(aa.x,aa.y,aa.x+aa.w-1,aa.y+aa.h-1,G[3],G[4])then d.cancel(_G.timerID)d.ignore("touch",_G.listener)local u,v=i.saveDisplayAndCallFunction(aa.callback)_G.timerID=d.timer(1,statusBar,math.huge)eventListener=d.listen("touch",listener)if not u and v then i.saveDisplayAndCallFunction(e.error,v)end end end end
