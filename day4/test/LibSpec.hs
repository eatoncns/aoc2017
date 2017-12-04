module LibSpec where

import Test.Hspec

import Lib (countValid)

main :: IO ()
main = hspec spec


exampleData = ["abcde fghi",
               "abcde xyz ecdab",
               "a ab abc abd abf abj",
               "iiii oiii ooii oooi oooo",
               "oiii ioii iioi iiio"]

spec :: Spec
spec =
  describe "countValid" $ do
    it "returns correct result for example data" $ do
      countValid exampleData `shouldBe` 3
