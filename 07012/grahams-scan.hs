module GrahamsScan where
    import Prelude hiding (Left, Right)
    import Data.List (sortBy)

    -- Cartesian coordinates x y
    data Ctn = Ctn Double Double
               deriving (Show)

    -- Turn direction
    data Turn = Left
              | Right
              | None
                deriving (Show)

    -- test data
    points =
        [ Ctn 0 0
        , Ctn 1 0
        , Ctn 1 1
        , Ctn 0 1
        , Ctn (-0.5) (-0.5)
        , Ctn   0.5  (-0.5)
        , Ctn   1.5  (-0.5)
        , Ctn (-0.5)   0.5
        , Ctn   0.5    0.5
        , Ctn   1.5    0.5
        , Ctn (-0.5)   1.5
        , Ctn   0.5    1.5
        , Ctn   1.5    1.5
        ]

    first :: [Ctn] -> Ctn
    first xs = head $ sortBy f xs where
        f (Ctn xa ya) (Ctn xb yb)
            | ya < yb             = LT
            | ya == yb && xa < xb = LT
            | ya > yb             = GT
            | ya == yb && xa > xb = GT
            | otherwise           = EQ

    turn :: Ctn -> Ctn -> Ctn -> Turn
    turn (Ctn xa ya) (Ctn xb yb) (Ctn xc yc)
        | x == 0 = None
        | x > 0  = Left
        | x < 0  = Right
        where x = (xb - xa) * (yc - ya) - (yb - ya) * (xc - xa)
