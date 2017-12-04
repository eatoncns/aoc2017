module Main where

import System.Environment
import Lib (countValid)

main :: IO ()
main = do
  args <- getArgs
  input <- readFile (head args)
  (print . countValid . lines) input
