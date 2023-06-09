energizer = peripheral.wrap("front")
halt_time = .25

Materials = {
    ENDER_EYE = 1,
    DIELETRIC_CASING = 2,
    BASIC_CAPACITOR = 3
}

Recipe = {
    ENDER_EYE = 1,
    DIELETRIC_CASING = 1,
    BASIC_CAPACITOR = 1
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
    turtle.select(Materials.ENDER_EYE)
    turtle.drop(Recipe.ENDER_EYE)
    turtle.select(Materials.DIELETRIC_CASING)
    turtle.drop(Recipe.DIELETRIC_CASING)
    turtle.select(Materials.BASIC_CAPACITOR)
    turtle.drop(Recipe.BASIC_CAPACITOR )
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