# frozen_string_literal: true

class BankAccount
  attr_reader :balance, :transactions

  def initialize
    @balance = 0
    @transactions = []
  end

  def deposit(amount, date)
    @balance += amount
    transaction = {
      date: date,
      amount: amount.to_f,
      balance: @balance.to_f
    }
    @transactions.push(transaction)
  end

  def print_statement
    print "date || credit || debit || balance\n"
  end
end
