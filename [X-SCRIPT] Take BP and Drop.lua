--local urutan_item = 33 -- urutan itemnya di dalam BP
--local itemid_to_drop =  1308 -- itemid item yang diambil dari BP
--local jumlah_drop = 200 -- Jumlah drop item nya [Max 200]

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
    if packet:find("backpack_menu") then
        local btn = packet:match("buttonClicked|(%d+)")
        if btn then
            LogToConsole("Urutan = " .. btn)
        end
    end
end, "OnSendPacket")

watermark()

if jumlah_drop > 200 then
  jumlah_drop = 200
  LogToConsole("Jumlah drop lebih dari 200, otomatis mengubah ke 200")
end

while true do
  sendPacket(2, "action|dialog_return\ndialog_name|backpack_menu\nbuttonClicked|" .. urutan_item .. "\n\n")
  Sleep(2000)
  sendPacket(2, "action|dialog_return\ndialog_name|drop_item\nitemID|" .. itemid_to_drop .. "|\ncount|" .. jumlah_drop .. "\n")
  Sleep(2000) 
end
