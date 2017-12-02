module LibSpec where

import Test.Hspec

import Lib (checksum)

main :: IO ()
main = hspec spec

exampleInput = ["5 9 2 8",
                "9 4 7 3",
                "3 8 6 5"]

spec :: Spec
spec =
  describe "checksum" $ do
    it "returns correct result for example input" $ do
      checksum exampleInput `shouldBe` 9
