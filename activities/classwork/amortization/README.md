# Amortization tables

## Coding exercise! 

Create a python script named `main.py` with the following options: 

* `annuity`: Calculates the annuity (constant payment) of a loan. 
* `table`: Creates the amortization table. 
* `graph`: Plots the principal/interest as a stacked bar plot.

All options should support the following arguments: 

```text
    --amount : monetary amount of the loan at t=0.
    --interest : interest rate. 
    --n : the number of periods. 
```

Additionally, the "table" option should contain a `--save` argument that saves the table into a csv-file given by the user.

Example: 

```commandline
$ python main.py annuity --amount 18000 --interest 0.0283 --n 6
```

## Tables

Create and save the monthly amortization table for the following loan: 
* Amount: $371,000.00
* Interest rate: 18% annual
* Periods: 20 years
* Filename: `amortization-table-1.csv`

Create and save the monthly amortization table for the following loan: 
* Amount: $275,320.00
* Interest rate: 25% annual
* Periods: 5 years
* Filename: `amortization-table-2.csv`

