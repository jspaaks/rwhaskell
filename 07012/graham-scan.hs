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
                deriving (Show, Eq)

    data Stack = Stack [Ctn] deriving (Show)

    type Angle = Double
    type Distance = Double


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


    directions :: [Ctn] -> [Turn]
    directions xs = [ direction a b c | (a,b,c) <- zip3 as bs cs ] where
        as = xs
        bs = drop 1 $ xs
        cs = drop 2 $ xs


    -- retain only the furthest point on each ray
    furthest :: [Triplet] -> [Triplet]
    furthest = map last . map sortByDistance . groupByAngle . sortByAngle where

        -- sort the triplets by distance
        sortByDistance :: [Triplet] -> [Triplet]
        sortByDistance = sortBy f where
            f = \a b -> compare (distance a) (distance b) where

        -- group a list of triplets by angle
        groupByAngle :: [Triplet] -> [[Triplet]]
        groupByAngle = groupBy f where
            f = \a b -> angle a == angle b

        -- sort a list of triplets by angle
        sortByAngle :: [Triplet] -> [Triplet]
        sortByAngle = sortBy f where
            f = \a b -> compare (angle a) (angle b)

        -- getter for angle from Triplet
        angle :: Triplet -> Angle
        angle (Triplet _ a _) = a

        -- getter for distance from Triplet
        distance :: Triplet -> Distance
        distance (Triplet _ _ d) = d

    null :: [Ctn] -> [Ctn]
    hull = undefined -- function defined below doesnt quite work

    -- hull :: [Ctn] -> [Ctn]
    -- hull candidates = unstack $ helper candidates (Stack []) where
    --     helper candidates' (Stack xs)
    --         | null candidates'        = Stack []
    --         | length xs <= 2          = push c $ helper (tail candidates') (Stack xs)
    --         | direction a b c == Left = push c $ helper (tail candidates') (Stack xs)
    --         | otherwise               = pop $ helper candidates' (Stack xs)
    --         where
    --             a = last $ init xs
    --             b = last xs
    --             c = head candidates'


    pop :: Stack -> Stack
    pop (Stack []) = Stack []
    pop (Stack ctns) = Stack (init ctns)


    -- print a list of cartesian coodinates
    printCtns :: [Ctn] -> IO ()
    printCtns ctns = putStr $ "[\n" <> f ctns <> "]\n" where
        f = unlines . map ((<>) ", ") . map show


    -- print a list of triplets
    printTriplets :: [Triplet] -> IO ()
    printTriplets triplets = putStr $ "[\n" <> f triplets <> "]\n" where
        f = unlines . map ((<>) ", ") . map show


    push :: Ctn -> Stack -> Stack
    push ctn (Stack ctns) = Stack (ctns <> [ctn])


    -- given an unsorted list of cartesian coordinates, sorts the list by increasing
    -- angle relative to the reference point ctn0, discarding points that are
    -- shadowed by other points on the same ray that are further away from the
    -- reference point ctn0
    sorted :: [Ctn] -> [Ctn]
    sorted = \ctns -> ctn0 : f ctns where

        ctn0 = startFrom ctns

        f = removeProps . furthest . appendProps ctn0 where
            removeProps = map (\(Triplet ctn _ _) -> ctn)
        
        startFrom :: [Ctn] -> Ctn
        startFrom = head . sortBy f where

            f :: Ctn -> Ctn -> Ordering
            f (Ctn xa ya) (Ctn xb yb)
                | ya < yb             = LT
                | ya == yb && xa < xb = LT
                | ya > yb             = GT
                | ya == yb && xa > xb = GT
                | otherwise           = EQ

    unstack :: Stack -> [Ctn]
    unstack (Stack ctns) = ctns


    -- test data
    ctns =
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

    [a,b,c,d,e,f,g,h] = sorted ctns
