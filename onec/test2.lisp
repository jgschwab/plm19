;;(HAS-VARS '(AND (PARENT ?X ?Y) (MALE ?X))) ==> (?Y ?X)

(defvar params ())

(defun has-vars (lst)
	(mapcar '#(lambda (x)
		(if (not (eql cdr(x) nil))
			(has-vars (cdr(x)))
			(if #| the first character in x is '?' |#)
				(union params (x))
				nil
		)
	)