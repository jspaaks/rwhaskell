-- file: 0150/count-lines.hs
-- lines beginning with "--" are comments

main = interact countLines
    where countLines input = show (length (lines input)) ++ "\n"
