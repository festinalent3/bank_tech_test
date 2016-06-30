[![Build Status](https://travis-ci.org/festinalent3/bank_tech_test.svg?branch=master)](https://travis-ci.org/festinalent3/bank_tech_test)
[![Coverage Status](https://coveralls.io/repos/github/festinalent3/bank_tech_test/badge.svg?branch=master)](https://coveralls.io/github/festinalent3/bank_tech_test?branch=master)
# Bank tech test


This is a small repo containing a solution to [this](https://github.com/makersacademy/bank_tech_test) formidable tech test.

There is also a **WIP** [rails](https://github.com/festinalent3/bank_tech_test_rails_edition) edition as I thought it would be fun to make it a web application.

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
14/01/2012  ||             ||   500.00   ||   2500.00
13/01/2012  ||   2000.00   ||            ||   3000.00
10/01/2012  ||   1000.00   ||            ||   1000.00
```

(Output dates as specified in the tests (rspec))

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

# Get an account statement, need to instantiate Printer using the class method create the first time
$ Printer.create(account)
$ Printer.instance.statement

```
