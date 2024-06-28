(set-logic LIA)
(define-fun f ((x Int) (y Int)) Int
	(+ (* 2 x) y)
)

(synth-fun df ((x Int) (y Int)) Int
	(
		(Start Int
			(
				(+ Start Start)
				(* Start Start)
				x y 
				0 1
			)
		)
	)
)

(constraint (= (df 1 2) 4)) 
(constraint (= (df 3 4) 10)) 
(constraint (= (df 2 3) 7)) 

(declare-var x Int)
(declare-var y Int) 

(constraint (= (f x y) (df x y)))
(check-synth)