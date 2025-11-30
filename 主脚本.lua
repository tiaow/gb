local placeId = game.PlaceId
local gameScripts = {
    [10834586502] = "ATBB.lua"  
}

if gameScripts[placeId] then
    
    loadstring(game:HttpGet())()
end