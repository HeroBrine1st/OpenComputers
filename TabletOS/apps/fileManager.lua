local a=require("filesystem")local b=require("component")local c=b.gpu;local d=require("ECSAPI")local e=require("term")local f=require("unicode")local g=require("zygote")local h=math;local i=require("shell")local j={}local k,l=c.getResolution()local m=require("TabletOSCore")local n=d.rememberOldPixels(1,1,80,25)c.setBackground(0x610B5E)c.setForeground(0xFFFFFF)c.set(1,1,m.getLanguagePackages().fileManager)b=nil;local o=g.addForm()o.left=1;o.top=2;o.W=80;o.H=23;o.color=0xCCCCCC;local function p()o:setActive()end;local function q(r)g.stop(o)d.drawOldPixels(n)end;local s="/"local t;local u=o:addList(1,2,function(r)local v=r.items[r.index]if a.isDirectory(v)then oldPath=s;s=v;r:clear()r:insert("/","/")r:insert("..",oldPath)for w in a.list(s)do r:insert(w,s..w)end elseif a.exists(v)then t=d.rememberOldPixels(1,1,80,25)local x=g.addForm()x.left=30;x.top=12-2;x.W=20;x.H=5;windowButton1=x:addButton(1,1,"Edit",function()i.execute("edit "..v)d.drawOldPixels(t)p()end)windowButton2=x:addButton(1,2,"Execute",function()e.clear()local y,z=i.execute(v)if not y then d.error(z)end;d.drawOldPixels(t)p()end)windowButton3=x:addButton(1,3,"Remove",function()i.execute("rm "..v)d.drawOldPixels(t)p()end)local function A()g.stop(x)end;windowButton4=x:addButton(1,4,"To workTable",function()a.remove("/usr/table/"..a.name(v))local B=io.open("/usr/table/"..a.name(v),"w")local C=""if not a.path(v):gsub("/","")=="apps"and not a.name(v):gsub("/","")=="shell.lua"and not a.name(v):gsub("/","")=="monitorOnline.lua"then C=C.."require(\"term\").clear()\n"end;C=C.."dofile(\""..v.."\")"B:write(C)B:close()d.drawOldPixels(t)p()end)windowButton5=x:addButton(1,5,"Exit",function()d.drawOldPixels(t)p()end)windowButton1.W=20;windowButton2.W=20;windowButton3.W=20;windowButton4.W=20;windowButton5.W=20;g.run(x)p()end end)u.W=80;u.H=22;u.color=0xCCCCCC;u.fontColor=0xFFFFFF-0xCCCCCC;u.border=0;local function D()local E=u;u:clear()u:insert("/","/")u:insert("..",E.items[2])for w in a.list(s)do u:insert(w,s..w)end;E=nil end;local F=o:addButton(1,1,m.getLanguagePackages().newFolder,function()t=d.rememberOldPixels(1,1,80,25)local x=g.addForm()x.left=30;x.top=25/2-2;x.W=20;x.H=4;local G=x:addEdit(1,1,function(r)local v=r.text;if v then local F=s..v;a.makeDirectory(F)d.drawOldPixels(t)p()D()end end)g.run(x)end)F.W=20;local H=o:addButton(21,1,m.getLanguagePackages().newFile,function()t=d.rememberOldPixels(1,1,80,25)local x=g.addForm()x.left=30;x.top=25/2-2;x.W=20;x.H=4;local G=x:addEdit(1,1,function(r)local v=r.text;if v then local H=s..v;local I=io.open(H,"w")if I then I:write("")I:close()end;d.drawOldPixels(t)p()D()end end)g.run(x)end)H.W=20;local J=o:addButton(41,1,m.getLanguagePackages().updateFileList,D)J.W=20;D()local j;local function K(L,L,M,N,O,L)if O==0 and(M==40 or M==35)and N==25 then local y,z=pcall(q)if not y then if z then d.error("Unable to exit program:"..z)end end end end;local P=o:addEvent("touch",K)g.run(o)
