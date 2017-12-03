module LibSpec where

import Test.Hspec

import Lib (firstLarger)

main :: IO ()
main = hspec spec

spec :: Spec
spec =
  describe "firstLarger" $ do
    it "works for example data" $ do
      firstLarger 133 `shouldBe` 142
      firstLarger 760 `shouldBe` 806
