
class Transfer
  attr_accessor :status
  attr_reader :amount, :sender, :receiver
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end
  def valid?
    sender.valid? && receiver.valid?
    #self.sender.valid? && self.receiver.valid? ? true : false # holy shit, that worked!
    # I'm confused how it actually knows about Amanda and Avi.
  end
  def execute_transaction
    if valid? && sender.balance > amount && self.status == "pending" # I had to look up the two extra conditions
      sender.balance -= amount
      receiver.balance += amount
      self.status = "complete"
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.status == "complete" || self.status == "rejected"
      sender.balance += amount
      receiver.balance -= amount
      self.status = "reversed"
    end
  end
end
