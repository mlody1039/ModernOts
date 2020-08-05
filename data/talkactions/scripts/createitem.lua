function onSay(cid, words, param, channel)
if(param == '') then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Command param required.")
return TRUE
end
local t = string.explode(param, ",")
local ret = RETURNVALUE_NOERROR
local pos = getCreaturePosition(cid)
local id = tonumber(t[1])
if(not id) then
id = getItemIdByName(t[1], false)
if(not id) then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Item wich such name does not exists.")
return TRUE
end
end
local amount = 100
if(t[2]) then
amount = t[2]
end
local item = doCreateItemEx(id, amount)
if(t[3] and getBooleanFromString(t[3])) then
if(t[4] and getBooleanFromString(t[4])) then
pos = getCreatureLookPosition(cid)
end
ret = doTileAddItemEx(pos, item)
else
ret = doPlayerAddItemEx(cid, item, TRUE)
end
if(ret ~= RETURNVALUE_NOERROR) then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Couldn't add item: " .. t[1])
return TRUE
end
doDecayItem(item)
if(not isPlayerGhost(cid)) then
doSendMagicEffect(pos, CONST_ME_MAGIC_RED)
end
return TRUE
end
