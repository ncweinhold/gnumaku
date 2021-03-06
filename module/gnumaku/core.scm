;; Core C library plus any other useful miscellaneous procedures.

(define-module (gnumaku core)
  #:export (repeat))

(load-extension "./gnumaku" "gmk_init")

(define (repeat times proc)
  "Do something a bunch of times."
  (do ((i 1 (1+ i)))
       ((> i times))
    (proc i)))
