data Color = Red | Black deriving Show
data Tree x = Empty | Node Color (Tree x) x (Tree x) deriving Show


empty :: Tree a
empty = Empty

insert :: Ord a => a -> Tree a -> Tree a
insert x s = makeBlack $ place s
  where place Empty = Node Red Empty x Empty
        place (Node c left val right)
	      | x < val = balance c (place left) val right
		  | x > val = balance c left val (place right)
		  | x == val = Node c left val right
        makeBlack (Node _ left val right) = Node Black left val right



height Empty = 0
height (Node _ left val right) = 1 + max(height left)(height right)

--balance (Node Black (Node Red a x (Node Red b y c)) z d) = Node Red (Node Black a x b) y (Node Black c z d)
--balance Tree = Tree

balance :: Color -> Tree a -> a -> Tree a -> Tree a
balance Black (Node Red (Node Red left val right) y c) z d = Node Red (Node Black left val right) y (Node Black c z d)
balance Black (Node Red left val (Node Red right y c)) z d = Node Red (Node Black left val right) y (Node Black c z d)
balance Black left val (Node Red (Node Red right y c) z d) = Node Red (Node Black left val right) y (Node Black c z d)
balance Black left val (Node Red right y (Node Red c z d)) = Node Red (Node Black left val right) y (Node Black c z d)
balance c left val right = Node c left val right

balTree :: Tree a -> Tree a
balTree (Node c left val right) = balance c left val right

leftBalance :: Tree a -> Tree a
leftBalance (Node Black (Node Red n1 x n2) y n3) = Node Red (Node Black n1 x n2) y n3
leftBalance (Node Black n1 y (Node Black n2 z n3)) = balTree (Node Black n1 y (Node Red n2 z n3))
leftBalance (Node Black n1 y (Node Red (Node Black n2 u n3) z n4@(Node Black left val right))) = Node Red (Node Black n1 y n2) u (balTree (Node Black n3 z (Node Red left val right)))

rightBalance :: Tree a -> Tree a
rightBalance (Node Black n1 y (Node Red n2 x n3)) = Node Red n1 y (Node Black n2 x n3)
rightBalance (Node Black (Node Black n1 z n2) y n3) = balTree (Node Black (Node Red n1 z n2) y n3)
rightBalance (Node Black (Node Red n1@(Node Black left val right) z (Node Black n2 u n3)) y n4) = Node Red (balTree (Node Black (Node Red left val right) z n2)) u (Node Black n3 y n4)

