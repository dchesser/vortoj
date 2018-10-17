(in-package :vortoj)

(defparameter *fastcgi-port* 9000)
(defparameter *fastcgi-address* "0.0.0.0")

(setf *random-state* (make-random-state t))
(sb-fastcgi:load-libfcgi "/usr/lib/libfcgi.so.0.0.0")

(defmacro with-fcgi-puts (req &body body)
  `(flet ((puts (fmt &rest args)
	    (sb-fastcgi:fcgx-puts ,req (apply #'format nil fmt args))))
     ,@body))

(defun vortoj (request)
  "Generate some words"
  (with-fcgi-puts request
    (puts "Content-type: text/plain~%~%")
    (puts "~A~%" (generate-word default-lang (+ 2 (random 3))))))

(defun main ()
  (sb-fastcgi:socket-server
   #'vortoj :port *fastcgi-port* :inet-addr *fastcgi-address*))
