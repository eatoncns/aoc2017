module Main where

import System.Environment
import Lib (unbalancedNodes)

main :: IO ()
main = do
  args <- getArgs
  input <- readFile (head args)
  print . unbalancedNodes .lines $ input
