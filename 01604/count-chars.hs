-- file: 0164/count-chars.hs
-- lines beginning with "--" are comments

main = interact countChars
    where countChars input = show (length input) ++ "\n"
