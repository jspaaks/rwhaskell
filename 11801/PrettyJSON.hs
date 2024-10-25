module PrettyJSON
    (
        renderJValue
    ) where

    import Numeric (showHex)
    import Data.Char (ord)
    import Data.Bits ( shiftR
                     , (.&.)
                     )
    import SimpleJSON (JValue(..))
    import Prettify ( Doc
                    , merge
                    , double
                    , text
                    , string
                    , series
                    )

    renderJValue :: JValue -> Doc
    renderJValue (JBool True)  = text "true"
    renderJValue (JBool False) = text "false"
    renderJValue JNull         = text "null"
    renderJValue (JNumber num) = double num
    renderJValue (JString str) = string str
    renderJValue (JArray items)  = series '[' ']' renderJValue items
    renderJValue (JObject items) = series '{' '}' renderPair items
        where renderPair (name,val) = string name
                                    `merge` text ": "
                                    `merge` renderJValue val


