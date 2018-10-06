(in-package :vortoj)

(defun main ()
  "Generate some words"
  (format t "Content-Type: text/plain~%~%")
  (format t "~A~%" (generate-word default-lang (+ 2 (random 3)))))
