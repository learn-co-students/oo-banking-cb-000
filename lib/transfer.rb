class Transfer
  # your code here

  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender,receiver,amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
    @counter = 0
  end

  def valid?

    if (@sender.valid? && @receiver.valid?)
      return true
    else
      return false
    end
  end

  def execute_transaction
    if (self.valid? && @counter <1 && @sender.balance > @amount)
      @sender.remove(@amount)
      @receiver.deposit(@amount)
      @status = "complete"
      @counter += 1
    else
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end

  end

  def reverse_transfer
    if (self.valid? && @counter == 1 && @receiver.balance > @amount)
      @sender.deposit(@amount)
      @receiver.remove(@amount)
      @status = "reversed"
      @counter -= 1
    else
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end

  end

end
