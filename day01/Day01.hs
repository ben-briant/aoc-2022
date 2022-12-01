module Main (main) where
import Data.List
import System.Environment

splitInts :: [String] -> Int -> [Int]
splitInts ("":xs) i = (i : splitInts xs 0)
splitInts (x:xs)  i = splitInts xs (i + read x)
splitInts []      i = [i]

splitAll :: String -> [String]
splitAll = lines

sumNElems :: [Int] -> Int -> Int
sumNElems (x: _) 0 = 0
sumNElems []     _ = 0
sumNElems (x:xs) n = x + (sumNElems xs (n - 1))

main :: IO()
main = do
    arg <- read <$> head <$> getArgs
    contents <- readFile "./data"
    print $ sumNElems (reverse $ sort $ splitInts (splitAll contents) 0) arg
    return ()

