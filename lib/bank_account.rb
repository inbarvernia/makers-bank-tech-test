# frozen_string_literal: true
require 'date'

class BankAccount
  attr_reader :balance, :transactions

  def initialize
    @balance = 0
    @transactions = []
  end

  def deposit(amount, date = Date.today)
    raise "Deposit amount must be greater than 0" if amount <= 0
    @balance += amount
    save_transaction(amount, date)
  end

  def withdraw(amount, date = Date.today)
    @balance -= amount
    save_transaction(-amount, date)
    # saving transaction with negative amount to indicate it as a withdrawal
  end

  def print_statement
    print statement_header
    print format_transactions
  end

  private

  def save_transaction(amount, date)
    transaction = {
      date: date,
      amount: amount.to_f,
      balance: @balance.to_f
    }
    @transactions.push(transaction)
  end

  def statement_header
    "date || credit || debit || balance\n"
  end

  def format_transactions
    formatted_transactions = []
    @transactions.each do |transaction|
      formatted_transaction = "#{transaction[:date].strftime('%d/%m/%Y')} || #{format('%.2f', transaction[:amount])} || || #{format('%.2f', transaction[:balance])}"
      formatted_transactions.push(formatted_transaction)
    end
    formatted_transactions.join("\n")
  end
end
