module MyTakeWhile where
    myTakeWhileRecurse _    []     = []
    myTakeWhileRecurse pred (x:xs)
        | pred x    = x : myTakeWhileRecurse pred xs
        | otherwise = []


    myTakeWhileFoldr _    [] = []
    myTakeWhileFoldr pred xs = foldr f [] xs where
        f x acc
            | pred x    = x : acc
            | otherwise = []
