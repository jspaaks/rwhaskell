module Intersperse where
    myIntersperse :: a -> [[a]] -> [a]
    myIntersperse _ []       = []
    myIntersperse sep [x] = x
    myIntersperse sep (x:y:xs) = x <> [sep] <> myIntersperse sep (y:xs)
