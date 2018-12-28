;==========================================================
;   FINDDAT2.LSP
;   Find a data list in file "fn" with a given first element "di"
;
;   If succeed, returns the data list, otherwize, returns a nil.
;
(defun finddat2(fn di di2 / fp dat d d2 char)
  (setq fp (open fn "r"))
  (while (and (setq dat (read-line fp))
              ;--- test if a comment card
              (setq char (substr dat 1 1))
              (if (or (= char ";") (= dat ""))
                  t
                  (progn
                     (setq dat (read dat) d (car dat) d2 (nth 1 dat))
                     (/= d di)
		     (/= d2 di2)
                  )
              );end-if
         );end-while-test
  );end-while
  (close fp)
  (if (and (= d di) (= d2 di2))
      dat        ;if-then
      (progn     ;if-else
       (princ "\nData list with value - ")(princ di)
       (princ " not found in file - ") (princ fn)
       ;(pexit)
       nil
      )
  );end-if
);end-finddat()