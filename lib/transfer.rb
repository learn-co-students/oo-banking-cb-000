class Transfer
  attr_accessor :status
  attr_reader :sender, :receiver, :amount



  def initialize(sender, receiver, status="pending", amount)
    @sender = sender
    @receiver = receiver
    @status = status
    @amount = amount
  end

  def valid?
    sender.valid?
    receiver.valid?
  end

  def execute_transaction
    if self.valid? && self.status == "pending" && sender.balance > amount
      sender.withdraw(amount)
      receiver.deposit(amount)
      self.status = "complete"
    else
      self.status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
  if self.valid? && self.status == "complete" && receiver.balance > amount
    sender.deposit(amount)
    receiver.withdraw(amount)
    self.status = "reversed"
  end
  end
end
