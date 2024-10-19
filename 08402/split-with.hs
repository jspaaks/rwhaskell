module SplitWith where
    splitWith :: (a -> Bool) -> [a] -> [[a]]
    splitWith predicate [] = []
    splitWith predicate xs = helper prefix suffix where
        (prefix, suffix) = break predicate xs
        helper prefix' [] = [prefix']
        helper [] suffix = splitWith predicate (tail suffix)
        helper prefix' suffix' = prefix : splitWith predicate (tail suffix)
