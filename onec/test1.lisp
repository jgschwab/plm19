(defun known (a alist)
	(if( not(assoc a alist))
		'nil
		(knownRec a alist)
	)
)

(defun knownRec (a alist)
	(if (cdr(assoc a alist))
		(knownRec (cdr(assoc a alist)) alist)
		a
	)
)

(defvar dict '((x . 1)(y . 2)(2 . 5)))

(print (known 'z dict))
