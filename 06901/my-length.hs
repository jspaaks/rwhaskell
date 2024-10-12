module MyLength ( myLength1
                , myLength2
                , myLength3 ) where

    myLength1 :: [a] -> Int
    myLength1 xs = helper 0 xs where
        helper n xs'
            | null xs'  = n
            | otherwise = helper (n + 1) (tail xs')

    myLength2 :: [a] -> Int
    myLength2 [] = 0
    myLength2 (x:xs) = 1 + myLength2 xs

    myLength3 :: [a] -> Int
    myLength3 xs
        | null xs   = 0
        | otherwise = 1 + myLength3 (tail xs)
