class Transfer
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end
  attr_reader :status, :sender, :receiver, :amount
  def valid?
    if @sender.valid? == true && @receiver.valid? == true
      true
    else
      false
    end
  end
  def execute_transaction
    if @status == "pending" && self.valid? == true && @sender.balance >= @amount
      @sender.deposit(-@amount)
      @receiver.deposit(@amount)
      @status = "complete"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end
  def reverse_transfer
    if @status == "complete"
      @sender.deposit(@amount)
      @receiver.deposit(-@amount)
      @status = "reversed"
    end
  end
end
