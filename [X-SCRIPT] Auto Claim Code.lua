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

addHook(function(packetType, packet)
        local lower = packet:lower()
        if lower:find("claim") then
            local hasil = packet:match("[/]*[Cc][Ll][Aa][Ii][Mm]%s+([^%s]+)")
            if hasil then
                if hasil:sub(1,1) == "`" then
                    hasil = hasil:sub(3)
                end
                sendPacket(2, "action|input\n|text|/claim "..hasil)
            end
        end
end, "OnSendPacket")

addHook(function(var)
    if type(var.v2) == "string" and var.v2:find("gwagwa_code") then
        for hasil in var.v2:gmatch("Code:%s*(.-);") do
            hasil = hasil:sub(3, -3)
            sendPacket(2, "action|input\n|text|/claim "..hasil)
        end
        return true
    end
end, "OnVariant")
watermark()
while true do
sendPacket(2, "action|input\n|text|/code")
Sleep(7000)
end
