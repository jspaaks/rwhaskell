module MeanOfAList where

    sumOfAList :: [Int] -> Int
    sumOfAList []     = 0
    sumOfAList (x:xs) = x + sumOfAList xs

    lengthOfAList :: [a] -> Int
    lengthOfAList []     = 0
    lengthOfAList (x:xs) = 1 + lengthOfAList xs

    meanOfAList :: [Int] -> Maybe Float
    meanOfAList [] = Nothing
    meanOfAList xs = Just (a / b) where
        a :: Float = fromIntegral (sumOfAList xs)
        b :: Float = fromIntegral (lengthOfAList xs)
