module LibSpec where

import Test.Hspec
import Test.Hspec.QuickCheck

import Lib (captcha)

main :: IO ()
main = hspec spec

spec :: Spec
spec =
  describe "captcha" $ do
    it "returns 6 for 1212" $ do
      captcha "1212" `shouldBe` 6
    it "returns 0 for 1221" $ do
      captcha "1221" `shouldBe` 0
    it "returns 4 for 123425" $ do
      captcha "123425" `shouldBe` 4
    it "returns 12 for 123123" $ do
      captcha "123123" `shouldBe` 12
    it "returns 4 for 12131415" $ do
      captcha "12131415" `shouldBe` 4
