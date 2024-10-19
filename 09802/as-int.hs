module AsInt where
    import Data.Char (digitToInt, isDigit)

    asInt :: String -> Int
    asInt ('-':xs) = unsafeAsInt xs * (-1)
    asInt xs       = unsafeAsInt xs

    unsafeAsInt = foldl f 0 where
        f acc x = 10 * acc + digitToInt x

