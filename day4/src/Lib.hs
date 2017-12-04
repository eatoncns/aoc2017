-- | A library to do stuff.
module Lib
    (
      countValid
    ) where

import Data.List.Unique
import Data.List

countValid :: [String] -> Int
countValid inputLines = length (filter isValid inputLines)

isValid :: String -> Bool
isValid line = (allUnique . (map sort) . words) line
