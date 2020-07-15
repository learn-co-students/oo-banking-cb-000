class Transfer
  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    self.sender = sender
    self.receiver = receiver
    self.amount = amount
    self.status = 'pending'
  end

  def valid?
    sender.valid? && receiver.valid? && sender.balance >= self.amount
  end

  def execute_transaction
    unless valid?
      self.status = 'rejected'
      return 'Transaction rejected. Please check your account balance.'
    end

    if self.status != 'complete'
      self.receiver.deposit(amount)
      self.sender.balance -= amount
      self.status = 'complete'
    end
  end

  def reverse_transfer
    if self.status == 'complete'
      self.sender.deposit(self.amount)
      self.receiver.balance -= self.amount
      self.status = 'reversed'
    end
  end
end
