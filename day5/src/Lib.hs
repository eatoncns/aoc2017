-- | A library to do stuff.
module Lib
    (
      stepsToExit
    ) where

import qualified Data.Sequence as S

stepsToExit :: [Int] -> Int
stepsToExit jumps = stepsToExit' (S.fromList jumps) 0 0

stepsToExit' :: S.Seq Int -> Int -> Int -> Int
stepsToExit' jumps currentIndex steps =
  if currentIndex < 0 || currentIndex >= S.length jumps  then
    steps
  else
    stepsToExit' updatedJumps nextIndex (steps + 1)
  where
    jump = S.index jumps currentIndex
    updatedJumps = S.update currentIndex (jump + 1) jumps
    nextIndex = currentIndex + jump
