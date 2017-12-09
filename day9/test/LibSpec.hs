module LibSpec where

import Test.Hspec

import Lib (garbageCount)

main :: IO ()
main = hspec spec

spec :: Spec
spec =
  describe "garbageCount" $ do
    it "returns correct results for example data" $ do
      garbageCount "{}" `shouldBe` 0
      garbageCount "{{{}}}" `shouldBe` 0
      garbageCount "{{},{}}" `shouldBe` 0
      garbageCount "{{{},{},{{}}}}" `shouldBe` 0
      garbageCount "{<a>,<a>,<a>,<a>}" `shouldBe` 4
      garbageCount "{{<ab>},{<ab>},{<ab>},{<ab>}}" `shouldBe` 8
      garbageCount "{{<!!>},{<!!>},{<!!>},{<!!>}}" `shouldBe` 0
      garbageCount "{{<a!>},{<a!>},{<a!>},{<ab>}}" `shouldBe` 17
