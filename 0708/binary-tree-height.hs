module BinaryTreeHeight where

    data Tree = Leaf
              | Fork Tree Tree
                deriving (Show)

    binaryTreeHeight :: Tree -> Int
    binaryTreeHeight tree = helper tree 0 where
        helper Leaf height              = height
        helper (Fork left right) height = max a b where
            a = helper left (height + 1)
            b = helper right (height + 1)

