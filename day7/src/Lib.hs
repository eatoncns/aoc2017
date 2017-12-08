-- | A library to do stuff.
module Lib where

import Data.List
import Data.List.Split
import Data.Maybe
import Data.Char

data Node = Node String Int [Node]

bottomProgram :: [String] -> String
bottomProgram input = fromJust (find (\holder -> notElem holder holdees) holders)
  where (holders, holdees) = parse input

parse :: [String] -> ([String], [String])
parse input = foldl parseLine ([], []) input

parseLine :: ([String], [String]) -> String -> ([String], [String])
parseLine acc line =
  if elem '>' line then
    parseInfo acc line
  else
    acc

parseInfo :: ([String], [String]) -> String -> ([String], [String])
parseInfo (currentHolders, currentHoldees) line = (holders, holdees)
  where holders = (parseHolder line) : currentHolders
        holdees = currentHoldees ++ (parseHoldees line)

parseHolder :: String -> String
parseHolder = (trimR . head . splitOn " ")

parseHoldees :: String -> [String]
parseHoldees line = (splitOn ", ") . trimL . lastElem . (splitOn ">") $ line

lastElem :: [a] -> a
lastElem = head . reverse

trimR :: String -> String
trimR = dropWhileEnd isSpace

trimL :: String -> String
trimL = dropWhile isSpace
