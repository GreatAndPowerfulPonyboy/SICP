;;; Helper procedure to convert types to string
(define (any->string x)
  (cond ((string? x) x)
        ((symbol? x) (symbol->string x))
        ((number? x) (number->string x))
        (else "")))

;;; Word Constructors and Predicates
(define (word . args)
  (string->symbol (apply string-append (map any->string args))))

(define (word? x)
  (and (not (pair? x)) (not (null? x))))

;;; Sentence Constructors and Predicates
(define (sentence . args)
  args)

(define se sentence)

(define (sentence? x)
  (list? x))

;;; Emptiness Check
(define (empty? x)
  (if (word? x)
      (= (string-length (any->string x)) 0)
      (null? x)))

;;; Selectors for Words and Sentences
(define (first x)
  (if (word? x)
      (string->symbol (substring (any->string x) 0 1))
      (car x)))

(define (butfirst x)
  (if (word? x)
      (string->symbol (substring (any->string x) 1 (string-length (any->string x))))
      (cdr x)))

(define bf butfirst)

(define (last x)
  (if (word? x)
      (let* ((s (any->string x))
             (len (string-length s)))
        (string->symbol (substring s (- len 1) len)))
      (car (reverse x))))

(define (butlast x)
  (if (word? x)
      (let* ((s (any->string x))
             (len (string-length s)))
        (string->symbol (substring s 0 (- len 1))))
      (reverse (cdr (reverse x)))))

(define bl butlast)

;;; Member Function
(define (member? item seq)
  (cond ((null? seq) #f)
        ((equal? item (car seq)) #t)
        (else (member? item (cdr seq)))))
