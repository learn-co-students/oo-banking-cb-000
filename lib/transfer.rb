class Transfer

  attr_accessor :sender, :receiver, :amount, :status


  def initialize (sender, receiver, amount)
    @status = "pending"
    @amount = amount
    @sender = sender
    @receiver = receiver
  end

  def valid?
    sender.valid? && receiver.valid?
  end

  def execute_transaction
    if valid? && sender.balance >= self.amount && self.status == "pending"
      sender.balance -= self.amount
      receiver.balance += self.amount
      self.status = "complete"
    elsif sender.balance < self.amount || !valid?
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.status == "complete"
      sender.balance += self.amount
      receiver.balance -= self.amount
      self.status = "reversed"
    end
  end

end
