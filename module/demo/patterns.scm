(define-module (demo patterns)
  #:use-module (oop goops)
  #:use-module (gnumaku generics)
  #:use-module (gnumaku core)
  #:use-module (gnumaku primitives)
  #:use-module (gnumaku coroutine)
  #:use-module (demo actor)
  #:export (test-pattern-1 spiral-1))

(define (test-pattern-1 actor)
  (let ((x (get-x actor))
        (y (get-y actor)))
    (coroutine
     (when (bullet-system actor)
       (emit-bullet (bullet-system actor) (+ x -100 (random 200)) (+ y 50)
                    0 90 150 0 'small-diamond))
     (wait actor 3)
     (test-pattern-1 actor))))

(define (spiral-1 actor)
  (coroutine
   (let loop ((rotate 0))
     (let ((x (x actor))
           (y (y actor)))
       (when (bullet-system actor)
         (emit-circle (bullet-system actor) x y 24 10 rotate 100 10 10 'small-diamond))
       (wait actor 4)
       (loop (+ rotate (/ 360 40)))))))