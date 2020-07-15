class Transfer
  attr_accessor :status
  attr_reader :sender, :receiver, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = 'pending'
  end

  def valid?
    sender.valid? && sender.balance - amount >= 0 && receiver.valid?
  end

  def execute_transaction
    if self.valid? && self.status == 'pending'
      sender.balance -= self.amount
      receiver.balance += self.amount
      self.status = 'complete'
      message = "Transfer completed."
    else
      self.status = 'rejected'
      message = "Transaction rejected. Please check your account balance."
    end
    message
  end

  def reverse_transfer
    if self.status == 'complete'
      sender.balance += self.amount
      receiver.balance -= self.amount
      self.status = 'reversed'
    end
  end
end
