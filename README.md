# Makers Academy Week 10 Challenge: Bank Tech Test

This week's challenge was an individual project which focuses on code quality, TDD, and OOP principles.

I was given the following specifications: (copied from https://github.com/makersacademy/course/blob/master/individual_challenges/bank_tech_test.md)

## Specification

### Requirements

- You should be able to interact with your code via a REPL like IRB or the JavaScript console. (You don't need to implement a command line interface that takes input from STDIN.)
- Deposits, withdrawal.
- Account statement (date, amount, balance) printing.
- Data can be kept in memory (it doesn't need to be stored to a database or anything).

### Acceptance criteria

**Given** a client makes a deposit of 1000 on 10-01-2012  
**And** a deposit of 2000 on 13-01-2012  
**And** a withdrawal of 500 on 14-01-2012  
**When** she prints her bank statement  
**Then** she would see

```
date || credit || debit || balance
14/01/2012 || || 500.00 || 2500.00
13/01/2012 || 2000.00 || || 3000.00
10/01/2012 || 1000.00 || || 1000.00
```

## How I approached the challenge

I started by creating a domain model (in `planning.md`); I then developed a BankAccount class using TDD, whose class instances represent a bank account. Its main features:

- Users can deposit money using the `#deposit` method and withdraw money using the `#withdraw` method
- If a user attempts to withdraw or deposit a negative amount or zero, an error will be raised
- Users can call the method `#print_statement` to view a simple statement of their transaction history in reverse chronological order, including dates, amount in credit or debit, and balance at the time, for each transaction, with appropriate column headings

### How to use and run tests

1. Clone the repo locally
2. In the repo folder, run `bundle install`
3. Start up an REPL such as `irb` or `pry`
4. Require the code file by typing `require './lib/bank_account'`
5. Create an instance of the BankAccount class and play around using the `deposit`, `withdraw`, and `print_statement` methods on the instance
6. To run the unit tests, quit the REPL and run `rspec`

#### Basic demo in IRB:

```
3.0.0 :001 > require './lib/bank_account'
 => true
3.0.0 :002 > account = BankAccount.new
 => #<BankAccount:0x00007f7f73869940 @balance=0, @transactions=[]>
3.0.0 :003 > account.deposit(-500)
Traceback (most recent call last):
        [...]makers-bank-tech-test/lib/bank_account.rb:16:in `deposit'
RuntimeError (Deposit amount must be greater than 0)
3.0.0 :004 > account.deposit(300)
 => "You've successfully deposited 300"
3.0.0 :005 > account.print_statement
date || credit || debit || balance
05/05/2021 || 300.00 || || 300.00 => nil
3.0.0 :006 > account.withdraw(0)
Traceback (most recent call last):
        [...]makers-bank-tech-test/lib/bank_account.rb:24:in `withdraw'
RuntimeError (Withdrawal amount must be greater than 0)
3.0.0 :007 > account.withdraw(50)
 => "You've successfully withdrawn 50"
3.0.0 :008 > account.print_statement
date || credit || debit || balance
05/05/2021 || || 50.00 || 250.00
05/05/2021 || 300.00 || || 300.00 => nil
```
