-- | A library to do stuff.
module Lib
    (
      firstLarger
    ) where

import qualified Data.Map.Strict as Map

data Direction = R | U | L | D
type Coordinate = (Int, Int)

path :: [Direction]
path = concat $ zipWith replicate stepSizes directions

stepSizes :: [Int]
stepSizes = concatMap (replicate 2) [1..]

directions :: [Direction]
directions = cycle [R, U, L, D]

firstLarger :: Int -> Int
firstLarger input = firstLarger' input (0, 0) (Map.singleton (0, 0) 1) path

firstLarger' :: Int -> Coordinate -> Map.Map Coordinate Int -> [Direction] -> Int
firstLarger' input current memo dirs =
  if nextValue > input
    then nextValue
    else firstLarger' input next (Map.insert next nextValue memo) (tail dirs)
  where
    next = move current (head dirs)
    nextValue = valueOf next memo

move :: Coordinate -> Direction -> Coordinate
move (x, y) direction =
  case direction of
    R -> (x + 1, y)
    U -> (x, y + 1)
    L -> (x - 1, y)
    D -> (x, y - 1)

valueOf :: Coordinate -> Map.Map Coordinate Int -> Int
valueOf coord memo = sum (map (lookupValue memo) (adjacents coord))

lookupValue :: Map.Map Coordinate Int -> Coordinate -> Int
lookupValue memo coordinate = Map.findWithDefault 0 coordinate memo

adjacents :: Coordinate -> [Coordinate]
adjacents (x, y) = [(x + x', y + y') | x' <- [-1..1], y' <- [-1..1], (x', y') /= (0, 0)]
