module Main where 

import BreedFuncs


main :: IO()
main = do 
    putStrLn "Insert the number of desired action: \n\                
                   \1: Display available breeds. \n\
                   \2: Display specific details of a breed. \n\
                   \3: Calculate adult puppy weight. \n\
                   \4: Dog life stage calculator. \n\
                   \5: Compare if 2 dogs have the same trait. "
    action <- getLine
    if action == "1"
        then print allBreed
        else if action == "2"
        then do 
            putStrLn "Enter name of breed: "
            breedName <- getLine
            let b = lowerString breedName
            putStrLn "Breed |  Name  |  Origin  |  Adult Height (cm)  |  Character  |  Hypoallergenic\n"
            if b == "samoyed"
                then print $ showSamoyed 
                else if b == "beagle"
                    then print $ showBeagle
                    else if b == "pomeranian"
                        then print $ showPomeranian
                        else return ()
            else if action == "3"
            then do
                    putStrLn "Enter the dog's weight in kg: " 
                    weight <- readLn
                    let w = weight :: Int
                    putStrLn "Enter the dog's age in weeks: "
                    age <- readLn
                    let a = age :: Double
                    putStrLn "\nThe estimated weight of the dog in kg at adult age is: "
                    print  (round ((calculateAdultWeight w a) * 0.453592)) --multiplied by 0.45 to show weight in kg
                    else if action == "4"
                    then do 
                        putStrLn "Enter the dog's age in months: "
                        ageInMonths <- readLn
                        let a = ageInMonths :: Int
                        print $ whatPhase a

                        else return () 
