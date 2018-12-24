;AutoCad Computer
(defun c:ac (/ ip r1 r2)
  (graphscr) (command "osnap" "none")
  (setq ip '(0 0 0)
	r1 10
	r2 50
  )
  (command "ucs" "w")
  (drawScreen ip r1 r2)
  (drawKB ip)
  (drawCP ip)
  (command "zoom" "e")(command "zoom" "0.5x")
  (princ)
)
;=======================================
(defun drawScreen (ip r1 r2 / p1 p2 p3 e0 e1 e2)
  (command "circle" ip r1) (command "extrude" (entlast) "" 20 "")
  (command "circle" ip r2) (command "extrude" (entlast) "" 2 "")
  (command "ucs" "O" '(0 0 20))
  (command "rectangle" '(-100 -10) '(100 10)) (command "extrude" (entlast) "" 100 "") (setq e0 (entlast))
  (setq p1 '(-100 -8)
	p2 '(100 -8)
	p3 '(-100 -8 20)
  )
  (command "ucs" "3p" p1 p2 p3)
  (command "rectangle" '(10 10) '(190 90)) (command "extrude" (entlast) "" 10 "") (setq e1 (entlast))
  (command "subtract" e0 "" e1 "") (setq e2 (entlast))
;;;  (setq ed (entget e2)
;;;	data (list (cons 62 0))
;;;	ed (append data ed))
;;;  (princ ed);(subst (cons 62 0) (assoc 62 ed) ed)
)
;==========================================
(defun drawKB (ip / p1)
  (command "ucs" "W")
  (command "rectangle" '(-125 -150) '(125 -70)) (command "extrude" (entlast) "" 5 "")
  (setq p1 '(-120 -75)
 	p2 (rpoint p1 10 -10)
	i 0
  )
  (repeat 97
    (setq i (+ 1 i))
    
    ; change line condition
    (cond ((= i 21)
	   (setq p2 (rpoint p2 -190 -15))
	  )
	  ((or (= i 57)(= i 39)(= i 85))
	   (setq p2 (rpoint p2 -190 -10))
	  )
	  ((= i 70)
	   (setq p2 (rpoint p2 -150 -10))
	  )
    )
 
    ; change size condtion
    (cond ((= i 34)
	   (setq p1 (polar p2 (/ pi 2) 10)
	      	 p2 (rpoint p1 20 -10)
    	   )
	  )

	  ((or (= i 69) (= i 70))
	   (setq p1 (polar p2 (/ pi 2) 10)
	      	 p2 (rpoint p1 22.5 -10)
    	   )
	  )

	  ((= i 81)
	   (setq p1 (polar p2 (/ pi 2) 10)
	      	 p2 (rpoint p1 27.5 -10)
    	   )
	  )

	  ((or (= i 39)(= i 52)(= i 86)(= i 93))
	   (setq p1 (polar p2 (/ pi 2) 10)
	      	 p2 (rpoint p1 15 -10)
    	   )
	  )

	  ((or (= i 87)(= i 88)(= i 90)(= i 91)(= i 92))
	   (setq p1 (polar p2 (/ pi 2) 10)
	      	 p2 (rpoint p1 12.5 -10)
    	   )
	  )

	  ((= i 89)
	   (setq p1 (polar p2 (/ pi 2) 10)
	      	 p2 (rpoint p1 57.5 -10)
    	   )
	  )
	  
	  ((= i 57)
	   (setq p1 (polar p2 (/ pi 2) 10)
	      	 p2 (rpoint p1 17.5 -10)
    	   )
	  )	  
	  
	  ((or (= i 7) (= i 12))
	   (setq p1 (polar p2 (/ pi 2) 10)
	         p2 (rpoint p1 5 -10)
    	   )
	  )
	  
      (t 
      (setq p1 (polar p2 (/ pi 2) 10)
	        p2 (rpoint p1 10 -10)
    	  )
	  )
      )

    ;draw key
    (if (and (/= i 2)(/= i 7)(/= i 12)(/= i 17)(/= i 35)(/= i 53)(/= i 82)(/= i 83)(/= i 85)(/= i 94))
      (progn
		(cond ((= i 1)
			   (setq str1 "esc"
			   		 str2 ""
			   )
			  )

			  (t
			   (setq str1 "F"
			   		 str2 (itoa (- i 2))
			   )
			  )
		)
    	(command "rectangle" p1 p2)(command "extrude" (entlast) "" 7 "")
	    (command "text" (rpoint3d p1 0 -6.5 7) "3" "0" (strcat str1 str2) "")
	  )
    )
  )
)
  
;==========================================
(defun drawCP (ip / )
  (command "rectangle" '(150 -70) '(220 130)) (command "extrude" (entlast) "" 100 "")
)
