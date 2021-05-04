# frozen_string_literal: true

class BankAccount
  attr_reader :balance

  def initialize
    @balance = 0
  end

  def deposit(amount, _date)
    @balance += amount
  end

  def print_statement
    print "date || credit || debit || balance\n"
  end
end
