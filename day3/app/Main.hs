module Main where

import System.Environment
import Lib (distance)

main :: IO ()
main = do
  args <- getArgs
  (print . distance . read . head) args
