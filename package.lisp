;;;; package.lisp

(defpackage #:stock-report
  (:use #:cl #:alexandria #:cl-yahoo-finance #:ascii-table)
  (:export #:report))

