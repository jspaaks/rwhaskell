module Main ( isElf
            , isElfFile
            , main
            ) where


    import System.Environment ( getArgs )

    import qualified Data.ByteString.Lazy as DBL ( ByteString
                                                 , pack
                                                 , readFile
                                                 , zipWith
                                                 )

    isElf :: DBL.ByteString -> Bool
    isElf actual = and $ DBL.zipWith (==) actual expected where
        expected = DBL.pack [0x7f, 0x45, 0x4c, 0x46]


    isElfFile :: FilePath -> IO Bool
    isElfFile path = do
        content <- DBL.readFile path
        return (isElf content)


    main = do
        args <- getArgs
        if null args
            then do putStrLn "Usage: elfcheck PATH"
        else do
            let path = head args
            b <- isElfFile path
            if b
                then putStrLn $ "'" <> path <> "' is an ELF file."
                else putStrLn $ "'" <> path <> "' is not an ELF file."
