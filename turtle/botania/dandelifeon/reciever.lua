local cellCount = 6

local Channels = {
    OUT = 69,
    IN = 420
}

local Peripherals = {
    MODEM = "right",
    LAMP = "back"
}

local Delays = {
    SETUP = 7,
    CYCLE = 50
}


modem = peripheral.wrap(Peripherals.MODEM)

local function main()
    turtle.suckUp(cellCount)
    turtle.drop(cellCount)
    os.sleep(Delays.SETUP)
    redstone.setOutput(Peripherals.LAMP, true)
    modem.transmit(Channels.OUT, Channels.IN, "on")
    os.sleep(Delays.CYCLE)
    redstone.setOutput(Peripherals.LAMP, false)
    modem.transmit(Channels.OUT, Channels.IN, "off")
end

while true do
    main()
end