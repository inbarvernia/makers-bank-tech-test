# frozen_string_literal: true

require 'bank_account'

describe BankAccount do
  let(:date) { Date.new(2012, 1, 10) }
  let(:transaction_double) { double("Transaction") }

  describe '#deposit' do
    it 'is a method that takes one argument' do
      expect(subject).to respond_to(:deposit).with(1).argument
    end

    context 'when amount is a positive number' do
      it 'increases balance by amount specified' do
        expect { subject.deposit(1000) }.to change { subject.balance }.by(1000)
      end
      it 'confirms the deposit and amount' do
        expect(subject.deposit(1000)).to eq("You've successfully deposited 1000")
      end
      it 'adds the transaction to list of account transactions' do
        expect { subject.deposit(1000) }.to change { subject.transactions.length }.by(1)
      end
      it 'saves the transaction information provided' do
        allow(Transaction).to receive(:new).and_return transaction_double
        subject.deposit(1000)
        expect(subject.transactions).to include(transaction_double)
      end
    end
    context 'when amount is negative or 0' do
      it 'throws an error message' do
        expect { subject.deposit(-1000) }.to raise_error('Deposit amount must be greater than 0')
        expect { subject.deposit(0) }.to raise_error('Deposit amount must be greater than 0')
      end
    end
  end

  describe '#withdraw' do
    it 'is a method that takes one argument' do
      expect(subject).to respond_to(:withdraw).with(1).argument
    end

    context 'when amount is a positive number' do
      it 'decreases balance by amount specified' do
        expect { subject.withdraw(1000) }.to change { subject.balance }.by(-1000)
      end
      it 'confirms the withdrawal and amount' do
        expect(subject.withdraw(1000)).to eq("You've successfully withdrawn 1000")
      end
      it 'adds the transaction to list of account transactions' do
        expect { subject.withdraw(1000) }.to change { subject.transactions.length }.by(1)
      end
      it 'saves the transaction information provided' do
        allow(Transaction).to receive(:new).and_return transaction_double
        subject.withdraw(1000)
        expect(subject.transactions).to include(transaction_double)
      end
    end
    context 'when amount is 0 or less' do
      it 'throws an error message' do
        expect { subject.withdraw(-1000) }.to raise_error('Withdrawal amount must be greater than 0')
        expect { subject.withdraw(0) }.to raise_error('Withdrawal amount must be greater than 0')
      end
    end
  end

  describe '#print_statement' do
    context 'when no transactions have been made' do
      it 'prints a header' do
        expect { subject.print_statement }.to output("date || credit || debit || balance\n").to_stdout
      end
    end    
  end
end
