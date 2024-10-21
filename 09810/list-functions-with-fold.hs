module ListFunctionsWithFold where

    import Data.List (groupBy)

    myAny :: (a -> Bool) -> [a] -> Bool
    myAny f = foldr g False where
        g item acc = (f item) || acc


    myCycle :: [a] -> [a]
    myCycle [] = []
    myCycle xs = undefined


    myWords :: [Char] -> [[Char]]
    myWords "" = []
    myWords xs = snd $ foldr f (' ', []) xs where
        f ' '      (_, [])        = (' ', [])
        f thisItem (_, [])        = (thisItem, [[thisItem]])
        f thisItem (prevItem, (word:words))
            | continueWord  = (thisItem, (thisItem : word) : words)
            | startNewWord  = (thisItem, [thisItem] : (word : words))
            | otherwise     = (thisItem, word : words)
            where
                startNewWord = thisItem /= ' ' && prevItem == ' '
                continueWord = thisItem /= ' ' && prevItem /= ' '


    myWords' = filter g . groupBy f where
        f a b = a /= ' ' && b /= ' '
        g x = head x /= ' '


    myUnlines :: [[Char]] -> [Char]
    myUnlines = foldr f [] where
        f item acc = item <> "\n" <> acc

