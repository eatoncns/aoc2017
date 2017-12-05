module LibSpec where

import Test.Hspec

import Lib (stepsToExit)

main :: IO ()
main = hspec spec

spec :: Spec
spec =
  describe "stepsToExit" $ do
    it "returns correct value for example data" $ do
      stepsToExit [0, 3, 0, 1, -3] `shouldBe` 5
