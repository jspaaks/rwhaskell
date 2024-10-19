module AsInt where
    import Data.Char (digitToInt, isDigit)

    asInt :: String -> Either String Int
    asInt []                               = Left  "Empty input"
    asInt ('-':[])                         = Left  "No digits to parse"
    asInt ('-':xs)                         = Left  "No negative numbers"
    asInt xs
        | any id $ map (not . isDigit) xs  = Left  "Non-digit characters in input"
        | otherwise                        = unsafeAsInt xs

    unsafeAsInt :: String -> Either String Int
    unsafeAsInt = foldl f (Right 0) where
        f (Left acc) x  = Left acc
        f (Right acc) x
            | acc > (maxint - digitToInt x) `div` 10 = Left "Integer overflow"
            | otherwise                              = Right $ 10 * acc + digitToInt x

    maxint = 2 ^ 63 - 1
