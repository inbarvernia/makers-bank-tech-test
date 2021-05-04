require 'bank_account'

describe BankAccount do
  describe '#deposit' do
    it "is a method that takes two arguments" do
      expect(subject).to respond_to(:deposit).with(2).arguments
    end
  end
end
