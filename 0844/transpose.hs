import System.Environment (getArgs)

main :: IO ()
main = mainWith transpose where

    mainWith f = do
        args <- getArgs
        case args of
            [inputFile,outputFile] -> interactWith f inputFile outputFile
            _              -> putStrLn "error: exactly two arguments needed"
        where

            interactWith :: (String -> String) -> FilePath -> FilePath -> IO ()
            interactWith function inputFile outputFile = do
                input <- readFile inputFile
                writeFile outputFile (function input)
            


    transpose :: String -> String
    transpose s = unlines $ f padded 0 ell where

        f :: [String] -> Int -> Int -> [String]
        f padded i n
            | i < n     = map (!! i) padded : f padded (i + 1) n
            | otherwise = []

        
        padded = map (pad ell) (lines s)
        ell = longest $ lines s
        
        pad :: Int -> String -> String
        pad n str
            | length str < n = pad n (str <> ['.'])
            | otherwise     = str


        longest :: [String] -> Int
        longest = foldl max 0 . map length

