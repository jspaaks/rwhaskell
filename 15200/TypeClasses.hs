module TypeClasses where

    data Color = Red
               | Green
               | Blue
               deriving (Show)

    data Encoded a = Single a
                   | Consecutive Int a
                   deriving (Show)

    instance Eq Color where
        Red   == Red   = True
        Green == Green = True
        Blue  == Blue  = True
        _     == _     = False


    instance Eq (Encoded Integer) where
        Single a         == Single b         = a == b
        Consecutive na a == Consecutive nb b = na == nb && a == b
        _                == _             = False
