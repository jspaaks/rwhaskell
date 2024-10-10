-- file: 0163/count-words.hs
-- lines beginning with "--" are comments

main = interact countWords
    where countWords input = show (length (words input)) ++ "\n"
