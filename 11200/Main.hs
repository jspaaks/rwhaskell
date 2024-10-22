module Main (main) where

    import SimpleJson
    import PutJson

    o = JsonObject [("foo", JsonNumber 1), ("bar", JsonBool False)]

    main = putJsonValue o
