-- | A library to do stuff.
module Lib
    (
      countValid
    ) where

import Data.List.Unique

countValid :: [String] -> Int
countValid inputLines = length (filter isValid inputLines)

isValid :: String -> Bool
isValid line = (allUnique . words) line
