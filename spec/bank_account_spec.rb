require 'bank_account'

describe BankAccount do
  describe '#deposit' do
    it "is a method that takes two arguments" do
      expect(subject).to respond_to(:deposit).with(2).arguments
    end

    it "increases balance by amount specified" do
      expect {subject.deposit(1000, "10-01-2012")}.to change {subject.balance}.by(1000)
    end
  end

  describe '#print_statement' do
    it "prints a header" do
      expect {subject.print_statement}.to output("date || credit || debit || balance").to_stdout
    end
  end
end
