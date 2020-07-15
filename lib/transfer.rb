require "pry"
class Transfer
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  attr_accessor :sender, :receiver, :status, :amount

  def valid?
    @sender.balance - @amount > 0 && @receiver.valid? && @sender.valid?
  end

  def execute_transaction
    if valid? && @status == "pending"
      ((@sender.balance -= @amount) && (@receiver.balance += @amount))
      @status = "complete"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    ((@receiver.balance -= @amount) && (@sender.balance += @amount)) if @status == "complete"
    @status = "reversed"
  end
end
