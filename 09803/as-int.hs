module AsInt where
    import Data.Char (digitToInt, isDigit)

    asInt :: String -> Int
    asInt []                               = error "Empty input"
    asInt ('-':[])                         = error "No digits to parse"
    asInt ('-':xs)                         = error "No negative numbers"
    asInt xs
        | any id $ map (not . isDigit) xs  = error "Non-digit characters in input"
        | otherwise                        = unsafeAsInt xs

    unsafeAsInt = foldl f 0 where
        f acc x
            | acc > (maxint - digitToInt x) `div` 10 = error "Integer overflow"
            | otherwise                   = 10 * acc + digitToInt x

    maxint = 2 ^ 63 - 1
