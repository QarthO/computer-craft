local Peripherals = {
    BLAZE = "top",
    REDSTONE = "left",
    ENERGIZER = "front"
}

local Slots = {
    NETHER_STAR = 1
}

energizer = peripheral.wrap("front")

function placeBlazeBlock()
    redstone.setOutput(Peripherals.BLAZE, true)
    os.sleep(.1)
    redstone.setOutput(Peripherals.BLAZE, false)
end

function placeRedstoneBlock()
    redstone.setOutput(Peripherals.BLAZE, true)
    os.sleep(.1)
    redstone.setOutput(Peripherals.REDSTONE, false)
end

function placeNetherStar()
    turtle.select(Slots.NETHER_STAR)
    turtle.place()
end

function checkInv()
    inv = energizer.list()
    if inv then
        if inv[1] then
            item = inv[1].name
            return item == "powah:crystal_nitro"
        end
    end
    return false
end

local function main()
    placeBlazeBlock()
    os.sleep(.1)
    placeBlazeBlock()
    os.sleep(.1)
    placeRedstoneBlock()
    os.sleep(.1)
    placeNetherStar()
    os.sleep(.1)
    while not checkInv() do
        os.sleep(1)
    end
    os.sleep(.1)
end

while true do
    main()
end