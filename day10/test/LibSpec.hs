module LibSpec where

import Test.Hspec

import Lib (knotHash)

main :: IO ()
main = hspec spec

spec :: Spec
spec =
  describe "knotHash" $ do
    it "returns correct result for example data" $ do
      knotHash "" `shouldBe` "a2582a3a0e66e6e86e3812dcb672a272"
      knotHash "1,2,3" `shouldBe` "3efbe78a8d82f29979031a4aa0b16a9d"
      knotHash "1,2,4" `shouldBe` "63960835bcdc130f0b66d7ff4f6a5a8e"
