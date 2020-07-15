class Transfer
  # your code here
  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    return @sender.valid? && @receiver.valid?
  end

  def execute_transaction
    if @sender.valid? && @sender.balance >= @amount
      if @status == "pending"
        @sender.withdrawl(@amount)
        @receiver.deposit(@amount)
        @status = "complete"
      end
    else
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."

    end
  end

  def reverse_transfer
    if @status == "complete"
      @sender.deposit(@amount)
      @receiver.withdrawl(@amount)
      @status = "reversed"
    end
  end

end
