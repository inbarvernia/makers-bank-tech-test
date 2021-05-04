class BankAccount
  attr_reader :balance

  def initialize
    @balance = 0
  end

  def deposit(amount, date)
    @balance += amount
  end

  def print_statement
    print "date || credit || debit || balance\n"
  end
end
