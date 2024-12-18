module Prettify ( Doc
                , empty
                , char
                , text
                , line
                , string
                , double
                , doccat
                , hcat
                , fsep
                , compact
                , pretty
                , series
                ) where

    import Data.Char (ord)
    import Numeric (showHex)
    import Data.Bits ((.&.), shiftR)


    data Doc = Empty
             | Char Char
             | Text String
             | Line
             | Concat Doc Doc
             | Union Doc Doc
               deriving (Show,Eq)


    empty :: Doc
    empty = Empty


    char :: Char -> Doc
    char c = Char c


    text :: String -> Doc
    text "" = Empty
    text s = Text s


    line :: Doc
    line = Line


    string :: String -> Doc
    string = enclose '"' '"' . hcat . map oneChar


    double :: Double -> Doc
    double d = text (show d)


    doccat :: Doc -> Doc -> Doc
    Empty `doccat` y = y
    x `doccat` Empty = x
    x `doccat` y     = x `Concat` y


    hcat :: [Doc] -> Doc
    hcat = fold doccat


    fold :: (Doc -> Doc -> Doc) -> [Doc] -> Doc
    fold f = foldr f empty


    fsep :: [Doc] -> Doc
    fsep = fold (</>)


    (</>) :: Doc -> Doc -> Doc
    x </> y  = x `doccat` softline `doccat` y


    softline :: Doc
    softline = group line


    group :: Doc -> Doc
    group x = flatten x `Union` x


    flatten :: Doc -> Doc
    flatten (x `Concat` y) = flatten x `Concat` flatten y
    flatten Line           = Char ' '
    flatten (x `Union` _)  = flatten x
    flatten other          = other


    compact :: Doc -> String
    compact x = transform [x]
        where transform [] = ""
              transform (d:ds) =
                  case d of
                      Empty        -> transform ds
                      Char c       -> c : transform ds
                      Text s       -> s ++ transform ds
                      Line         -> '\n' : transform ds
                      a `Concat` b -> transform (a:b:ds)
                      _ `Union` b  -> transform (b:ds)



    pretty width x = best 0 [x]
        where best col (d:ds) =
                  case d of
                      Empty        -> best col ds
                      Char c       -> c : best (col + 1) ds
                      Text s       -> s ++ best (col + length s) ds
                      Line         -> '\n' : best 0 ds
                      a `Concat` b -> best col (a:b:ds)
                      a `Union` b  -> nicest col (best col (a:ds))
                                                 (best col (b:ds))
              best _ _ = ""
              nicest col a b | (width - least) `fits` a = a
                             | otherwise                = b
                             where least = min width col


    fits :: Int -> String -> Bool
    w `fits` _ | w < 0 = False
    w `fits` ""        = True
    w `fits` ('\n':_)  = True
    w `fits` (c:cs)    = (w - 1) `fits` cs


    punctuate :: Doc -> [Doc] -> [Doc]
    punctuate p []     = []
    punctuate p [d]    = [d]
    punctuate p (d:ds) = (d `doccat` p) : punctuate p ds


    series :: Char -> Char -> (a -> Doc) -> [a] -> Doc
    series open close item = enclose open close
                           . fsep . punctuate (char ',') . map item

    enclose :: Char -> Char -> Doc -> Doc
    enclose left right x = char left `doccat` x `doccat` char right


    oneChar :: Char -> Doc
    oneChar c = case lookup c simpleEscapes of
        Just r               -> text r
        Nothing | mustEscape -> hexEscape c
                | otherwise  -> char c
        where mustEscape = c < ' ' || c == '\x7f' || c > '\xff'


    simpleEscapes :: [(Char, String)]
    simpleEscapes = zipWith ch "\b\n\f\r\t\\\"/" "bnfrt\\\"/"
        where ch a b = (a, ['\\', b])


    hexEscape :: Char -> Doc
    hexEscape c | d < 0x10000 = smallHex d
                | otherwise   = astral (d - 0x10000)
        where d = ord c


    smallHex :: Int -> Doc
    smallHex x = text "\\u"
               `doccat` text (replicate (4 - length h) '0')
               `doccat` text h
        where h = showHex x ""


    astral :: Int -> Doc
    astral n = smallHex (a + 0xd800) `doccat` smallHex (b + 0xdc00)
        where a = (n `shiftR` 10) .&. 0x3ff
              b = n .&. 0x3ff


