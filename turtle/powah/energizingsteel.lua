energizer = peripheral.wrap("front")
halt_time = .25

Materials = {
    NETHER_STAR = 1,
    REDSTONE_BLOCK = 2,
    BLAZING_BLOCK = 3
}

Recipe = {
    NETHER_STAR = 1,
    REDSTONE_BLOCK = 2,
    BLAZING_BLOCK = 1
}

-- returns true if energizer is empty (item pulled out by ME import bus)
function checkEnergizerStatus()
    inv = energizer.list()
    return not next(inv)
end

function checkInv()
    return turtle.getItemCount() > 1
end

function placeRecipe()
    print("Placing Recipe...")
    turtle.select(Materials.NETHER_STAR)
    turtle.drop(Recipe.NETHER_STAR)
    turtle.select(Materials.REDSTONE_BLOCK)
    turtle.drop(Recipe.REDSTONE_BLOCK)
    turtle.select(Materials.BLAZING_BLOCK)
    turtle.drop(Recipe.BLAZING_BLOCK )
end

function main()
    -- waits to be given materials
    if not checkInv() then
        print("Waiting to be restocked...")
        os.sleep(halt_time)
        return
    end
    
    -- places the recipe
    placeRecipe()
    
    -- waits for recipe to complete
    while not checkEnergizerStatus() do
        print("Energizing...")
        os.sleep(halt_time)
    end

    -- repeats
end

while true do 
    main()
end