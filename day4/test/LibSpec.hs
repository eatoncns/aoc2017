module LibSpec where

import Test.Hspec

import Lib (countValid)

main :: IO ()
main = hspec spec


exampleData = ["aa bb cc dd ee", "aa bb cc dd aa", "aa bb cc dd aaa"]

spec :: Spec
spec =
  describe "countValid" $ do
    it "returns correct result for example data" $ do
      countValid exampleData `shouldBe` 2
