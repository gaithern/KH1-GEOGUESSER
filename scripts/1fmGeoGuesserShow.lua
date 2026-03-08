LUAGUI_NAME = "1fmGeoGuesserShow"
LUAGUI_AUTH = "Gicu"
LUAGUI_DESC = "Kingdom Hearts 1FM Show GeoGuesser Coords"

require("kh1_lua_library")

function _OnInit()
    if GAME_ID == 0xAF71841E and ENGINE_TYPE == "BACKEND" then
        require("VersionCheck")
    else
        ConsolePrint("KH1 not detected, not running script")
    end
end

function _OnFrame()
    if canExecute then
        if is_pressed({"Triangle", "L2", "L1", "R2", "R1"}, true) then
            local world = tostring(get_world())
            local room = tostring(get_room())
            local pos = get_sora_pos()
            local x = string.format("%.2f", pos["X"])
            local y = string.format("%.2f", pos["Y"])
            local z = string.format("%.2f", pos["Z"])
            local line1 = "World: " .. world .. " Room: " .. room
            local line2 = "X: " .. x .. " Y: " .. y .. " Z: " .. z
            show_prompt({[1]=""},{[1]={line1, line2}},null,142)
        end
    end
end
