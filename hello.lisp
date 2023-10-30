(load "~/.quicklisp/setup.lisp")
(ql:quickload "ltk")
(require "ltk")
(in-package :ltk)
(defun hello-1()
  (with-ltk ()
   (let ((b (make-instance 'button 
                           :master nil
                           :text "Press Me"
                           :command (lambda ()
                                      (format t "Hello World!~&")))))
     (pack b))))

(hello-1)
