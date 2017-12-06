-- | A library to do stuff.
module Lib
    --(
    --  redistributionCycles
    --) where
    where

import qualified Data.Sequence as Seq
import qualified Data.Set as Set
import Data.Maybe

type Banks = Seq.Seq Int
type Memo = Set.Set Banks

redistributionCycles :: [Int] -> Int
redistributionCycles bankList =
  redistributionCycles' (Seq.fromList bankList) Set.empty 0

redistributionCycles' :: Banks -> Memo -> Int -> Int
redistributionCycles' banks memo cycles =
  if Set.member banks memo then
    cycles
  else
    redistributionCycles' redistributedBanks updatedMemo (cycles + 1)
  where
    redistributedBanks = redistribute banks
    updatedMemo = Set.insert banks memo


redistribute :: Banks -> Banks
redistribute banks =
  redistribute' (Seq.update index 0 banks) (nextIndex banks index) max
  where
    max = maximum banks
    index = fromJust (Seq.elemIndexL max banks)

redistribute' :: Banks -> Int -> Int -> Banks
redistribute' banks currentIndex remaining =
  if remaining == 0 then
    banks
  else
    redistribute' incrementCurrent (nextIndex banks currentIndex) (remaining - 1)
  where
    current = Seq.index banks currentIndex
    incrementCurrent = Seq.update currentIndex (current + 1) banks

nextIndex :: Banks -> Int -> Int
nextIndex banks currentIndex =
  if currentIndex == (length banks) - 1 then 0 else currentIndex + 1
