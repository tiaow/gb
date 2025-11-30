local placeId = game.PlaceId
local gameScripts = {
    [10834586502] = "ATBB.lua"  
}

if gameScripts[placeId] then
    local qidong = "https://raw.githubusercontent.com/tiaow/gb/refs/heads/main/" .. gameScripts[placeId]
    loadstring(game:HttpGet(qidong))()
else

end