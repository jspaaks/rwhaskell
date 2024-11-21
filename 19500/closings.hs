module Main (main) where

    import System.IO (getContents)

    import qualified Data.ByteString.Lazy.Char8 as DBLC ( ByteString
                                                        , getContents
                                                        , lines
                                                        , null
                                                        , pack
                                                        , readInt
                                                        , split
                                                        )

    type Cents = Maybe Int

    main = do
        contents <- DBLC.getContents
        let a = "The maximum closing price in the data is: "
            b = show $ highest $ closings contents
        putStrLn $ a <> b


    closing :: DBLC.ByteString -> Cents
    closing = readPrice . (!! icol) . DBLC.split ',' where
        icol = 4


    closings :: DBLC.ByteString -> [Maybe Int]
    closings = map closing . tail . DBLC.lines


    highest :: [Maybe Int] -> Maybe Int
    highest =  maximum . (Nothing:)


    readPrice ::  DBLC.ByteString -> Maybe Int
    readPrice s = (+) <$> d <*> c where
        [maybeDollars, maybeCents] = map (readNumber . DBLC.readInt) $ DBLC.split '.' s

        d = (100 *) <$> maybeDollars
        c = maybeCents

        readNumber :: Maybe (Int, DBLC.ByteString) -> Maybe Int
        readNumber (Just (i, remaining))
            | DBLC.null remaining = Just i
            | otherwise           = Nothing
        readNumber Nothing = Nothing
