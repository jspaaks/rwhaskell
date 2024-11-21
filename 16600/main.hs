module Main (main) where

    main :: IO ()
    main = do
        [ actions !! x | x <- [0..3] ]

    actions :: [IO ()]
    actions = [ putStr "Hello"
              , putStr " "
              , putStr "world"
              , putStrLn "!"
              ]
