local a={}local b=require("filesystem")local c=require("computer")local d=require("component")local e=require("ECSAPI")local f=require("term")local g=d.gpu;a.languagePackages={en={settings="Settings",shutdown="Shutdown",reboot="Reboot",language="Language",selLanguage="Select language",monitorOnline="Monitor",enterNickname="Enter nickname:",logout="Logout",shutdownI="Shutting down",newFolder="New folder",newFile="New file",updateFileList="Update files",fileManager="File Manager",power="Sleep"},ru={settings="Настройки",shutdown="Выключить",reboot="Перезагрузить",language="Язык",selLanguage="Выберите язык",monitorOnline="Монитор",enterNickname="Введите никнейм игрока:",logout="Завершение сеанса",shutdownI="Завершение работы",newFolder="Новая папка",newFile="Новый файл",updateFileList="Обновить",fileManager="Файлы",power="Сон"}}a.language="en"function a.getLanguage()local h,i=io.open("/.tabletos","r")if h then a.language=h:read(b.size("/.tabletos")+1)h:close()return a.language else local h=io.open("/.tabletos","w")h:write("en")h:close()return"en"end end;function a.saveLanguage()b.remove("/.tabletos")local h=io.open("/.tabletos","w")h:write(a.language)h:close()end;function a.changeLanguage(j)if j then c.pushSignal("changeLanguage",a.language,j)a.language=j;a.saveLanguage()end end;function a.getLanguagePackages()return a.languagePackages[a.getLanguage()]end;function a.internetRequest(k)local l,m=pcall(d.internet.request,k)if l then local n=""while true do local o,p=m.read()if o then n=n..o else if p then return false,p else return true,n end end end else return false,reason end end;function a.getFile(k,q)local l,reason=a.internetRequest(k)if l then b.makeDirectory(b.path(q)or"")b.remove(q)local r=io.open(q,"w")if r then r:write(reason)r:close()end;return true,reason else return false,reason end end;function a.downloadFileListAndDownloadFiles(s,t)if t then print("Downloading file list")end;local l,u=a.internetRequest(s)if l then local v=load("return "..u)local l,w=pcall(v)if l then for x=1,#w do a.getFile(w[x].url,w[x].path)if t then print("Downloading "..w[x].path)end end else error(w)end else error(u)end end;function a.saveDisplayAndCallFunction(...)local y,z=d.gpu.getResolution()local A=e.rememberOldPixels(1,1,y,z)local B={pcall(...)}e.drawOldPixels(A)return table.unpack(B)end;return a
