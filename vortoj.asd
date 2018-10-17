(asdf:defsystem :vortoj
    :depends-on (#:sb-fastcgi)
    :serial t
    :components ((:file "package")
		 (:module "src"
			  :components ((:file "language")
				       (:file "vortoj")))))
