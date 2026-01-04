local itemid = 5640
local delay = 100
local world_type = "island" -- island / normal

local maxY = 53
if world_type == "island" then
    maxY = 113
end

function watermark()
local dialog = [[
add_label_with_icon|big|`wX-SCRIPT|left|15110|
add_textbox|`wTerima Kasih Telah Menggunakan Script dari X-SCRIPT, Untuk Update Selanjutnya Silahkan Klik Button Di bawah Ini!|left|
add_url_button|comment|`wOpen Channel X-SCRIPT|color:0,0,0,0|https://whatsapp.com/channel/0029Vb60Vev2phHGjCHMpp3h||0|0|
add_quick_exit||
end_dialog|watermark|CANCEL|OK|
]]
    
    SendVariant({
        v1 = "OnDialogRequest",
        v2 = dialog
    })
end

local function punch(x, y, itemID)
    local d = {
        x = x * 32,
        y = y * 32,
        px = x,
        py = y,
        type = 3,
        value = itemID,
    }
    SendPacketRaw(false, d)
end
watermark()
for y = 1, maxY, 2 do
    for x = 1, 98 do
        punch(x, y, itemid)
        Sleep(delay)
    end
end
