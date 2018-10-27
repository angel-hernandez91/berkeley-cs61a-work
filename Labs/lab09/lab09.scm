(define (cube x)
  (* x x x )
)

(define (over-or-under x y)
    (if (= x y)
        0
        (if (< x y)
            -1
            1 )
        )
    )

(define (make-adder num)
  (begin (define (adder x)
    (+ x num)) adder)
    )
; alternative with lambda (l:w
; ambda (x) (+ x num))
(define structure
    (cons (cons 1 nil) (cons 2 (cons (cons 3 4) (cons 5 nil))))
)

(define (remove item lst)
    (cond ((null? lst) '() )
          ((eq? (car lst) item) (remove item (cdr lst)))
          ((cons (car lst) (remove item (cdr lst)))))
    )
