module Main where

import System.Environment
import Lib (largestRegister)

main :: IO ()
main = do
  args <- getArgs
  input <- readFile . head $ args
  print . largestRegister . lines $ input
