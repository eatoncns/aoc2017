module LibSpec where

import Test.Hspec

import Lib (checksum)

main :: IO ()
main = hspec spec

exampleInput = ["5 1 9 5",
                "7 5 3",
                "2 4 6 8"]

spec :: Spec
spec =
  describe "checksum" $ do
    it "returns correct result for example input" $ do
      checksum exampleInput `shouldBe` 18
