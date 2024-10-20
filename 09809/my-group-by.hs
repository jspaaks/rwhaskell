module MyGroupBy where

    myGroupBy :: (a -> a -> Bool) -> [a] -> [[a]]
    myGroupBy pred xs = foldr f [[]] xs where
        f x [[]] = [[x]]
        f x (group:groups)
            | continueSameGroup = (x : group) : groups
            | otherwise         = [x] : group : groups
            where
                continueSameGroup = pred x (head group)

