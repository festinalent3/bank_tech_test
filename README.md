[![Build Status](https://travis-ci.org/festinalent3/bank_tech_test.svg?branch=master)](https://travis-ci.org/festinalent3/bank_tech_test)

# bank_tech_test WIP


This is a small repo containing a solution to [this](https://github.com/makersacademy/bank_tech_test) formidable tech test.

There is also a WIP [rails](https://github.com/festinalent3/bank_tech_test_rails_edition) edition as I thought it would be fun to make it a web application.

### How to install

```
$ git clone git@github.com:festinalent3/bank_tech_test.git
$ bundle

Run tests:
$ rspec

```

### How it works


```
.
├── Gemfile
├── Gemfile.lock
├── README.md
├── coverage
├── lib
│   ├── account.rb
│   ├── printer.rb
│   └── transaction.rb
└── spec
    ├── account_spec.rb
    ├── printer_spec.rb
    ├── spec_helper.rb
    └── transaction_spec.rb
```

The program consists of 3 classes. The account class acts as the interface towards the user, the Transaction class handles and classifies transactions and the Printer class prints account statements like this one:

```
   date     ||   credit    ||   debit    ||   balance
28/06/2016  ||             ||   500.00   ||   2500.00
28/06/2016  ||   2000.00   ||            ||   3000.00
28/06/2016  ||   1000.00   ||            ||   1000.00
```


Some irb examples:

```
$ irb
$ require './lib/account.rb'
$ require './lib/printer.rb'

# create a new account
$ account = Account.new

# deposit some money
$ account.deposit(23.50)

# withdraw some money
$ account.withdraw(17.50)

# Get an account statement
$ printer = Printer.new(account.getHistory, account.getBalance)
$ printer.print_table

# Update the information for the printer
$ printer.update(account.getHistory, account.getBalance)

```
