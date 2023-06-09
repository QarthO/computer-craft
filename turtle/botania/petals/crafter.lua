local function clearInv()
    for slot = 1, 16, 1 do
        turtle.select(slot)
        turtle.dropUp()
    end
end

local function sortInv()
    if turtle.getItemCount() == 0 then
        return
    end
    item = turtle.getItemDetail()

    flower = false
    for k,v in pairs(item) do
        if string.find(v, "double_flower") then
            flower = true
        elseif string.find(v, "petal") then
            flower = true
            -- refils 1 petal to harvester, then puts rest in storage
            turtle.dropDown(1)
            turtle.drop()
        end
    end

    if not flower then
        clearInv()
    end
end

storage = peripheral.wrap("front")

local locals = {
    TURTLE_DIRECTION = "down",
    BONE_MEAL_STORAGE_SLOT = "10",
    BONE_MEAL_TURTLE_SLOT = "4"
}

-- replaces 1 bonemeal after every cycle
local function replaceBoneMeal()
    -- pushItems(toName, fromSlot [, limit [, toSlot]])
    -- toName = direction of inventory to push item into
    -- fromSlot = the slot in the storage to pull the items out
    -- limit = number of items to pull out
    -- toSlot = the slot in the "toName" inventory to put the items
    storage.pushItems(locals.TURTLE_DIRECTION, locals.BONE_MEAL_STORAGE_SLOT, 1, locals.BONE_MEAL_TURTLE_SLOT)
end

local function main()
    turtle.select(1)
    turtle.craft()
    sortInv()
    replaceBoneMeal()
end

while true do
    main()
end