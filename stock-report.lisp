;;;; stock-report.lisp

(in-package #:stock-report)

;;; constants
(define-constant +portfolio-pathname+
    (merge-pathnames (make-pathname :name "portfolio.json"
				    :directory '(:relative ".config"))
		     (user-homedir-pathname)))

(define-constant +column-names+
    '("Symbol" "Name" "Qty" "Last" "Position" "P&L"))

;;; helpers
(defun load-portfolio ()
  (when (probe-file +portfolio-pathname+)
    (with-open-file (in +portfolio-pathname+ :direction :input)
      (yason:parse in))))

(defun compute-line (table line)
  (let* ((sym (gethash "SYMBOL" line))
	 (q (car (read-current-data sym)))
	 (name (gethash :name q))
	 (last (gethash :close q))
	 (qty (gethash "QTY" line))
	 (price (gethash "PRICE" line))
	 (pos (* qty last))
	 (pnl (* qty (- last price))))
    (add-row table (list sym name qty last pos pnl))))

(defun report ()
  (loop
     with table = (make-table +column-names+)
     for line in (load-portfolio)
     do	 (compute-line table line)
     finally (display table)))

    

