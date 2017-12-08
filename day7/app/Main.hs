module Main where

import System.Environment
import Lib (bottomProgram)

main :: IO ()
main = do
  args <- getArgs
  input <- readFile (head args)
  print . bottomProgram .lines $ input
