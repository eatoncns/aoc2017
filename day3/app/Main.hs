module Main where

import System.Environment
import Lib (firstLarger)

main :: IO ()
main = do
  args <- getArgs
  (print . firstLarger . read . head) args
