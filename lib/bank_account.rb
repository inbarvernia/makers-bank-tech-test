# frozen_string_literal: true

require 'date'
require_relative 'transaction'

# This class represents a basic bank account model
class BankAccount
  attr_reader :balance, :transactions

  def initialize
    @balance = 0
    @transactions = []
  end

  def deposit(amount)
    raise 'Deposit amount must be greater than 0' if amount <= 0

    @balance += amount
    save_transaction(amount, Date.today)
    "You've successfully deposited #{amount}"
  end

  def withdraw(amount)
    raise 'Withdrawal amount must be greater than 0' if amount <= 0

    @balance -= amount
    save_transaction(-amount, Date.today)
    # saving transaction with negative amount to indicate it as a withdrawal
    "You've successfully withdrawn #{amount}"
  end

  def print_statement
    print statement_header
    print format_transactions
  end

  private

  def save_transaction(amount, date)
    transaction = Transaction.new(date: date, amount: amount, balance: @balance)
    @transactions.push(transaction)
  end

  def statement_header
    "date || credit || debit || balance\n"
  end

  def format_transactions
    formatted_transactions = []
    @transactions.each do |transaction|
      formatted_transactions.push(transaction.format_for_statement)
    end
    formatted_transactions.reverse.join("\n")
  end
end
