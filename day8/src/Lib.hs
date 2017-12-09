-- | A library to do stuff.
module Lib where

import Data.List
import Data.List.Split
import qualified Data.HashMap as Map

data Instruction = Instruction { target :: String
                               , op :: (Int -> Int -> Int)
                               , value :: Int
                               , condTarget :: String
                               , condOp :: (Int -> Int -> Bool)
                               , condValue :: Int
                               }
type Registers = Map.Map String Int

largestRegister :: [String] -> Int
largestRegister input =
  processInstructions . map parseLine $ input

parseLine :: String -> Instruction
parseLine line =
  Instruction { target=parsedTarget
              , op=parsedOp
              , value=parsedValue
              , condTarget=parsedCondTarget
              , condOp=parsedCondOp
              , condValue=parsedCondValue }
  where
    splitLine = splitOn " " line
    parsedTarget = splitLine !! 0
    parsedOp = parseOp (splitLine !! 1)
    parsedValue = read (splitLine !! 2)
    parsedCondTarget = splitLine !! 4
    parsedCondOp = parseCondOp (splitLine !! 5)
    parsedCondValue = read (splitLine !! 6)

parseOp :: String -> (Int -> Int -> Int)
parseOp operation =
  case operation of
    "inc" -> (+)
    "dec" -> (-)

parseCondOp :: String -> (Int -> Int -> Bool)
parseCondOp operation =
  case operation of
    ">" -> (>)
    "<" -> (<)
    ">=" -> (>=)
    "<=" -> (<=)
    "==" -> (==)
    "!=" -> (/=)

processInstructions :: [Instruction] -> Int
processInstructions = snd . foldl processInstruction (Map.empty, 0)

processInstruction :: (Registers, Int) -> Instruction -> (Registers, Int)
processInstruction (registers, currentMax) ins =
  if (condOp ins) (getValue registers (condTarget ins)) (condValue ins) then
    (updatedRegisters, updateMax updatedRegisters currentMax)
  else
    (registers, currentMax)
  where
    updatedRegisters = updateRegisters registers ins

updateMax :: Registers -> Int -> Int
updateMax registers oldMax =
  max (findLargestRegister registers) oldMax

getValue :: Registers -> String -> Int
getValue registers register =
  case Map.lookup register registers of
    Just x -> x
    Nothing -> 0

updateRegisters :: Registers -> Instruction -> Registers
updateRegisters registers ins =
  Map.insert register ((op ins) existingValue (value ins)) registers
  where
    register = target ins
    existingValue = getValue registers register

findLargestRegister :: Registers -> Int
findLargestRegister = snd . maximumBy valueOrder . Map.toList

valueOrder :: (String, Int) -> (String, Int) -> Ordering
valueOrder (_, v1) (_, v2) = compare v1 v2
