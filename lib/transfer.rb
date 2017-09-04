class Transfer
  attr_accessor :status, :sender, :receiver, :amount

  def initialize(sender,receiver,amount)
    @status = "pending"
    @sender = sender
    @receiver = receiver
    @amount = amount
  end

  def valid?
    return @sender.valid? && @receiver.valid?
  end

  def execute_transaction
    unless @status == "complete"
      if @sender.balance > @amount && valid?
        @sender.deposit(-@amount)
        @receiver.deposit(@amount)
        @status = "complete"
      else
        @status = "rejected"
        "Transaction rejected. Please check your account balance."
      end
    end
  end

  def reverse_transfer
    if @status == "complete"
      if @receiver.balance > @amount && valid?
        @receiver.deposit(-@amount)
        @sender.deposit(@amount)
        @status = "reversed"
      else
        @status = "rejected"
        "Transaction rejected. Please check your account balance."
      end
    end
  end

end
