local component = require("component")
local gpu = component.gpu
local unicode = require("unicode")
local gui = {}

function gui.centerText(x,y,text)
local x1 = x - math.floor(unicode.len(text)/2)
gpu.set(x1,y,text)
end

function gui.setColors(background,foreground)
return gpu.setBackground(background),gpu.setForeground(foreground)
end

function gui.drawProgressBar(x,y,w,colorEmpty,colorFilled,progress,maxProgress)
colorEmpty = colorEmpty or 0x000000
colorFilled = colorFilled or 0xFFFFFF
progress = progress or 0
maxProgress = maxProgress or 100
local h = 1
local coff = w/maxProgress
local celoe, drobnoe = math.modf(coff*progress)
local progressVCordax
if drobnoe > 0.5 then progressVCordax = celoe+1 else progressVCordax = celoe end
local oldBackground = gpu.setBackground(colorEmpty)
gpu.fill(x,y,w,1," ")
gpu.setBackground(colorFilled)
gpu.fill(x,y,progressVCordax,1," ")
gpu.setBackground(oldBackground)
end

function gui.animatedProgressBar(x,y,w,colorEmpty,colorFilled,progress,maxProgress,oldProgress)
for i = oldProgress, progress do
gui.drawProgressBar(x,y,w,colorEmpty,colorFilled,i,maxProgress)
os.sleep(0.1)
end
end


function gui.drawButton(x,y,w,h,text,buttonColor,textColor)
local oldBackground, oldForeground = gui.setColors(buttonColor,textColor)
gpu.fill(x,y,w,h," ")

local textX = x + math.floor(w/2)
local textY = y + math.floor(h/2)
gui.centerText(textX,textY,text)
gui.setColors(oldBackground,oldForeground)
local function checkTouch(touchX,touchY)
local x,y,w,h = x,y,w,h
local x2 = x+w
local y2 = y+h
if (touchX >= x) and (touchX <= x2) and (touchY >= y) and (touchY <= y2) then 
return true
end
return false
end
return checkTouch
end

return gui
