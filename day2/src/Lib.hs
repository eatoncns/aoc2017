-- | A library to do stuff.
module Lib
    (
      checksum
    ) where

checksum :: [String] -> Int
checksum rows = (sum . rowDifferences . asIntegerLists) rows

asIntegerLists :: [String] -> [[Int]]
asIntegerLists ls = map convertList (map words ls)

convertList :: [String] -> [Int]
convertList = map read

rowDifferences :: [[Int]] -> [Int]
rowDifferences = map difference

difference :: [Int] -> Int
difference row = (maximum row) - (minimum row)
