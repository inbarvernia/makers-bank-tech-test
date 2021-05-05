require 'transaction'

describe Transaction do
  let(:date) { Date.new(2012, 1, 10) }
  # let(:transaction) { Transaction.new(date, 1000, 3000) }

  describe '#initialize' do
    it 'creates a new transaction instance with date, amount, and balance attributes' do
      transaction = Transaction.new(date: date, amount: 1000, balance: 3000)
      expect(transaction.date).to eq(date)
      expect(transaction.amount).to eq(1000.0)
      expect(transaction.balance).to eq(3000.0)
    end
  end
end
