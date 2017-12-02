-- | A library to do stuff.
module Lib
    (
      checksum
    ) where

import Data.List

checksum :: [String] -> Int
checksum rows = (sum . rowValues . asIntegerLists) rows

asIntegerLists :: [String] -> [[Int]]
asIntegerLists ls = map convertList (map words ls)

convertList :: [String] -> [Int]
convertList = map read

rowValues :: [[Int]] -> [Int]
rowValues = map rowValue

rowValue :: [Int] -> Int
rowValue = valueOf . head . evenlyDivisible . pairs . sortDesc

sortDesc :: [Int] -> [Int]
sortDesc = reverse . sort

pairs :: [Int] -> [(Int, Int)]
pairs row = [(x, y) | (x:ys) <- tails row, y <- ys]

evenlyDivisible :: [(Int, Int)] -> [(Int, Int)]
evenlyDivisible = filter (\(x, y) -> x `rem` y == 0)

valueOf :: (Int, Int) -> Int
valueOf (x, y) = x `div` y
