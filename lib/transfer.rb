class Transfer
  attr_accessor :sender, :receiver, :balance, :status, :amount, :bank_account

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
    sender.valid? && receiver.valid?
  end

  def execute_transaction
      if valid? && sender.balance > amount && self.status == "pending"
        sender.balance -= amount
        receiver.balance += self.amount
        self.status = "complete"
      else
        reject_transfer
      end
  end

  def reverse_transfer
    if valid? && sender.balance > amount && self.status == "complete"
      sender.balance += amount
      receiver.balance -= self.amount
      self.status = "reversed"
    else
      reject_transfer
    end
  end

  def reject_transfer
    self.status = "rejected"
    "Transaction rejected. Please check your account balance."
  end


end
