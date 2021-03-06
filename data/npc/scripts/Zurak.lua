local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

-- OTServ event handling functions start
function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) 			npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) 	npcHandler:onCreatureSay(cid, type, msg) end
function onThink() 						npcHandler:onThink() end
-- OTServ event handling functions end


-- Don"t forget npcHandler = npcHandler in the parameters. It is required for all StdModule functions!
local travelNode = keywordHandler:addKeyword({"chazorai"}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Do you want to sail to Chazorai " .. (getConfigInfo("freeTravel") and "free?" or "50 gps?")})
	travelNode:addChildKeyword({"yes"}, StdModule.travel, {npcHandler = npcHandler, premium = false, level = 0, cost = 0, destination = {x=33100, y=31018, z=7} })
	travelNode:addChildKeyword({"no"}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = "We would like to serve you some time."})
	
local travelNode = keywordHandler:addKeyword({"back"}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Do you want to sail to Back " .. (getConfigInfo("freeTravel") and "free?" or "50 gps?")})
	travelNode:addChildKeyword({"yes"}, StdModule.travel, {npcHandler = npcHandler, premium = false, level = 0, cost = 0, destination = {x=33158, y=31228, z=7} })
	travelNode:addChildKeyword({"no"}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = "We would like to serve you some time."})

keywordHandler:addKeyword({"travel"}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Where do you want to go {Chazorai} or {Back}."})
keywordHandler:addKeyword({"go"}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Where do you want to go {Chazorai} or {Back}."})
keywordHandler:addKeyword({"job"}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am the captain of this ship."})
keywordHandler:addKeyword({"captain"}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am the captain of this ship."})

npcHandler:addModule(FocusModule:new())