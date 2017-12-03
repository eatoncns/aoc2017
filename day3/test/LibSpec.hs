module LibSpec where

import Test.Hspec

import Lib (distance)

main :: IO ()
main = hspec spec

spec :: Spec
spec =
  describe "distance" $ do
    it "works for example data" $ do
      distance 1 `shouldBe` 0
      distance 12 `shouldBe` 3
      distance 23 `shouldBe` 2
      distance 1024 `shouldBe` 31
