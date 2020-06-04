module BreedFuncs where 

import Data.Char




--Breed name, Country of origin, Average height, Main behaviour trait, Hypoallergenic
data Breed = Breed String String Int String Bool 
    deriving (Show, Read) 

--hard coded breeds
---------------------------------------------------------------------------
samoyed :: Breed
samoyed = Breed "Samoyed" "Russia" 55 "Energetic" True

beagle :: Breed
beagle = Breed "Beagle" "United Kingdom" 38 "Friendly" False

pomeranian :: Breed
pomeranian = Breed "Pomeranian" "Germany" 25 "Energetic" False
----------------------------------------------------------------------------

allBreed = ["Samoyed", "Beagle", "Pomeranian"] -- list of all available breeds

addToBreed x = x : allBreed --Adds breed to list of available breeds


showSamoyed = show samoyed --show breed info
showBeagle = show beagle
showPomeranian = show pomeranian

getOrigin :: Breed -> String
getOrigin (Breed _ o _ _ _) = o



kgToPounds :: Int -> Double 
kgToPounds x = (fromIntegral x) * 2.20462

--Formula: pups weight in pounds / age in weeks * 52
calculateAdultWeight :: Int -> Double -> Double 
calculateAdultWeight x y = kgToPounds x / y * 52   


--dog life stage calculator
whatPhase :: Int -> String
whatPhase age
      | (age < 6) = "Puppy"
      | (age >= 6) && (age < 18) = "Adolescent"
      | (age >= 18) && (age < 120) = "Adult"
      | (age >= 120) && (age < 200)= "Senior"
      | otherwise = "Very old doge"


--Used to get the behaviour trait of a breed for comparison
getBehaviour :: Breed -> String
getBehaviour (Breed _ _ _ b _) = b

--Check if 2 traits are equal
areTraitsEqual :: [Char] -> [Char] -> Bool
areTraitsEqual [] [] = True
areTraitsEqual (x:xs) (y:ys) = x == y && areTraitsEqual xs ys
areTraitsEqual _ _ = False  

--Compare the traits of the 2 breeds and return result
compareTraits :: Breed -> Breed -> Bool
compareTraits breed1 breed2 = 
    do
    let trait1 = getBehaviour breed1
    let trait2 = getBehaviour breed2
    areTraitsEqual trait1 trait2


--Convert strings to lowercase / used for user breed name input
lowerString str = [ toLower loweredString | loweredString <- str]
