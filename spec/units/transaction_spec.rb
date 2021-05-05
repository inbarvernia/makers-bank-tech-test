require 'transaction'

describe Transaction do
  let(:date) { Date.new(2012, 1, 10) }
  let(:transaction) { described_class.new(date: date, amount: 1000, balance: 3000) }
  let(:withdrawal) { described_class.new(date: date, amount: -1000, balance: -1000) }

  describe '#initialize' do
    it 'creates a new transaction instance with date, amount, and balance attributes' do
      expect(transaction.date).to eq(date)
      expect(transaction.amount).to eq(1000.0)
      expect(transaction.balance).to eq(3000.0)
    end
  end

  describe '#format_for_statement' do
    context 'when deposit (i.e. positive amount)' do
      it 'formats each transaction into a string with amount in credit column' do
        expect(transaction.format_for_statement).to eq("10/01/2012 || 1000.00 || || 3000.00")
      end
    end
    context 'when withdrawal (i.e. negative amount)' do
      it 'formats each transaction into a string with amount in debit column' do
        expect(withdrawal.format_for_statement).to eq("10/01/2012 || || 1000.00 || -1000.00")
      end
    end
  end
end
