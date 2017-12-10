-- | A library to do stuff.
module Lib where

import Data.Char (ord)
import Data.List.Split (chunksOf)
import Data.Bits (xor)
import Numeric (showHex)

knotHash :: String -> String
knotHash input
  = concat . map toHex . map denseHash . chunksOf 16 . runRounds . addSuffix . map ord $ input

addSuffix :: [Int] -> [Int]
addSuffix xs = xs ++ [17, 31, 73, 47, 23]

runRounds :: [Int] -> [Int]
runRounds xs = performHash [0..255] rounds 0 0
  where rounds = concat . replicate 64 $ xs

denseHash :: [Int] -> Int
denseHash = foldl1 xor

toHex :: Int -> String
toHex x = leftPad 2 (showHex x "")

leftPad :: Int -> String -> String
leftPad n s = replicate (n - length s) '0' ++ s

performHash :: [Int] -> [Int] -> Int -> Int -> [Int]
performHash input [] _ _ = input
performHash input (len : rest) current skip =
  performHash updatedInput rest next (skip + 1)
  where
    updatedInput = rotateRight current . replace len . rotateLeft current $ input
    next = (current + len + skip) `mod` (length input)

rotateLeft :: Int-> [Int] -> [Int]
rotateLeft n xs = after ++ before
  where (before, after) = splitAt n xs

rotateRight :: Int -> [Int] -> [Int]
rotateRight n xs = after ++ before
  where (before, after) = splitAt ((length xs) - n) xs

replace :: Int -> [Int] -> [Int]
replace len input = reversed ++ rest
  where
    reversed = reverse . take len $ input
    rest = drop len input
