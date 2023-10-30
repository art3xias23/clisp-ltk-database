(load "functions.lisp")

(defpackage :main
  (:use :cl :functions))

(in-package :main)

(format  t "~a~%" (functions::calco 1 2))
