module LibSpec where

import Test.Hspec

import Lib (bottomProgram)

main :: IO ()
main = hspec spec


exampleInput = ["pbga (66)"
              , "xhth (57)"
              , "ebii (61)"
              , "havc (66)"
              , "ktlj (57)"
              , "fwft (72) -> ktlj, cntj, xhth"
              , "qoyq (66)"
              , "padx (45) -> pbga, havc, qoyq"
              , "tknk (41) -> ugml, padx, fwft"
              , "jptl (61)"
              , "ugml (68) -> gyxo, ebii, jptl"
              , "gyxo (61)"
              , "cntj (57)"]

spec :: Spec
spec =
  describe "bottomProgram" $ do
    it "returns correct result for example input" $ do
      bottomProgram exampleInput `shouldBe` "tknk"
