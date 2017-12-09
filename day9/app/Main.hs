module Main where

import System.Environment
import Lib (garbageCount)

main :: IO ()
main = do
  args <- getArgs
  input <- readFile . head $ args
  print . garbageCount . head . lines $ input
