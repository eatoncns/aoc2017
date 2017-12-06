module LibSpec where

import Test.Hspec

import Lib (redistributionCycles)

main :: IO ()
main = hspec spec

spec :: Spec
spec =
  describe "redistributionCycles" $ do
    it "returns correct anser for example data" $ do
      redistributionCycles [0, 2, 7, 0] `shouldBe` 5
