module Main where

import System.Environment
import Lib (stepsToExit)

main :: IO ()
main = do
  args <- getArgs
  input <- readFile (head args)
  (print . stepsToExit . (map read) . lines) input
