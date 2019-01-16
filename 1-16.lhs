{-@ reflect fnName @-} is how you dump the function body of fnName into the type checker
What's a VC? Verification condition

Theorems/proofs:
\begin{code}
sum :: Int -> Int
sum x
    | 0 = 0
    | x = x + sum x-1

{-@ theorem_example :: { sum 2 == 3 } @-} --wrong type signature, not sure what to put instead 
theorem_example :: _
theorem_example = undefined
-- Wait, what's undefined again?

{-@ theorem_ex1 :: { sum 2 == 3 } @-}
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

More proofs:
\begin{code}
{-@ theorem_2 :: { v: _ | sum 3 == 6 } @-}
theorem_2 :: _
theorem_2 = sum 3
        === 3 + sum 2
        === 3 + 2 + sum 1
        === 3 + 2 + 1 + sum 0
        === 6
-- ^^ that's inconvenient b/c it repeats stuff. so we make a because combinator
--This below won't work because it doesn't know sum 2 is 3:
theorem_3 = sum 3 
        === 3 + sum 2
        === 6

theorem_4 = sum 3
        === 3 + sum 2
            ? theorem_ex1 ()
        === 6
\end{code}

Because combinator:
(?) :: a -> b -> a
x ? coz = x

to write a proof with FORALL, example FORALL n. n <= sum n 
{-@ n:Int -> { | n <= sum n} @-}