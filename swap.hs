type Stack w = [w]

-- Focus is first element of list,
-- rest follow clockwise

swap :: Stack w -> Stack w
-- Swap topmost pair
swap [] = []
swap (w : []) = w : []
swap (w1 : w2 : ws ) = w2 : w1 : ws
