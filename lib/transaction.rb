# frozen_string_literal: true

# This class represents a banking transaction
class Transaction
  attr_reader :date, :amount, :balance

  def initialize(date: , amount: , balance: )
    @date = date
    @amount = amount.to_f
    @balance = balance.to_f
  end

  def format_for_statement
    formatted_transaction = "#{@date.strftime('%d/%m/%Y')} || "
    if @amount.positive?
      formatted_transaction += "#{format('%.2f', @amount)} || || "
    else
      formatted_transaction += "|| #{format('%.2f', @amount.abs)} || "
      # Using transaction[:amount].abs because it will now appear under debit and should therefore be a positive amount
    end
    formatted_transaction += "#{format('%.2f', @balance)}"
  end
end
