module GrahamsScan where
    import Prelude hiding (Left, Right)

    -- Cartesian coordinates x y
    data Ctn = Ctn Double Double
               deriving (Show)

    -- Polar coordinates angle magnitude
    data Plr = Plr Double Double
               deriving (Show)

    -- How much of a turn in degrees
    data Turn = Left Double
              | Right Double
              | None
                deriving (Show)

    polar :: Ctn -> Plr
    polar (Ctn x y) = Plr angle magnitude where
        magnitude = sqrt (x * x + y * y)
        d = degrees $ atan (y / x)
        angle
            | x >= 0          = 90 - d
            | x < 0 && y >= 0 = 270 - d
            | x < 0 && y < 0  = 270 - d

    radians :: Double -> Double
    radians = (*) (2 * pi / 360)

    degrees :: Double -> Double
    degrees = (*) (360 / 2 / pi)

    deadreckon :: [Ctn] -> [Plr]
    deadreckon xs = [polar $ delta a b | (a,b) <- zip as bs] where
        as = take n $ drop 0 $ cycle xs
        bs = take n $ drop 1 $ cycle xs
        n = length xs

    delta :: Ctn -> Ctn -> Ctn
    delta (Ctn xa ya) (Ctn xb yb) = Ctn (xb - xa) (yb - ya)

    pairs :: [Plr] -> [(Plr, Plr)]
    pairs xs = zip as bs where
        as = take n $ drop 0 $ cycle xs
        bs = take n $ drop 1 $ cycle xs
        n = length xs

    -- test data: square, polygons need to be unclosed
    polygon =
        [ Ctn 0 0
        , Ctn 1 0
        , Ctn 1 1
        , Ctn 0 1
        ]

