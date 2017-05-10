class Transfer
  # your code here
  attr_reader :sender, :receiver, :amount
  attr_accessor :status
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def execute_transaction
    if @status == "pending" && self.valid? && @sender.balance > @amount
      @sender.deposit(@amount*-1)
      @receiver.deposit(@amount)
      @status = "complete"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end

  end

  def valid?
    return true if @sender.valid? && @receiver.valid?
    false
  end

  def reverse_transfer
    if @status == "complete"
      @sender.deposit(@amount)
      @receiver.deposit(@amount*-1)
      @status = "reversed"
    else
      "Transaction cannot be reversed."
    end

  end
end
