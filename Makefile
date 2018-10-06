LISP = sbcl
OUTDIR = www/cgi-bin
BINARY = "${OUTDIR}/vortoj.cgi"

build: vortoj.asd
	mkdir -p ${OUTDIR}
	${LISP}	--load $< \
	--eval "(ql:quickload :vortoj)" \
	--eval "(save-lisp-and-die #P\"${BINARY}\" \
                 :toplevel #'vortoj:main \
                 :executable t)"
.PHONY: clean
clean:
	rm ${BINARY}
	rmdir ${OUTDIR}
