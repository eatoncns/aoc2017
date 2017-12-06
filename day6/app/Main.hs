module Main where

import System.Environment
import Lib (redistributionCycles)

main :: IO ()
main = do
  args <- getArgs
  (print . redistributionCycles . (map read)) args
