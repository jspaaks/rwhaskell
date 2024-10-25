module Prettify ( Doc
                , empty
                , char
                , text
                , lineFeed
                , string
                , double
                , merge
                , doccat
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
             | LineFeed
             | Merge Doc Doc
             | Options Doc Doc
               deriving (Show,Eq)


    empty :: Doc
    empty = Empty


    char :: Char -> Doc
    char c = Char c


    text :: String -> Doc
    text "" = Empty
    text s = Text s


    lineFeed :: Doc
    lineFeed = LineFeed


    string :: String -> Doc
    string = enclose '"' '"' . doccat . escape


    double :: Double -> Doc
    double d = text (show d)


    doccat :: [Doc] -> Doc
    doccat = foldr merge empty where


    merge :: Doc -> Doc -> Doc
    Empty `merge` y = y
    x `merge` Empty = x
    x `merge` y     = x `Merge` y


    fsep :: [Doc] -> Doc
    fsep = foldr (</>) empty where

        (</>) :: Doc -> Doc -> Doc
        x </> y  = x `merge` softline `merge` y

        softline :: Doc
        softline = group lineFeed

        group :: Doc -> Doc
        group x = Options (flatten x) x

        flatten :: Doc -> Doc
        flatten (x `Merge` y) = flatten x `Merge` flatten y
        flatten LineFeed       = Char ' '
        flatten (Options x _)  = flatten x
        flatten other          = other


    enclose :: Char -> Char -> Doc -> Doc
    enclose left right x = char left `merge` x `merge` char right


    compact :: Doc -> String
    compact x = transform [x]
        where transform [] = ""
              transform (d:ds) =
                  case d of
                      Empty       -> transform ds
                      Char c      -> c : transform ds
                      Text s      -> s ++ transform ds
                      LineFeed    -> '\n' : transform ds
                      Merge a b   -> transform (a:b:ds)
                      Options _ b -> transform (b:ds)



    pretty width x = best 0 [x]
        where best col (d:ds) =
                  case d of
                      Empty       -> best col ds
                      Char c      -> c : best (col + 1) ds
                      Text s      -> s ++ best (col + length s) ds
                      LineFeed    -> '\n' : best 0 ds
                      Merge a b   -> best col (a:b:ds)
                      Options a b -> nicest col (best col (a:ds))
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


    series :: Char -> Char -> (a -> Doc) -> [a] -> Doc
    series pre suf renderItem = enclose pre suf
                              . fsep
                              . punctuate (char ',')
                              . map renderItem
        where
            punctuate :: Doc -> [Doc] -> [Doc]
            punctuate p []     = []
            punctuate p [d]    = [d]
            punctuate p (d:ds) = (d `merge` p) : punctuate p ds


    --  Note about escaping from user Scott (https://book.realworldhaskell.org/admin/comments/comment/9104/)
    --
    --  UTF-16 represents non-BMP characters (those from 0x10000 through 0x10FFFF) using a pair
    --  of 16-bit words, known as a surrogate pair. First 0x10000 is subtracted from the code
    --  point (character value) to give a 20-bit value. This is then split into two separate 10-bit
    --  values each of which is represented as a surrogate with the most significant half placed
    --  in the first surrogate. To allow safe use of simple word-oriented string processing,
    --  separate ranges of values are used for the two surrogates: 0xD800–0xDBFF for the first,
    --  most significant surrogate and 0xDC00-0xDFFF for the second, least significant surrogate.
    escape :: String -> [Doc]
    escape = map f where
        f ch = case ch of
            '\b'               -> text "\\b"
            '\n'               -> text "\\n"
            '\f'               -> text "\\f"
            '\r'               -> text "\\r"
            '\t'               -> text "\\t"
            '\\'               -> text "\\\\"
            '\"'               -> text "\\\""
            '/'                -> text "\\/"
            _   | needsUnicode -> hexEscape ch
                | otherwise    -> char ch
            where
                needsUnicode = ch < ' ' || ch == '\x7f' || ch > '\xff'


                hexEscape :: Char -> Doc
                hexEscape ch | d < 0x10000 = smallHex d
                             | otherwise   = astral (d - 0x10000)
                    where
                        d = ord ch

                        smallHex :: Int -> Doc
                        smallHex x = text "\\u"
                                   `merge` text (drop (length h) "0000")
                                   `merge` text h
                            where h = showHex x ""


                        astral :: Int -> Doc
                        astral n = smallHex (a + 0xd800) `merge` smallHex (b + 0xdc00)
                            where a = (n `shiftR` 10) .&. 0x3ff
                                  b = n .&. 0x3ff


