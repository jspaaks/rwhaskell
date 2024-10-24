module PrettyJSON
    (
        renderJValue
    ) where

    import Numeric (showHex)
    import Data.Char (ord)
    import Data.Bits ((.&.), shiftR)
    import SimpleJSON (JValue(..))
    import Prettify (Doc, doccat, char, double, fsep, hcat, punctuate, text,
                    compact, pretty, string, series, empty, (</>))

    renderJValue :: JValue -> Doc
    renderJValue (JBool True)  = text "true"
    renderJValue (JBool False) = text "false"
    renderJValue JNull         = text "null"
    renderJValue (JNumber num) = double num
    renderJValue (JString str) = string str
    renderJValue (JArray ary)  = series '[' ']' renderJValue ary
    renderJValue (JObject obj) = series '{' '}' field obj
        where field (name,val) = string name
                               `doccat` text ": "
                               `doccat` renderJValue val


