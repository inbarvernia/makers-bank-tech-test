# frozen_string_literal: true

require 'bank_account'

describe BankAccount do
  let(:date) { Date.new(2012, 1, 10) }

  describe '#deposit' do
    it 'is a method that takes one or two arguments' do
      expect(subject).to respond_to(:deposit).with(1).argument
    end

    context 'when amount is a positive number' do
      it 'increases balance by amount specified' do
        expect { subject.deposit(1000) }.to change { subject.balance }.by(1000)
      end
    end
    context 'when amount is negative or 0' do
      it 'throws an error message' do
        expect { subject.deposit(-1000) }.to raise_error('Deposit amount must be greater than 0')
        expect { subject.deposit(0) }.to raise_error('Deposit amount must be greater than 0')
      end
    end

    context 'when a date is provided' do
      it 'saves the transaction information provided' do
        allow(Date).to receive(:today).and_return Date.new(2012, 1, 10)
        subject.deposit(1000)
        expect(subject.transactions).to include({ date: date, amount: 1000.0, balance: 1000.0 })
      end
    end
    context 'when a date is not provided' do
      it 'saves the transaction amount provided and current date' do
        subject.deposit(1000)
        expect(subject.transactions).to include({ date: Date.today, amount: 1000.0, balance: 1000.0 })
      end
    end
  end

  describe '#withdraw' do
    it 'is a method that takes one or two arguments' do
      expect(subject).to respond_to(:withdraw).with(1).argument
    end
    context 'when amount is a positive amount' do
      it 'decreases balance by amount specified' do
        expect { subject.withdraw(1000) }.to change { subject.balance }.by(-1000)
      end
    end
    context 'when amount is 0 or less' do
      it 'throws an error message' do
        expect { subject.withdraw(-1000) }.to raise_error('Withdrawal amount must be greater than 0')
        expect { subject.withdraw(0) }.to raise_error('Withdrawal amount must be greater than 0')
      end
    end

    context 'when a date is provided' do
      it 'saves the transaction information provided' do
        allow(Date).to receive(:today).and_return Date.new(2012, 1, 10)
        subject.withdraw(1000)
        expect(subject.transactions).to include({ date: date, amount: -1000.0, balance: -1000.0 })
      end
    end
    context 'when a date is not provided' do
      it 'saves the transaction amount provided and current date' do
        subject.withdraw(1000)
        expect(subject.transactions).to include({ date: Date.today, amount: -1000.0, balance: -1000.0 })
      end
    end
  end

  describe '#print_statement' do
    context 'when no transactions have been made' do
      it 'prints a header' do
        expect { subject.print_statement }.to output("date || credit || debit || balance\n").to_stdout
      end
    end

    context 'when one deposit has been made' do
      it 'prints a header followed by transaction details' do
        allow(Date).to receive(:today).and_return Date.new(2012, 1, 10)
        subject.deposit(1000)
        expect { subject.print_statement }
          .to output("date || credit || debit || balance\n10/01/2012 || 1000.00 || || 1000.00").to_stdout
      end
    end

    context 'when one withdrawal has been made' do
      it 'prints a header followed by transaction details' do
        allow(Date).to receive(:today).and_return Date.new(2012, 1, 10)
        subject.withdraw(1000)
        expect { subject.print_statement }
          .to output("date || credit || debit || balance\n10/01/2012 || || 1000.00 || -1000.00").to_stdout
      end
    end

    context 'when multiple transactions have been made' do
      it 'prints a header followed by transactions in reverse chronological order' do
        allow(Date).to receive(:today).and_return Date.new(2012, 1, 10)
        subject.deposit(1000)
        allow(Date).to receive(:today).and_return Date.new(2012, 1, 13)
        subject.deposit(2000)
        allow(Date).to receive(:today).and_return Date.new(2012, 1, 14)
        subject.withdraw(500)
        expect { subject.print_statement }
          .to output("date || credit || debit || balance\n14/01/2012 || || 500.00 || 2500.00\n13/01/2012 || 2000.00 || || 3000.00\n10/01/2012 || 1000.00 || || 1000.00").to_stdout
      end
    end
  end
end
