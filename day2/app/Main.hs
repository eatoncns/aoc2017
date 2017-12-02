module Main where

import System.Environment
import Lib (checksum)

main :: IO ()
main = do
  args <- getArgs
  input <- readFile (head args)
  (print . checksum . lines) input
