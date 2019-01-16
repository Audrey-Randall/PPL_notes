{-@ reflect fnName @-} is how you dump the function body of fnName into the type checker
What's a VC? Verification condition

Theorems/proofs:
\begin{code}
sum :: Int -> Int
sum x
    | 0 = 0
    | x = x + sum x-1

{-@ theorem_example :: { sum 3 == 6 } @-}
theorem_example ::
theorem_example = undefined
--Wait, what's undefined again?
\end{code}

Prove sum 2 = 3: sum 2 = 2 + sum 1 = 2 + 1 + sum 0 = 2 + 1 + 0