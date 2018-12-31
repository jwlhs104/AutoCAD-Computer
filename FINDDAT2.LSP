;==========================================================
;   FINDDAT2.LSP
;   Find a data list in file "fn" with a given first element "di"
;
;   If succeed, returns the data list, otherwize, returns a nil.
;
(defun finddat2 (fn xi yi / fp dat x1 x2 y1 y2 char)
  (setq fp (open fn "r"))
  (while (and (setq dat (read-line fp))
              ;--- test if a comment card
              (setq char (substr dat 1 1))
              (if (or (= char ";") (= dat ""))
                  t
                  (progn
                     (setq dat (read dat) x1 (nth 0 dat) x2 (nth 1 dat) y1(nth 2 dat)
					 	   y2 (nth 3 dat)
					 )
             		 (or (< xi x1) (> xi x2) (> yi y1) (< yi y2))
                  )
              );end-if
         );end-while-test
  );end-while
  (close fp)
  (if (and (>= xi x1) (<= xi x2) (<= yi y1) (>= yi y2))
      dat        ;if-then
      (progn     ;if-else
       (princ "\nData list with value - ")(princ "")
       (princ " not found in file - ") (princ fn)
       ;(pexit)
       nil
      )
  );end-if
);end-finddat()
