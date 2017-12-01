module LibSpec where

import Test.Hspec
import Test.Hspec.QuickCheck

import Lib (captcha)

main :: IO ()
main = hspec spec

spec :: Spec
spec =
  describe "captcha" $ do
    it "returns 3 for 1122" $ do
      captcha "1122" `shouldBe` 3
    it "returns 4 for 1111" $ do
      captcha "1111" `shouldBe` 4
    it "returns 0 for 1234" $ do
      captcha "1234" `shouldBe` 0
    it "returns 9 for 91212129" $ do
      captcha "91212129" `shouldBe` 9
