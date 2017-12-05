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
    jumpUpdate = if jump >= 3 then -1 else 1
    updatedJumps = S.update currentIndex (jump + jumpUpdate) jumps
    nextIndex = currentIndex + jump
