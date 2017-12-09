module LibSpec where

import Test.Hspec

import Lib (largestRegister)

main :: IO ()
main = hspec spec

exampleInput = ["b inc 5 if a > 1"
              , "a inc 1 if b < 5"
              , "c dec -10 if a >= 1"
              , "c inc -20 if c == 10"]

spec :: Spec
spec =
  describe "largestRegister" $ do
    it "returns correct result for example data" $ do
      largestRegister exampleInput `shouldBe` 10
