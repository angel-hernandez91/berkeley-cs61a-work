; Load this file into an interactive session with:
; python3 scheme -load quiz03.scm

(define (map f s)
  (if (null? s) s
    (cons (f (car s)) (map f (cdr s)))))

(define (filter f s)
  (if (null? s) s
    (let ((rest (filter f (cdr s))))
      (if (f (car s)) (cons (car s) rest) rest))))

(define (remove item lst)
      (cond ((null? lst) '() )
            ((eq? (car lst) item) (remove item (cdr lst)))
            ((cons (car lst) (remove item (cdr lst))))
      )
)

(define (empty? s) (null? s))

(define (contains? s v)
      (cond ((empty? s) false)
            ((> (car s) v) false)
            ((= (car s) v) true)
            (else (contains? (cdr s) v))
      )
)


(define (no-repeats s)
    (cond ((null? s) s )
          ((contains? (cdr s) (car s)) (cons (car s) (no-repeats (remove (car s) (cdr s)))))
          (else (cons (car s) (no-repeats (cdr s))))
          )
    )

(define (how-many-dots s)
    (cond ((null? s) 0)
          ((integer? s) 1)
          ((pair? (car s) ) (+ (how-many-dots (car s)) (how-many-dots (cdr s))))
          (else (+ 0 (how-many-dots (cdr s))))
    )
)
