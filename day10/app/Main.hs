module Main where

import System.Environment
import Lib (knotHash)

main :: IO ()
main = do
  args <- getArgs
  print . knotHash . head $ args
