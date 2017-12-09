-- | A library to do stuff.
module Lib where

score :: String -> Int
score = score' 0 0

score' :: Int -> Int -> String -> Int
score' total _ [] = total
score' total depth (x : xs) =
  case x of
    '{' -> score' total (depth + 1) xs
    '}' -> score' (total + depth) (depth -1) xs
    '<' -> score' total depth (skipGarbage xs)
    _   -> score' total depth xs

skipGarbage :: String -> String
skipGarbage [] = []
skipGarbage ('!' : _ : xs) = skipGarbage xs
skipGarbage ('>' : xs) = xs
skipGarbage (_ : xs) = skipGarbage xs
