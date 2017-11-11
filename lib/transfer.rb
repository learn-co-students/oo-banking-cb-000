class Transfer
  # your code here
  attr_accessor :sender, :receiver, :status, :amount, :count

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
    @count = 0
  end

  def valid?
    sender.valid? && receiver.valid? ? true : false
end

  def execute_transaction
    if amount < self.sender.balance && @count == 0
      sender.balance -= @amount
      receiver.balance += @amount
      @status = "complete"
      @count += 1
    else
      @status = "rejected"
    end
    return "Transaction rejected. Please check your account balance."
  end

  def reverse_transfer
    if @status == "complete"
      @sender.balance += amount
      @receiver.balance -= amount
      @status = "reversed"
    end
  end

end
