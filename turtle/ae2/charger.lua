local Peripherals = {
    TOOL = "left",
    CHARGER = "front"
}

charger = peripheral.wrap(Peripherals.CHARGER)
tool = peripheral.wrap(Peripherals.TOOL)

local Slots = {
    RAW = 1,
}

function checkCharger()
    if not charger.list() then
        return
    end
    if not charger.list()[1] then
        os.sleep(1)
        tool.useOnBlock()
        return
    end
    item = charger.list()[1].name
    if string.find(item, "charged") then
        return true
    else
        return false
    end
end

while true do
    if checkCharger() then
        print("Charged!")
        tool.useOnBlock()
        print("Waiting...")
    end
end