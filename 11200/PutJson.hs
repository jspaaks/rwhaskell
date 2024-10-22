module PutJson (renderJsonValue, putJsonValue) where

    import SimpleJson
    import Data.List (intercalate)


    renderJsonValue :: JsonValue -> String
    renderJsonValue (JsonString s) = s
    renderJsonValue (JsonNumber n) = show n
    renderJsonValue (JsonBool True) = "true"
    renderJsonValue (JsonBool False) = "false"
    renderJsonValue (JsonNull) = "null"
    renderJsonValue (JsonArray items) = brackets $ join $ map renderJsonValue items
    renderJsonValue (JsonObject items) = braces $ join $ map renderItem items where
        renderItem (k,v) = quote k <> ": " <> renderJsonValue v


    wrap :: Char -> Char -> ([Char] -> [Char])
    wrap pre suf = (<> [suf]) . (pre :)

    quote :: [Char] -> [Char]
    quote = wrap '"' '"'

    brackets :: [Char] -> [Char]
    brackets = wrap '[' ']'

    braces :: [Char] -> [Char]
    braces = wrap '{' '}'

    join :: [[Char]] -> [Char]
    join = intercalate ", "


    putJsonValue :: JsonValue -> IO ()
    putJsonValue = putStrLn . renderJsonValue
