require "pry"
class Transfer
  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    is_it_valid = false
    BankAccount.all.collect do |a|
      if a.valid? == true
        is_it_valid = true
      end
    end
    is_it_valid
  end

  def execute_transaction
    #binding.pry
    if @sender.valid? && @sender.balance > @amount && @sender.balance == 1000
      @sender.balance = @sender.balance - @amount
      @receiver.balance = @receiver.balance + @amount
      @status = "complete"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @receiver.balance > 1000
      @receiver.balance = @receiver.balance - @amount
      @sender.balance = @sender.balance + @amount
      @status = "reversed"
    end
  end
end
