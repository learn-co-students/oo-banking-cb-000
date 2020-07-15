class Transfer

  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, status='pending', amount)
    @sender = sender
    @receiver = receiver
    @status = status
    @amount = amount
  end

  def valid?
    self.sender.valid? && self.receiver.valid? &&
    self.sender.balance > self.amount
  end

  def execute_transaction
    if self.status == 'pending' && self.valid?
      self.sender.deposit(-@amount)
      self.receiver.deposit(@amount)
      self.status = 'complete'
    else
      self.status = 'rejected'
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.status == 'complete'
      self.sender.deposit(@amount)
      self.receiver.deposit(-@amount)
      self.status = 'reversed'
    end
  end

end
