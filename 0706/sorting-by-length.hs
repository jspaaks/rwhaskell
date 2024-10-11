module SortingByLength where

    import Data.List (sortBy)

    sortingByLength :: [[a]] -> [[a]]
    sortingByLength xss = sortBy f xss where
        f a b
            | length a < length b = LT
            | length a > length b = GT
            | otherwise           = EQ
