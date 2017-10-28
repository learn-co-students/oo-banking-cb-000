class Transfer

  attr_accessor :receiver, :sender, :status, :amount

  def initialize(sender, receiver, amount)
    @status = "pending"
    @sender = sender
    @receiver = receiver
    @amount = amount
  end

  def valid?
     receiver.valid? && sender.valid?
  end

  def execute_transaction
    if (valid? && sender.balance > amount && @status == "pending")
      @sender.withdraw(@amount)
      @receiver.deposit(@amount)
      @status = "complete"
    else
      reject
    end
  end

  def reverse_transfer
    if (status == "complete" && valid? && receiver.balance > amount)
      @sender.deposit(@amount)
      @receiver.withdraw(@amount)
      @status = "reversed"
    else
      reject
    end
  end

  def reject
    @status = "rejected"
    "Transaction rejected. Please check your account balance."
  end

end
