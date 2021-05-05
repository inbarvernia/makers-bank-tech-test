# frozen_string_literal: true

require 'bank_account'

describe BankAccount do
  describe 'depositing' do
    
  end

  describe 'withdrawing' do
    
  end

  describe 'printing a statement' do
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
   