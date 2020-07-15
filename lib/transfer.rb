class Transfer
  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = 'pending'
  end

  def valid?
    valid = false
    if self.sender.valid? and self.receiver.valid?
      if self.amount < self.sender.balance
        valid = true
      else
        self.sender.status = "closed"
      end
    end
    valid
  end

  def execute_transaction
    message = "start of method"
    if self.status == "pending" and self.valid?
      self.sender.balance -= self.amount
      self.receiver.balance += self.amount
      self.status = "complete"
      message = "go through first/wrong if"
    elsif !self.sender.valid?
      self.status = "rejected"
      message = "Transaction rejected. Please check your account balance."
    end
    message
  end

  def reverse_transfer
    if self.status == "complete"
      self.receiver.balance -= self.amount
      self.sender.balance += self.amount
      self.status = "reversed"
    end
  end
end
