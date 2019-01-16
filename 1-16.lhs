{-@ reflect fnName @-} is how you dump the function body of fnName into the type checker
What's a VC? Verification condition

Theorems/proofs:
\begin{code}
sum :: Int -> Int
sum x
    | 0 = 0
    | x = x + sum x-1

{-@ theorem_example :: { sum 2 == 3 } @-}
theorem_example :: _
theorem_example = undefined
-- Wait, what's undefined again?
theorem_ex1 = sum 2
            === 2 + sum 1
            === 2 + 1 + sum 0
            === 3
\end{code}

Prove sum 2 = 3: sum 2 = 2 + sum 1 = 2 + 1 + sum 0 = 2 + 1 + 0

Equation combinator: ===
\begin{code}
(===) :: x:a -> y:{a | y == x} -> {v:a | v == x && v == y}
x === y = y
\end{code}

To make a type "(=*=)" (the equality type, same as ==):
\begin{code}
-- This won't work because you can't chain output? What??
(=*=) :: (Eq a) a -> a -> Bool
(=*=) x y = x == y
\end{code}

<=> means if and only if