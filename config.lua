Keys = {
    ['ESC'] = 322, ['F1'] = 288, ['F2'] = 289, ['F3'] = 170, ['F5'] = 166, ['F6'] = 167, ['F7'] = 168, ['F8'] = 169, ['F9'] = 56, ['F10'] = 57,
    ['~'] = 243, ['1'] = 157, ['2'] = 158, ['3'] = 160, ['4'] = 164, ['5'] = 165, ['6'] = 159, ['7'] = 161, ['8'] = 162, ['9'] = 163, ['-'] = 84, ['='] = 83, ['BACKSPACE'] = 177,
    ['TAB'] = 37, ['Q'] = 44, ['W'] = 32, ['E'] = 38, ['R'] = 45, ['T'] = 245, ['Y'] = 246, ['U'] = 303, ['P'] = 199, ['['] = 39, [']'] = 40, ['ENTER'] = 18,
    ['CAPS'] = 137, ['A'] = 34, ['S'] = 8, ['D'] = 9, ['F'] = 23, ['G'] = 47, ['H'] = 74, ['K'] = 311, ['L'] = 182,
    ['LEFTSHIFT'] = 21, ['Z'] = 20, ['X'] = 73, ['C'] = 26, ['V'] = 0, ['B'] = 29, ['N'] = 249, ['M'] = 244, [','] = 82, ['.'] = 81,
    ['LEFTCTRL'] = 36, ['LEFTALT'] = 19, ['SPACE'] = 22, ['RIGHTCTRL'] = 70,
    ['HOME'] = 213, ['PAGEUP'] = 10, ['PAGEDOWN'] = 11, ['DELETE'] = 178,
    ['LEFT'] = 174, ['RIGHT'] = 175, ['TOP'] = 27, ['DOWN'] = 173,
}

Config = Config or {}

-- Open scoreboard key
--Config.OpenKey = Keys["HOME"]

Config.OpenKey = Keys["L"]
Config.OpenKey1 = Keys["HOME"]


-- Max Server Players
Config.MaxPlayers = GetConvarInt('sv_maxclients', 128) -- It returnes 64 if it cant find the Convar Int

-- Minimum Police for Actions
Config.IllegalActions = {
    ["storerob"] = {
        minimum = 1,
        busy = false,
    },
    ["houserob"] = {
        minimum = 2,
        busy = false,
    },	
    ["fleecarob"] = {
        minimum = 4,
        busy = false,
    },
    ["poletorob"] = {
        minimum = 1,
        busy = false,
    },
    ["jewellery"] = {
        minimum = 3,
        busy = false,
    },
    ["casinorob"] = {
        minimum = 1,
        busy = false,
    },
    ["subrob"] = {
        minimum = 1,
        busy = false,
    },
    ["atmrob"] = {
        minimum = 2,
        busy = false,
    },
    ["phonerob"] = {
        minimum = 3,
        busy = false,
    },
    ["humanlabrob"] = {
        minimum = 1,
        busy = false,
    },
    ["ciarob"] = {
        minimum = 1,
        busy = false,
    },
    ["pacific"] = {
        minimum = 6,
        busy = false,
    },
    ["policerob"] = {
        minimum = 4,
        busy = false,
    },
    ["kidnap"] = {
        minimum = 2,
        busy = false,
    },
    ["policeonline"] = {
        minimum = 1,
        busy = false,
    },
	["ambulance"] = {
        minimum = 1,
        busy = false,
    },
	["soon"] = {
        minimum = 2,
        busy = false,
    },
}

-- Current Cops Online
Config.CurrentCops = 0

-- Current Ambulance / Doctors Online
Config.currentAmbulance = 0

Config.CurrentCraft = 0
Config.CurrentDealer = 0