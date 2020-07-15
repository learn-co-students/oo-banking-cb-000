class Transfer
  attr_accessor :sender, :receiver, :status, :amount
  # your code here
  def initialize(sender, receiver, amount)
    @status = "pending"
    @sender = sender
    @receiver = receiver
    @amount = amount
  end

  def valid?
    @sender.valid? && @receiver.valid? && @sender.balance > amount
  end

  def execute_transaction
    if self.valid? && @status == "pending"
      sender.deposit(-@amount)
      receiver.deposit(@amount)
      @status = "complete"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status == "complete"
      sender.deposit(@amount)
      receiver.deposit(-@amount)
      @status = "reversed"
    end
  end
end
