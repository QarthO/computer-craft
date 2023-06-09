energizer = peripheral.wrap("front")
halt_time = .25

Materials = {
    DRY_ICE = 1
}

Recipe = {
    DRY_ICE = 2
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
    turtle.select(Materials.DRY_ICE)
    turtle.drop(Recipe.DRY_ICE)
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