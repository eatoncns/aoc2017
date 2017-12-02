-- | A library to do stuff.
module Lib
    (
      captcha
    ) where

import Data.Char

captcha :: String -> Int
captcha input = (sum . valueOf . matching . pairs . asIntegers) input

asIntegers :: String -> [Int]
asIntegers = map digitToInt

pairs :: [Int] -> [(Int, Int)]
pairs xs = zip xs (rotate (halfLength xs) xs)

halfLength :: [Int] -> Int
halfLength xs = (length xs) `div` 2

rotate :: Int-> [Int] -> [Int]
rotate n xs = after ++ before
  where (before, after) = splitAt n xs

matching :: [(Int, Int)] -> [(Int, Int)]
matching = filter (\(x, y) -> x == y)

valueOf :: [(Int, Int)] -> [Int]
valueOf = map fst
