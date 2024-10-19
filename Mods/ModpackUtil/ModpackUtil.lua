--- STEAMODDED HEADER
--- MOD_NAME: Dimserene's Modpack Utility
--- MOD_ID: Modpack_Util
--- MOD_AUTHOR: [Dimserene]
--- MOD_DESCRIPTION: Dimserene's Modpack Utility
--- VERSION: Insane
--- PRIORITY: -999999999999999999999999
----------------------------------------------
------------MOD CODE -------------------------

local lovely = require("lovely")
local nativefs = require("nativefs")

if SMODS.Atlas then
  SMODS.Atlas({
    key = "modicon",
    path = "icon.png",
    px = 32,
    py = 32
  })
end


local ModpackName = "Dimserene's Modpack - Insane"
local ModpackVersion = nativefs.read(lovely.mod_dir .. "/ModpackUtil/CurrentVersion.txt")
local ModpackUpdate = nativefs.read(lovely.mod_dir .. "/ModpackUtil/VersionTime.txt")

local gameMainMenuRef = Game.main_menu
function Game:main_menu(change_context)
	gameMainMenuRef(self, change_context)
	UIBox({
		definition = {n = G.UIT.ROOT, config = {align = "cm", colour = G.C.CLEAR}, nodes = {
						{n= G.UIT.R, config = {align = "cr"}, nodes = {
							{n = G.UIT.T, config = {scale = 0.3, text = ModpackName, align = "cr", colour = G.C.UI.TEXT_LIGHT}}}},
						{n= G.UIT.R, config = {align = "cr", padding = 0.05}, nodes = {
							{n = G.UIT.T, config = {scale = 0.3, text = "Current Version: " .. ModpackVersion, align = "cr", colour = G.C.UI.TEXT_LIGHT}}}},
						{n= G.UIT.R, config = {align = "cr", padding = 0.05}, nodes = {
							{n = G.UIT.T, config = {scale = 0.3, text = "(UTC) " .. ModpackUpdate, align = "cr", colour = G.C.UI.TEXT_LIGHT}}}},
					}},
		config = {
			align = "tri",
			bond = "Weak",
			offset = {
				x = 0,
				y = 0.6
			},
			major = G.ROOM_ATTACH
		}
	})
end

function Game:splash_screen()
    splash_screenRef(self)

    SMODS.current_mod = mod
   
    if (SMODS.Mods["Bunco"] or {}).can_load then
        for i = #G.P_CENTER_POOLS["Booster"], 1, -1 do
            local entry = G.P_CENTER_POOLS["Booster"][i]
            if string.find(entry.key, "p_bunc_virtual") then
                table.remove(G.P_CENTER_POOLS["Booster"], i)
            end
        end
    end

	if (SMODS.Mods["Oiimanaddition"] or {}).can_load then
		for i = #G.P_CENTER_POOLS["Booster"], 1, -1 do
			local entry = G.P_CENTER_POOLS["Booster"][i]
			if string.find(entry.key, "p_oiim_conditional") then
				table.remove(G.P_CENTER_POOLS["Booster"], i)
			end
		end
	end
end

----------------------------------------------
------------MOD CODE END----------------------
