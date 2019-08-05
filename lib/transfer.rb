class Transfer
  attr_reader :sender, :receiver, :amount
  attr_accessor :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = 'pending'
  end

  def valid?
    sender.valid? && receiver.valid?
  end

  def execute_transaction
    if status != 'complete'
      sender.balance < amount ? reject_transfer : complete_transfer
    else
      "This transfer has already been completed"
    end
  end

  def complete_transfer
    receiver.balance += amount
    sender.balance -= amount
    self.status = 'complete'
  end

  def reject_transfer
    self.status = 'rejected'
    "Transaction rejected. Please check your account balance."
  end

  def reverse_transfer
    if status == 'complete'
      sender.balance += amount
      receiver.balance -= amount
      self.status = 'reversed'
    end
  end
end
