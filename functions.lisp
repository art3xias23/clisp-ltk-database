(defpackage :functions
  (:use :cl))

(defvar *db* nil)

(defun make-cd (title artist rating ripped)
  (list :title title :artist artist :rating rating :ripped ripped))

(defun add-cd-to-db (cd)
  (push cd *db*))

(defun show-db()
    (dolist (cd *db*)
      (format t "~{~a:~10t~a~%~}~%" cd)))


