(defun var? (x)
  (and (symbolp x) 
       (eql (char (symbol-name x) 0) #\?)))

(defmethod has-vars ((lst t))
  (when (var? lst)
    (list lst)
  )
)

(defmethod has-vars ((lst cons))
  (union (has-vars (car lst)) (has-vars (cdr lst)))
)

(print (has-vars '(asdf ?a 234 ?b nil ?b)))

(print (has-vars '(AND (PARENT ?x ?y) (male ?x))))
