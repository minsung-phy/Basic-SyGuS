; Original Expression: <ast.BinOp object at 0x102b62f20>
; Deobfuscated Expression: [<ast.BinOp object at 0x102b62f20>, <ast.BinOp object at 0x102b62f20>, <ast.BinOp object at 0x102b62f20>, <ast.BinOp object at 0x102b62f20>]
(set-logic LIA)
(define-fun f ((x Int) (y Int)) Int
	BinOp(left=BinOp(left=BinOp(left=Name(id='x', ctx=Load()), op=Mult(), right=Constant(value=3)), op=BitOr(), right=Name(id='y', ctx=Load())), op=Mult(), right=Constant(value=4))
)
(synth-fun df ((x Int) (y Int)) Int
	(
		(Start Int
			(
				BinOp(left=BinOp(left=BinOp(left=Name(id='x', ctx=Load()), op=Mult(), right=Constant(value=3)), op=BitOr(), right=Name(id='y', ctx=Load())), op=Mult(), right=Constant(value=4))
				BinOp(left=BinOp(left=BinOp(left=Name(id='x', ctx=Load()), op=Mult(), right=Constant(value=3)), op=BitOr(), right=Name(id='y', ctx=Load())), op=Mult(), right=Constant(value=4))
				BinOp(left=BinOp(left=BinOp(left=Name(id='x', ctx=Load()), op=Mult(), right=Constant(value=3)), op=BitOr(), right=Name(id='y', ctx=Load())), op=Mult(), right=Constant(value=4))
				BinOp(left=BinOp(left=BinOp(left=Name(id='x', ctx=Load()), op=Mult(), right=Constant(value=3)), op=BitOr(), right=Name(id='y', ctx=Load())), op=Mult(), right=Constant(value=4))
			)
		)
	)
)
(declare-var x Int)
(declare-var y Int)
(constraint (= (f x y) (df x y)))
(check-synth)
