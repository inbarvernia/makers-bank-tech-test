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
- For the purpose of the exercise (and to be able to test the specific acceptance criteria given), I wrote the `#withdraw` and `#deposit` methods so that they can optionally take a date as an argument (defaulting to the current date if none is specified), so that I could test for transactions made on specific days; however, ultimately I would not want users to be able to specify the date of their own transactions (and it would additionally cause the transactions to be displayed in reverse order or when they were received instead of when they were made, although this could be changed by changing the logic of how they are ordered in the `format_transactions` method). A better way of doing it would be to stub the dates in the tests.

### How to use and run tests

1. Clone the repo locally
2. In the repo folder, run `bundle install`
3. Start up an REPL such as `irb` or `pry`
4. Require the code file by typing `require './lib/bank_account'`
5. Create an instance of the BankAccount class and play around using the `deposit`, `withdraw`, and `print_statement` methods on the instance
6. To run the unit tests, quit the REPL and run `rspec`

#### Basic demo in Pry:

```
[1] pry(main)> require './lib/bank_account'
=> true
[2] pry(main)> account = BankAccount.new
=> #<BankAccount:0x00007fd40aa3f878 @balance=0, @transactions=[]>
[3] pry(main)> account.deposit(-100)
RuntimeError: Deposit amount must be greater than 0
from /Users/inbarvernia/Projects/Week10/makers-bank-tech-test/lib/bank_account.rb:14:in `deposit'
[4] pry(main)> account.deposit(1000)
=> [{:date=>#<Date: 2021-05-05 ((2459340j,0s,0n),+0s,2299161j)>, :amount=>1000.0, :balance=>1000.0}]
[5] pry(main)> account.withdraw(500)
=> [{:date=>#<Date: 2021-05-05 ((2459340j,0s,0n),+0s,2299161j)>, :amount=>1000.0, :balance=>1000.0},
 {:date=>#<Date: 2021-05-05 ((2459340j,0s,0n),+0s,2299161j)>, :amount=>-500.0, :balance=>500.0}]
[6] pry(main)> account.withdraw(0)
RuntimeError: Withdrawal amount must be greater than 0
from /Users/inbarvernia/Projects/Week10/makers-bank-tech-test/lib/bank_account.rb:21:in `withdraw'
[7] pry(main)> account.print_statement
date || credit || debit || balance
05/05/2021 || || 500.00 || 500.00
05/05/2021 || 1000.00 || || 1000.00=> nil
[8] pry(main)> quit
```
