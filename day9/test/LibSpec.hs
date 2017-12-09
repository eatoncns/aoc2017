module LibSpec where

import Test.Hspec

import Lib (score)

main :: IO ()
main = hspec spec

spec :: Spec
spec =
  describe "score" $ do
    it "returns correct results for example data" $ do
      score "{}" `shouldBe` 1
      score "{{{}}}" `shouldBe` 6
      score "{{},{}}" `shouldBe` 5
      score "{{{},{},{{}}}}" `shouldBe` 16
      score "{<a>,<a>,<a>,<a>}" `shouldBe` 1
      score "{{<ab>},{<ab>},{<ab>},{<ab>}}" `shouldBe` 9
      score "{{<!!>},{<!!>},{<!!>},{<!!>}}" `shouldBe` 9
      score "{{<a!>},{<a!>},{<a!>},{<ab>}}" `shouldBe` 3
