module Srcs.Heuristic
( Heuristic 
, manhattan
, euclidean
, dijkstra
) where

import Srcs.Grill (Grill)
import Data.List
type Heuristic = (Grill -> Grill -> Int)

manhattan :: Heuristic
manhattan [] _ = 0
manhattan grill res = findDiff newGrill 0 newRes (length grill)
    where 
        newGrill = foldl1 (++) grill
        newRes = foldl1 (++) res
        findDiff :: [Int] -> Int -> [Int] -> Int -> Int
        findDiff [] _ _ _ = 0
        findDiff (x:xs) index res size = (abs ((resIndex `mod` size) - (index `mod` size))) + (abs ((resIndex `div` size) - (index `div` size))) + findDiff xs (index + 1) res size
            where
                (Just resIndex) = elemIndex x res
       
euclidean :: Heuristic
euclidean [] _ = 0
euclidean grill res = findDiff newGrill 0 newRes (length grill)
    where 
        newGrill = foldl1 (++) grill
        newRes = foldl1 (++) res
        findDiff :: [Int] -> Int -> [Int] -> Int -> Int
        findDiff [] _ _ _ = 0
        findDiff (x:xs) index res size = (round (sqrt (((getNb resIndex index size mod) ^ 2) + ((getNb resIndex index size div) ^ 2))))  + findDiff xs (index + 1) res size
            where
                (Just resIndex) = elemIndex x res
        getNb :: Int -> Int -> Int -> (Int -> Int -> Int) -> Float
        getNb x y size f =  realToFrac $ (f x size) - (f y size)

dijkstra:: Heuristic
dijkstra _ _ = 0