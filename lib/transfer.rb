class Transfer
  attr_accessor :sender, :receiver, :status, :amount, :bankaccount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    if sender.valid? && receiver.valid?
      return true
    else
      return false
    end
  end

  def execute_transaction
    if self.amount > 1000
      self.status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end
    if self.status == "pending"
      sender.deposit(-amount) && receiver.deposit(amount)
      self.status = "complete"
    end
  end

  def reverse_transfer
    if self.status == "complete"
      sender.deposit(amount) && receiver.deposit(-amount)
      self.status = "reversed"
    end
  end


end
