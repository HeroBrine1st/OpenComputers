local a=require("component")local b=a.gpu;local c=require("term")local d=require("shell")local e=require("ECSAPI")local f=require("event")b.setResolution(b.maxResolution())b.setBackground(0x000000)c.clear()local g,h=b.getResolution()local function i()local j=b.setBackground(0xFFFFFF)local k=b.setForeground(0xFFFFFF-0xCCCCCC)if g==160 then b.fill(1,1,g,5," ")local l="Material terminal"b.set(g/2-math.floor(string.len(l)/2),3,l)else b.fill(1,1,g,3," ")local l="Material terminal"b.set(g/2-math.floor(string.len(l)/2),2,l)end;b.setBackground(0xCCCCCC)b.setForeground(0xFFFFFF-0xCCCCCC)b.fill(1,1,g,1," ")b.set(1,1,"Working directory: "..require("shell").getWorkingDirectory())b.setBackground(j)b.setForeground(k)end;local function m()local n=e.rememberOldPixels(1,g==160 and h-5 or h-3,g,h)local j=b.setBackground(0xFFFFFF)local k=b.setForeground(0xFFFFFF-0xCCCCCC)b.fill(1,g==160 and h-4 or h-2,g,g==160 and 5 or 3," ")b.set(1,h,"Made by HeroBrine1")local function o()b.set(1,g==160 and h-2 or h-1,">")return e.inputText(2,g==160 and h-2 or h-1,g-1)end;while true do result=o()if result~=nil and result~=""then e.drawOldPixels(n)b.setBackground(j)b.setForeground(k)return result end end end;local function p(q)local r,s=d.execute(q)if not r and not s=="file not found"and not s=="interrupted"then s=debug.traceback(s)end;return r,s end;i()while true do i()local t,u=c.getCursor()if u<6 then c.setCursor(1,6)end;local v=d.getWorkingDirectory()local result=m()b.setBackground(0x000000)b.setForeground(0xFFFFFF)c.clear()i()c.setCursor(1,g==160 and 6 or 4)local r,s=p(result)if not r then e.error(s)end end
