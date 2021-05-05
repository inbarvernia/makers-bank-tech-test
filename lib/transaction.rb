# frozen_string_literal: true

# This class represents a banking transaction
class Transaction
  attr_reader :date, :amount, :balance

  def initialize(date: , amount: , balance: )
    @date = date
    @amount = amount.to_f
    @balance = balance.to_f
  end
end
