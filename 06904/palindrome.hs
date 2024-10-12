module Palindrome where
    palindrome1 :: [a] -> [a]
    palindrome1 xs = xs <> reverse xs

    palindrome2 :: [a] -> [a]
    palindrome2 []     = []
    palindrome2 (x:xs) = [x] <> thunk <> [x] where
        thunk = palindrome2 xs

    palindrome3 :: [a] -> [a]
    palindrome3 []     = []
    palindrome3 (x:xs) = x : thunk <> [x] where
        thunk = palindrome3 xs
