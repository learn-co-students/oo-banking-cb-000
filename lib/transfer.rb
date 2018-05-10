class Transfer
  attr_accessor :status, :amount
  attr_reader :sender, :receiver

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def sender
    @sender
  end

  def receiver
    @receiver
  end

  def amount
    @amount
  end

  def valid?
    self.sender.valid? && self.receiver.valid? && (self.sender.balance > self.amount)
  end

  def execute_transaction
    if self.valid? && self.status != "complete"
      self.sender.balance -= self.amount
      self.receiver.balance += self.amount
      self.status = "complete"
    else
      self.status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.status == "complete"
      self.sender.balance += self.amount
      self.receiver.balance -= self.amount
      self.status = "reversed"
    end
  end
end
