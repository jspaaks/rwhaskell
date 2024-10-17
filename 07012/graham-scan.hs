module GrahamScan where

    import Prelude hiding (Left, Right)
    import Data.List (sortBy, groupBy, nub)

    -- Cartesian coordinates x y
    data Ctn = Ctn Double Double
               deriving (Show, Eq)

    data Triplet = Triplet Ctn Angle Distance
                   deriving (Show)

    -- Turn direction
    data Turn = Left
              | Right
              | None
                deriving (Show, Eq)

    type Angle = Double
    type Distance = Double


    directions :: [Ctn] -> [Turn]
    directions xs = [ direction a b c | (a,b,c) <- zip3 as bs cs ] where

        direction :: Ctn -> Ctn -> Ctn -> Turn
        direction a b c
            | crossproduct a b c == 0 = None
            | crossproduct a b c > 0  = Left
            | crossproduct a b c < 0  = Right
            where
                crossproduct (Ctn xa ya)
                             (Ctn xb yb)
                             (Ctn xc yc) =
                             (xb - xa) * (yc - ya) - (yb - ya) * (xc - xa)
        as = xs
        bs = drop 1 $ xs
        cs = drop 2 $ xs

    -- calculate the convex hull of a set of point using to graham's scan method
    hull xs = wrap $ f $ sorted $ nub xs where

        f :: [Ctn] -> [Ctn]
        f retained
            | all (== Left) $ directions $ wrap retained = retained
            | otherwise                                  = f retained'
                where
                    retained' = snd $ unzip (pre <> drop 1 suf)
                    (pre, suf) = break (\(d,_) -> d /= Left) (zip ds retained)
                    ds = directions $ wrap retained

        wrap xs = [ctn0] <> xs <> [ctn0]
        ctn0 = pivot $ nub $ xs

    -- determine the leftmost of the points whose y value is minimal
    pivot :: [Ctn] -> Ctn
    pivot = head . sortBy f where

        f :: Ctn -> Ctn -> Ordering
        f (Ctn xa ya) (Ctn xb yb)
            | ya < yb             = LT
            | ya == yb && xa < xb = LT
            | ya > yb             = GT
            | ya == yb && xa > xb = GT
            | otherwise           = EQ


    -- given an unsorted list of cartesian coordinates, sorts the list by increasing
    -- angle relative to the reference point ctn0, discarding points that are
    -- shadowed by other points on the same ray that are further away from the
    -- reference point ctn0. Note the reference point itself is also discarded.
    sorted :: [Ctn] -> [Ctn]
    sorted ctns = removeProps $ furthest $ appendProps ctn0 ctns where

        -- deternmine the leftmost of the points of minimal y
        ctn0 = pivot ctns

        -- append properties needed for scan algorithm to each point
        appendProps :: Ctn -> [Ctn] -> [Triplet]
        appendProps ctn0 = triplets where
            triplets = map g . filter f where
                f = \ctn -> ctn /= ctn0
                g = \ctn -> Triplet ctn (calcangle ctn ctn0) (calcdistsq ctn ctn0) where

                    calcangle :: Ctn -> Ctn -> Angle
                    calcangle (Ctn x y) (Ctn x0 y0)
                        | x < x0    = angle + 180
                        | otherwise = angle
                        where
                            angle = degrees $ atan $ (y - y0) / (x - x0)

                    calcdistsq :: Ctn -> Ctn -> Distance
                    calcdistsq (Ctn x y) (Ctn x0 y0) = (x - x0)^2 + (y - y0)^2

                    degrees :: Double -> Angle
                    degrees = (*) (360 / 2 / pi)

        -- retain only the furthest point on each ray
        furthest :: [Triplet] -> [Triplet]
        furthest = map last . map sortByDistance . groupByAngle . sortByAngle where

            -- sort a list of triplets by angle
            sortByAngle :: [Triplet] -> [Triplet]
            sortByAngle = sortBy f where
                f = \a b -> compare (angle a) (angle b)

            -- group a list of triplets by angle
            groupByAngle :: [Triplet] -> [[Triplet]]
            groupByAngle = groupBy f where
                f = \a b -> angle a == angle b where

            -- getter for angle from Triplet
            angle :: Triplet -> Angle
            angle (Triplet _ a _) = a

            -- sort the triplets by distance
            sortByDistance :: [Triplet] -> [Triplet]
            sortByDistance = sortBy f where
                f = \a b -> compare (distance a) (distance b) where

                    -- getter for distance from Triplet
                    distance :: Triplet -> Distance
                    distance (Triplet _ _ d) = d

        -- remove properties that were needed for scan algorithm from each point
        removeProps = map (\(Triplet ctn _ _) -> ctn)

