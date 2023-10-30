(defpackage :functions
  (:use :cl)
  (:export :calco))

(in-package :functions)

(defun calco (a b)
      (+ a b))

(defvar *db* nil)

(defun make-cd (title artist rating ripped)
  (list :title title :artist artist :rating rating :ripped ripped))

(defun add-record (cd)
  (push cd *db*))

(defun show-db()
    (dolist (cd *db*)
      (format t "~{~a:~10t~a~%~}~%" cd)))

(defun prompt-read (prompt)
  (format *query-io* "~a: " prompt)
  (force-output *query-io*)
  (read-line *query-io*))

(defun prompt-for-cd ()
  (make-cd
    (prompt-read "Title")
    (prompt-read "Artist")
    (or (parse-integer (prompt-read "Rating") :junk-allowed t) 0)
    (y-or-n-p "Ripped [y/n]")))

(defun add-cds ()
  (loop (add-record (prompt-for-cd))
        (if (not (y-or-n-p "Another? [y/n]: ")) (return))))

(defun save-db (filename)
  (with-open-file (out filename
                       :direction :output
                       :if-exists :supersede)
    (with-standard-io-syntax 
      (print *db* out))))

(defun load-db (filename)
  (with-open-file (in filename)
    (with-standard-io-syntax
      (setf *db* (read in)))))

(defun select-by-artist (artist) 
    (remove-if-not
      #'(lambda (cd) (equal (getf cd :artist) artist)) *db*))

(defun where(&key artist title rating (ripped NIL ripped-p))
    (lambda(record) 
        (if title (string-equal title (getf cd :title)) t) 
        (if artist (string-equal artist (getf cd :artist)) t) 
        (if rating (string-equal rating (getf cd :rating)) t) 
        (if ripped-p (string-equal ripped (getf cd :ripped)) t) 
      *db*))

