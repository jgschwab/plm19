;;(HAS-VARS '(AND (PARENT ?X ?Y) (MALE ?X))) ==> (?Y ?X)

(defparameter params ())

(defun var? (x)
  (and (symbolp x) 
       (eql (char (symbol-name x) 0) #\?)))

(defun has-vars-rec (lst)
	(mapcar (lambda (x)
		(if (not (atom x)) 
			(has-vars-rec (cdr x))
			(when (var? x) (adjoin x params))
		)
	) lst)
)


(defun has-vars (lst)
	(let vars (has-vars-rec lst))
	(let varsClean ())
	(mapcar (lambda (x)
		(if (x)
			(setf varsClean (adjoin x varsClean))
		)
	)
	vars
	)
)
(print (has-vars '(ang ?123 tdd ?55 ?123)))
