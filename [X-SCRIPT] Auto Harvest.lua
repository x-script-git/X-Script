EditToggle("ModFly", true)
EditToggle("Anti Portal/Door", true)

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

function findPath(x, y)
    px = math.floor(GetLocal().posX / 32)
    py = math.floor(GetLocal().posY / 32)
    jarax = x - px
    jaray = y - py

    if jaray > 6 then
        for i = 1, math.floor(jaray / 6) do
            py = py + 6
            Sleep(50)
            FindPath(px, py)
            Sleep(50)
        end
    elseif jaray < -6 then
        for i = 1, math.floor(jaray / -6) do
            py = py - 6
            Sleep(50)
            FindPath(px, py)
            Sleep(50)
        end
    end

    if jarax > 8 then
        for i = 1, math.floor(jarax / 6) do
            px = px + 6
            Sleep(50)
            FindPath(px, py)
            Sleep(50)
        end
    elseif jarax < -6 then
        for i = 1, math.floor(jarax / -6) do
            px = px - 6
            Sleep(50)
            FindPath(px, py)
            Sleep(50)
        end
    end

    Sleep(50)
    FindPath(x, y)
    Sleep(50)
end

function punch(x, y)
    if GetTile(x, y).fg ~= 0 then
        pkt = {}
        pkt.px = x
        pkt.py = y
        pkt.type = 3
        pkt.value = 18
        pkt.x = GetLocal().posX
        pkt.y = GetLocal().posY
        SendPacketRaw(false, pkt)

        state = { 4196896, 16779296 }
        for _, st in ipairs(state) do
            hld = {}
            hld.px = x
            hld.py = y
            hld.type = 0
            hld.value = 0
            hld.x = GetLocal().posX
            hld.y = GetLocal().posY
            hld.state = st
            SendPacketRaw(false, hld)
            Sleep(70)
        end
    end
end

function getTiles()
    tile = {}
    for XS = 97, 0, -6 do
        XE = XS - 5
        for px = 0, 99, 1 do
            for py = XE, XS do
                int = GetTile(px, py)
                table.insert(tile, int)
            end
        end
    end
    return tile
end

watermark()

while true do
    local found = false

    for _, tile in pairs(getTiles()) do
        if tile.readyharvest == true and tile.fg % 2 == 1 then
            found = true

            if GetTile(tile.x, tile.y).fg ~= 0 then
                findPath(tile.x, tile.y)
                Sleep(10)
                punch(tile.x, tile.y)
                --Sleep(150)
            end
        end
    end

    if not found then
        Sleep(500) -- tidak ada plant siap, tunggu
    else
        Sleep(100) -- habis punch, cek ulang biar ga miss
    end
end
