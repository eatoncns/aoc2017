module Main where

import System.Environment
import Lib (score)

main :: IO ()
main = do
  args <- getArgs
  input <- readFile . head $ args
  print . score . head . lines $ input
