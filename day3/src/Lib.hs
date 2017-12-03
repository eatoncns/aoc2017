-- | A library to do stuff.
module Lib
    --(
    --  distance
    --) where
    where

import Data.List
import Data.Maybe

distance :: Int -> Int
distance input = ring + distanceToCentreLine input ring
  where ring = calculateRing input

calculateRing :: Int -> Int
calculateRing input = fromJust (findIndex (\n -> n >= input) ringBounds)

distanceToCentreLine :: Int -> Int -> Int
distanceToCentreLine _ 0 = 0
distanceToCentreLine input ring = minimum (map (distanceTo input) (centreLines ring))

distanceTo :: Int -> Int -> Int
distanceTo input centreLine = abs (input - centreLine)

centreLines :: Int -> [Int]
centreLines ring = take 4 [firstCentre, (firstCentre + next)..]
  where firstCentre = (ringBounds !! (ring - 1)) + ring
        next = ring * 2

ringBounds :: [Int]
ringBounds = [x*x | x <- [1, 3..]]
