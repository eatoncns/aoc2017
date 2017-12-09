-- | A library to do stuff.
module Lib where

garbageCount :: String -> Int
garbageCount = garbageCount' 0 False

garbageCount' :: Int -> Bool -> String -> Int
garbageCount' count _ [] = count
garbageCount' count False ('<' : xs) = garbageCount' count True xs
garbageCount' count False (_ : xs) = garbageCount' count False xs
garbageCount' count True ('!' : _ : xs) = garbageCount' count True xs
garbageCount' count True ('>' : xs) = garbageCount' count False xs
garbageCount' count True (_ : xs) = garbageCount' (count + 1) True xs
