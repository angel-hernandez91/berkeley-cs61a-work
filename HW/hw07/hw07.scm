(define (cddr s)
  (cdr (cdr s)))

(define (cadr s)
  (car (cdr s) )
)

(define (caddr s)
  (car (cddr s) )
)

(define (sign x)
  (cond ((< x 0) -1)
        ((= x 0) 0)
        ((> x 0) 1)
        )
)

(define (square x) (* x x))

(define (pow b n)
  (cond ( (= n 0) 1)
        ((even? n) (square (pow b (/ n 2))))
        ((odd? n) (* b (pow b (- n 1))))
        )
)

(define (ordered? s)
  (cond ((or (eq? s '() ) (eq? (cdr s) '()) ) #t)
        ((< (car s) (car (cdr s))) (ordered? (cdr s)))
        ((= (car s) (car (cdr s))) (ordered? (cdr s)))
        ((> (car s) (car (cdr s))) #f)
        )
)

(define (nodots s)
    (cond ((null? s) s)
          ((integer? s) (cons s nil))
          ((pair? (car s)) (cons (nodots (car s)) (nodots (cdr s))))
          (else (cons (car s) (nodots (cdr s))))
    )
)
; Sets as sorted lists

(define (empty? s) (null? s))

(define (contains? s v)
    (cond ((empty? s) false)
          ((> (car s) v) false)
          ((= (car s) v) true)
          (else (contains? (cdr s) v))
    )
)

; Equivalent Python code, for your reference:
;
; def empty(s):
;     return len(s) == 0
;
; def contains(s, v):
;     if empty(s):
;         return False
;     elif s.first > v:
;         return False
;     elif s.first == v:
;         return True
;
(define (add s v)
    (cond ((empty? s) (list v))
          ((contains? s v) s)
          ((< v (car s)) (cons v s))
          (else (cons (car s) (add (cdr s) v)))
          )
)

(define (intersect s t)
    (cond ((or (empty? s) (empty? t) ) nil)
          ( (equal? (car s) (car t)) (cons (car s) (intersect (cdr s) (cdr t)) ) )
          ( (< (car s) (car t)) (intersect (cdr s) t) )
          ( (< (car t) (car s)) (intersect s (cdr t)) )
    )
)

; Equivalent Python code, for your reference:
;
; def intersect(set1, set2):
;     if empty(set1) or empty(set2):
;         return Link.empty
;     else:
;         e1, e2 = set1.first, set2.first
;         if e1 == e2:
;             return Link(e1, intersect(set1.rest, set2.rest))
;         elif e1 < e2:
;             return intersect(set1.rest, set2)
;         elif e2 < e1:
;             return intersect(set1, set2.rest)

(define (union s t)
    (cond ((empty? s) t)
          ((empty? t) s)
          (else (union (add s (car t)) (cdr t)))
  )
)

; Binary search trees

; A data abstraction for binary trees where nil represents the empty tree
(define (tree entry left right) (list entry left right))
(define (entry t) (car t))
(define (left t) (cadr t))
(define (right t) (caddr t))
(define (empty? s) (null? s))
(define (leaf entry) (tree entry nil nil))

(define (in? t v)
    (cond ((empty? t) false)
          ((= (entry t) v) true)
          ((< (entry t) v) (in? (right t) v))
          ((> (entry t) v) (in? (left t) v))
    )
)

; Equivalent Python code, for your reference:
;
; def contains(s, v):
;     if s.is_empty:
;         return False
;     elif s.entry == v:
;         return True
;     elif s.entry < v:
;         return contains(s.right, v)
;     elif s.entry > v:
;         return contains(s.left, v)

(define (as-list t)
    (define (helper t e)
        (cond ((empty? t) e)
              (else (helper (left t) (cons (entry t) (helper (right t) e))))
        )
    )
    (helper t nil)
)
