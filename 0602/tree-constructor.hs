module TreeConstructor where
    data Tree a = Node a (Maybe (Tree a, Tree a)) 
                  deriving (Show)
