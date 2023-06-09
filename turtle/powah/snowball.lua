energizer = peripheral.wrap("front")
halt_time = .25

Materials = {
    SNOWBALL = 1
}

Recipe = {
    SNOWBALL = 1
}

completed_item = "powah:crystal_blazing"

-- returns true if energizer is empty (item pulled out)
function checkEnergizerStatus()
    inv = energizer.list()
    return not next(inv)
end

function checkInv()
    return turtle.getItemCount() > 1
end

function placeRecipe()
    print("Placing Recipe...")
    turtle.select(Materials.SNOWBALL)
    turtle.drop(Recipe.SNOWBALL)
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