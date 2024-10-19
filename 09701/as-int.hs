module AsInt where
    import Data.Char (digitToInt, isDigit)

    asInt :: String -> Int
    asInt = foldl f 0 where
        f acc x = 10 * acc + digitToInt x
