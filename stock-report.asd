;;;; stock-report.asd

(asdf:defsystem #:stock-report
  :description ""
  :author "Philippe Mechai <philippe.mechai@gmail.com>"
  :license "MIT"
  :depends-on (#:alexandria
	       #:yason
	       #:cl-yahoo-finance
               #:cl-ascii-table)
  :serial t
  :components ((:file "package")
               (:file "stock-report")))

