module SimpleJson
    ( JsonValue(..)
    , getString
    , getInt
    , getDouble
    , getBool
    , getObject
    , getArray
    , isNull
    ) where

    data JsonValue = JsonString String
                   | JsonNumber Double
                   | JsonBool Bool
                   | JsonNull
                   | JsonArray [JsonValue]
                   | JsonObject [(String,JsonValue)]
                   deriving (Eq, Ord, Show)

    getString :: JsonValue -> Maybe String
    getString (JsonString s) = Just s
    getString _              = Nothing


    getInt :: JsonValue -> Maybe Int
    getInt (JsonNumber n)    = Just $ truncate n
    getInt _                 = Nothing


    getDouble :: JsonValue -> Maybe Double
    getDouble (JsonNumber n) = Just n
    getDouble _              = Nothing


    getBool :: JsonValue -> Maybe Bool
    getBool (JsonBool b)     = Just b
    getBool _                = Nothing


    getObject :: JsonValue -> Maybe [(String,JsonValue)]
    getObject (JsonObject o) = Just o
    getObject _              = Nothing


    getArray :: JsonValue -> Maybe [JsonValue]
    getArray (JsonArray a)   = Just a
    getArray _               = Nothing


    isNull :: JsonValue -> Bool
    isNull v = v == JsonNull
