(defparameter *db*
  '((:name "Koce" :age 30)(:name "Tedo" :age 23)))

(defun select-by-name (name)
  (remove-if-not (lambda(record) (string-equal (getf record :name) name)) *db*))

(defun select (selector-fn)
  (remove-if-not  selector-fn *db*))

(defun where (&key name age)
  #'(lambda (record)
     (and
       (if name (equal (getf record :name) name) t)
       (if age (equal (getf record :age) age) t))))

(print *db*)

(print (funcall (where :name "Koce") *db*))

(defun update(where-fn &key name age)
    (setf *db*
          (mapcar 
            (lambda (record)
              (when (funcall where-fn record)
                (if name (setf (getf record :name) name))
                (if age (setf (getf record :age) age)) record))
           *db*)))

(print (update (where :name "Koce") :name "Boce"))

