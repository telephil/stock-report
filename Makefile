TARGET=stock-report
SYSTEM=stock-report
SOURCES="stock-report.lisp package.lisp"

all: ${TARGET}

${TARGET}: ${SOURCES}
	buildapp --output ${TARGET} --load ${SYSTEM} --eval "(defun main (args) (declare (ignore args)) (stock-report:report))" --entry main

clean:
	rm -f ${TARGET}

install: ${TARGET}
	cp ${TARGET} ${HOME}/bin
