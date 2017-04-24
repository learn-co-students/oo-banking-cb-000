require 'pry'

class Transfer
  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, status = "pending", amount)
    @sender = sender
    @receiver = receiver
    @status = status
    @amount = amount
  end

  def valid?
    @sender.valid?
    @receiver.valid?
  end

  def execute_transaction
    if @sender.valid? && @receiver.valid? && @sender.balance > @amount && @status != "complete"
       @receiver.deposit(self.amount)
       @sender.balance -= @amount
       @status = "complete"
     else
       @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status == "complete"
      @sender.deposit(self.amount)
      @receiver.balance -= @amount
       @status = "reversed"
     else
       @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end
  end

end
