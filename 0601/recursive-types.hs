module RecursiveTypes where

    data MyList a = MyCons a (MyList a)
                  | MyNil
                  deriving (Show)

    theirListToMyList :: [a] -> MyList a
    theirListToMyList (x:xs) = MyCons x (theirListToMyList xs)
    theirListToMyList []     = MyNil

    myListToTheirList :: MyList a -> [a]
    myListToTheirList (MyCons x xs) = x : myListToTheirList xs
    myListToTheirList MyNil         = []
