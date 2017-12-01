module Main where

import System.Environment
import Lib (captcha)

main :: IO ()
main = do
  args <- getArgs
  (print . captcha . head) args
