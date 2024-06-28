(set-logic BV) // 사전 정의된 문법 사용 (SyGuS 문법 명세 Appendix B 참), BV는 BitVector용 문법 / LIA는 Integer Arithmatic 용 문법
(define-fun obfucated (  (x (BitVec 64)) (y (BitVec 64)) ) (BitVec 64)  // 함수 정의 (define-fun 함수이름 ( (변수이름 (변수 타입)) ... ) ) (리턴 타입) ( (함수 내용) )
  (bvand (bvsub x y) (bvadd x y))
)

(synth-fun deobfucated (  (x (BitVec 64)) (y (BitVec 64)) ) (BitVec 64) // 합성 대상 문제 (synth-fun 함수이름 (파라미터) (문법))
  (
    (Start (BitVec 64)
        (
          (bvnot Start)
          (bvxor Start Start)
          (bvand Start Start)
          (bvor Start Start)
          (bvneg Start)
          (bvadd Start Start)
          (bvmul Start Start)
          (bvsub Start Start)
          (bvshl Start Start)
          (bvsdiv Start Start)
          (bvsrem Start Start)
          (bvlshr Start Start)
           x y
           #x0000000000000000 #x0000000000000001 #x0000000000000002 #x0000000000000004 #x0000000000000008 #x0000000200000000 // #x은 비트벡터에만 사용
        )
      )
  )
)

(declare-var x (BitVec 64)) // 임의의 변수가 조건식에 필요한 경우 변수 선언
(declare-var y (BitVec 64))

(constraint (= (obfucated  x y) (deobfucated  x y))) // 합성 대상 함수에 대한 작동 제약
(check-synth) // 합성 요청 (필수)

// 타입 : Int, Bool, BitVec n

// 문법
// (
//   (Start (타입) ( (연산자 (비단말부호/단말부호)) 비단말부호 단말부호 ))
//   (임의비단말부호 - Start와 같음 )
// )
// 제약
// (constraint (< 3 (f 2 3)))
// (constraint (>= 3 (f 2 3)))
// (constraint (= 3 (f 2 3)))