;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname |drawlob drawlom|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;-------------------------------------------------------------------------------
; DRAW FUNCTIONS

; draw-lob: lob -> scene
; Returns a scene with all the bullets from a los 
(define (draw-lob lob)
  (cond 
    [(empty? lob) (empty-scene 500 500)]
    [(cons? lob) (place-image bullet 
                 (sprite-loc (first lob))
                 (sprite-loc (first lob))
                 (draw-lob (rest lob)))]
    ))

(define lob1 (cons (make-sprite 5 5 5 5) empty)) 

(check-expect (draw-lob lob1)
              (place-image bullet
                           (sprite-loc (first lob1))
                           (sprite-loc (first lob1))
                           (draw-lob (rest lob1))))

; draw-lom: lom -> scene
; Returns a scene with all the missiles from a los 
(define (draw-lom lom)
  (cond 
    [(empty? lom) (empty-scene 500 500)]
    [(cons? lom) (place-image missile 
                 (sprite-loc (first lom))
                 (sprite-loc (first lom))
                 (draw-lom (rest lom)))]
    ))

(define lom1 (cons (make-sprite 10 10 5 5) empty)) 

(check-expect (draw-lom lom1)
              (place-image missile
                           (sprite-loc (first lom1))
                           (sprite-loc (first lom1))
                           (draw-lom (rest lom1))))