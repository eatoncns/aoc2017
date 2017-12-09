-- | A library to do stuff.
module Lib where

import Data.List.Split
import Data.Char
import Data.Maybe
import qualified Data.HashMap as Map
import qualified Data.Set as Set

type Relations = Map.Map String [String]
type Weights = Map.Map String Int
type Tree = (Relations, Weights)
type Node = (String, Int)
type Child = String

unbalancedNodes :: [String] -> [Child]
unbalancedNodes = findUnbalancedNodes . parseInput

parseInput :: [String] -> Tree
parseInput = foldl processLine initTree

initTree :: Tree
initTree = (Map.empty, Map.empty)

processLine :: Tree -> String -> Tree
processLine tree line =
  if describesLeaf line then
    insertLeafNode tree (parseNode line)
  else
    insertNode tree (parseNode line) (parseChildren line)

describesLeaf :: String -> Bool
describesLeaf = notElem '>'

insertLeafNode :: Tree -> Node -> Tree
insertLeafNode (relations, weights) (name, weight) =
  (relations, Map.insert name weight weights)

parseNode :: String -> (String, Int)
parseNode line = (name, weight)
  where name = head . splitOn " " $ line
        weight = read . filter isDigit $ line

insertNode :: Tree -> Node -> [Child] -> Tree
insertNode (relations, weights) (name, weight) children =
  (Map.insert name children relations, Map.insert name weight weights)

parseChildren :: String -> [String]
parseChildren = (splitOn ", ") . trimL . lastElem . (splitOn ">")

lastElem :: [a] -> a
lastElem = head . reverse

trimL :: String -> String
trimL = dropWhile isSpace

findUnbalancedNodes :: Tree -> [Child]
findUnbalancedNodes (relations, weights) =
  findUnbalancedNodes' (Map.toList relations) relations weights

findUnbalancedNodes' :: [(String, [Child])] -> Relations -> Weights -> [Child]
findUnbalancedNodes' ((name, children) : rest) relations individualWeights =
  if unbalancedChildren then
    children
  else
    findUnbalancedNodes' rest relations individualWeights
  where
    childWeights = map (totalWeight relations individualWeights) children
    unbalancedChildren = length (Set.fromList childWeights) /= 1

totalWeight :: Relations -> Weights -> String -> Int
totalWeight relations weights name =
  if Map.notMember name relations then
    nodeWeight
  else
    nodeWeight + sum (map (totalWeight relations weights) (children name relations))
  where
    nodeWeight = fromJust . Map.lookup name $ weights

children :: String -> Relations -> [Child]
children name relations =
  case Map.lookup name relations of
    Just x -> x
    Nothing -> []
