# stock-report
---
Small command-line utility script that displays, in a table, a portfolio's P&L using Yahoo finance quotes.

## Installation
Clone GIT repository in a directory visible to `quicklisp`
```shell
git clone https://github.com/pmechai/stock-report
```
Load and run the script
```lisp
(quicklisp:quickload "stock-report")
(stock-report:report)
```

## Configuration
The script relies on a JSON file in:  
`$HOME/.config/portfolio.json`  
The file should contain a list of objects with the following attributes:
* *SYMBOL* The symbol (RIC for instance)
* *PRICE* The price (positive if buy, negative if sell)
* *QTY* The quantity

## Dependencies
> alexandria  
> cl-yahoo-finance  
> cl-ascii-table  

