# frozen_string_literal: true

require 'bank_account'

describe BankAccount do
  describe '#deposit' do
    it 'is a method that takes two arguments' do
      expect(subject).to respond_to(:deposit).with(2).arguments
    end

    it 'increases balance by amount specified' do
      expect { subject.deposit(1000, '10-01-2012') }.to change { subject.balance }.by(1000)
    end

    it 'saves the transaction information' do
      subject.deposit(1000, '10-01-2012')
      expect(subject.transactions).to include({ date: '10-01-2012', amount: 1000.0, balance: 1000.0 })
    end
  end

  describe '#print_statement' do
    context 'when no transactions have been made' do
      it 'prints a header' do
        expect { subject.print_statement }.to output("date || credit || debit || balance\n").to_stdout
      end
    end

    context 'when one transaction has been made' do
      xit 'prints a header followed by transaction details' do
        subject.deposit(1000, '10-01-2012')
        expect do
          subject.print_statement
        end.to output("date || credit || debit || balance\n10/01/2012 || 1000.00 || || 1000.00").to_stdout
      end
    end
  end
end
