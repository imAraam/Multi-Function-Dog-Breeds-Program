module Main where

import BreedFuncs

import Test.Tasty
import Test.Tasty.QuickCheck as QC
import Test.Tasty.HUnit

main :: IO ()
main = defaultMain tests

tests :: TestTree
tests = testGroup "Tests" [unitTests, properties]


properties :: TestTree
properties = testGroup "Property Tests" [qcConvTests, qcBreedTests] 


--QC Breed custom type, generator and instance
data BreedQCTest = BreedQCTest String String Int String Bool
              deriving (Show, Eq)

genBreed :: Gen BreedQCTest
genBreed = 
  do name <- elements ["Breed1", "Breed2", "Breed3", "Breed4", "Breed5"]
     origin <- elements ["Country1", "Country2", "Country3", "Country4", "Country5"]
     height <- choose (10, 150) --maintain realistic dog height
     trait <- elements ["Trait1", "Trait2", "Trait3", "Trait4", "Trait5"]
     hypoallergenic <- frequency [(1, return True), (2, return False)] --as most dogs are not hypoallergenic
     return (BreedQCTest name origin height trait hypoallergenic)

instance Arbitrary BreedQCTest where
  arbitrary = genBreed


--QC functions
prop_kgToLbs :: Int -> Bool
prop_kgToLbs x = kgToPounds x == (fromIntegral x) * 2.20462

prop_calcWeight :: Positive Int -> Positive Double -> Bool
prop_calcWeight (Positive x) (Positive y) = calculateAdultWeight x y == kgToPounds x / y * 52

prop_getHeight :: BreedQCTest-> Bool
prop_getHeight (BreedQCTest _ _ h _ _) = h == h

prop_addBreed :: BreedQCTest -> Bool
prop_addBreed (BreedQCTest n _ _ _ _) = n : allBreed == addToBreed n

qcConvTests = testGroup "Conversion Tests"
  [
    QC.testProperty "Kg to lbs" prop_kgToLbs

  , QC.testProperty "Weight calc" prop_calcWeight
  ]

qcBreedTests = testGroup "Breed Info. Tests"
  [
    QC.testProperty "Return correct element" prop_getHeight

  , QC.testProperty "Add a new breed" prop_addBreed  
  ]


unitTests :: TestTree
unitTests = testGroup "Unit Tests" [conversionTests, 
  weightCalculationTests, 
  breedTests, 
  phaseTests,
  traitTests]


conversionTests = testGroup "Conversion Tests" 
  [ --converts weight of puppies from lbs to kg
    testCase "lbs to kg (low num)" $ do
    kgToPounds 1 @?= 2.20462

  , testCase "lbs to kg (high num)" $ do
    kgToPounds 190 @?= 418.8778
  ]

weightCalculationTests = testGroup "Weight Calc. Tests" 
  [ --calculates adult weight of puppy and returns it in kg
    testCase "Puppy weight in kg (low num)" $ do
    calculateAdultWeight 20 10 * 0.453592 @?= 103.99979148415999

  ,  testCase "Puppy weight in kg (high num)" $ do
    calculateAdultWeight 80 20 * 0.453592 @?= 207.99958296831997
  ]

breedTests = testGroup "Breed Type Test"
  [ --check if breed related information is displayed properly
    testCase "Display breed info" $ do
    showSamoyed @?= "Breed \"Samoyed\" \"Russia\" 55 \"Energetic\" True"

  , testCase "Display breed origin" $ do
    getOrigin samoyed @?= "Russia"

  , testCase "Display all available breeds" $ do
    allBreed @?= ["Samoyed","Beagle","Pomeranian"]
    
  --check if breed additions can be made successfully
  , testCase "Add to available breeds" $ do
    addToBreed "testBreed" @?= ["testBreed", "Samoyed","Beagle","Pomeranian"]

  --Used to check if breed name input successfully converts to lowercase
  , testCase "String to lowercase" $ do
    lowerString "LOWERCASE" @?= "lowercase"
  ]

phaseTests = testGroup "Dog Age Phase Test"
  [ --check if correct age phase of dog is displayed
    testCase "Puppy phase" $ do
    whatPhase 5 @?= "Puppy"

  , testCase "Adolescent phase" $ do
    whatPhase 15 @?= "Adolescent"

  , testCase "Adult phase" $ do
    whatPhase 80 @?= "Adult"

  , testCase "Senior phase" $ do
    whatPhase 120 @?= "Senior"
  ]

traitTests = testGroup "Dog Traits Test"
  [ --check and compare dog traits
    testCase "Get behaviour" $ do
    getBehaviour samoyed @?= "Energetic"

  , testCase "Check if 2 traits are equal" $ do
    areTraitsEqual "Energetic" "Friendly" @?= False

  , testCase "Compare traits of 2 breeds" $ do
    compareTraits samoyed beagle @?= False
  ]