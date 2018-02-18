class Transfer
  # your code here
  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    self.sender.valid? && self.receiver.valid? && self.sender.balance >= self.amount ? true : false
  end

  def execute_transaction
    if valid? == false
      self.status = "rejected"
      return "Transaction rejected. Please check your account balance."
    else
      self.sender.balance -= self.amount
      self.receiver.deposit(self.amount)
      self.status = "complete"
      self.sender.close_account
      self.receiver.close_account
    end
  end

  def reverse_transfer
    if self.status == "complete"
      self.sender.deposit(self.amount)
      self.receiver.balance -= self.amount
      self.status = "reversed"
    end
  end
end
