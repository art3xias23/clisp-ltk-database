(load "~/.quicklisp/setup.lisp");;; Load the Ltk library
;;; Load the Ltk library
(ql:quickload "ltk")

;;; Import the Ltk package
(use-package :ltk)

;;; Create a function to set up and display the frame
(defun create-and-display-frame ()
  (with-ltk ()
    (let* ((frame (make-instance 'frame :text "LispTk Frame")
                (button (make-instance 'button
                                       :master frame
                                       :text "Click Me"
                                       :command (lambda ()
                                                  (setf (text frame) "Button Clicked!"))))
                (label (make-instance 'label
                                                                              :master frame
                                                                              :text "Hello, Ltk!")))
           (pack button)
           (pack label)))))

;;; Call the function to create and display the frame
(create-and-display-frame)

