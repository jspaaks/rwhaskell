module GrahamScan where

    import Prelude hiding (Left, Right)
    import Data.List (sortBy, groupBy)

    -- Cartesian coordinates x y
    data Ctn = Ctn Double Double
               deriving (Show, Eq)

    data Triplet = Triplet Ctn Angle Distance
                   deriving (Show) 

    -- Turn direction
    data Turn = Left
              | Right
              | None
                deriving (Show)

    type Angle = Double
    type Distance = Double

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


    -- getter for angle from Triplet
    angle :: Triplet -> Angle
    angle (Triplet _ a _) = a

    -- getter for distance from Triplet
    distance :: Triplet -> Distance
    distance (Triplet _ _ d) = d

    -- append properties needed for scan algorithm to each point
    appendProps :: Ctn -> [Ctn] -> [Triplet]
    appendProps ctn0 = triplets where
        triplets = map g . filter f where
            f = \ctn -> ctn /= ctn0
            g = \ctn -> Triplet ctn (calcangle ctn ctn0) (calcdistsq ctn ctn0) where

                calcangle :: Ctn -> Ctn -> Angle
                calcangle (Ctn x y) (Ctn x0 y0) = degrees $ atan $ (y - y0) / (x - x0)

                calcdistsq :: Ctn -> Ctn -> Distance
                calcdistsq (Ctn x y) (Ctn x0 y0) = (x - x0)^2 + (y - y0)^2

                degrees :: Double -> Angle
                degrees = (*) (360 / 2 / pi)

    -- retain only the furthest point on each ray
    furthest :: [Triplet] -> [Triplet]
    furthest = map last . map sortByDistance . groupByAngle . sortByAngle where

        -- sort the triplets by distance
        sortByDistance :: [Triplet] -> [Triplet]
        sortByDistance = sortBy f where
            f = \a b -> compare (distance a) (distance b)

        -- group a list of triplets by angle
        groupByAngle :: [Triplet] -> [[Triplet]]
        groupByAngle = groupBy f where
            f = \a b -> angle a == angle b

        sortByAngle :: [Triplet] -> [Triplet]
        sortByAngle = sortBy f where
            f = \a b -> compare (angle a) (angle b)


    -- print the list of triplets
    myprint :: [Triplet] -> IO ()
    myprint triplets = putStr $ "[\n" <> f triplets <> "]\n" where
        f = unlines . map ((<>) ", ") . map show


    firstturn :: [Ctn] -> Turn
    firstturn (a : b : c : _rest)
        | x == 0 = None
        | x > 0  = Left
        | x < 0  = Right
        where
            x = crossproduct a b c

            crossproduct :: Ctn -> Ctn -> Ctn -> Double
            crossproduct (Ctn xa ya)
                         (Ctn xb yb)
                         (Ctn xc yc) =
                         (xb - xa) * (yc - ya) - (yb - ya) * (xc - xa)

    startFrom :: [Ctn] -> Ctn
    startFrom = head . sortBy f where

        f :: Ctn -> Ctn -> Ordering
        f (Ctn xa ya) (Ctn xb yb)
            | ya < yb             = LT
            | ya == yb && xa < xb = LT
            | ya > yb             = GT
            | ya == yb && xa > xb = GT
            | otherwise           = EQ


    hull :: [Ctn] -> [Ctn]
    hull ctns = helper ctns' [] where
        helper retaineds ignoreds = undefined
        ctns' = ctn0 : (f ctns)
        ctn0 = startFrom ctns
        f = removeProps . furthest . appendProps ctn0
        removeProps = map (\(Triplet ctn _ _) -> ctn)

