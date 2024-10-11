module IsPalindrome where

    isPalindrome1 :: (Eq a) => [a] -> Bool
    isPalindrome1 xs = helper xs' xs'' where
        xs' = take n xs
        xs'' = take n (reverse xs)
        n = length xs `div` 2
        helper [] _  = True
        helper _  [] = True
        helper (a:as) (b:bs) = a == b && helper as bs


    isPalindrome2 :: (Eq a) => [a] -> Bool
    isPalindrome2 xs = xs == reverse xs

    isPalindrome3 :: (Eq a) => [a] -> Bool
    isPalindrome3 [] = True
    isPalindrome3 [_] = True
    isPalindrome3 (x:xs) = (x == last xs) && isPalindrome3 (init xs)

