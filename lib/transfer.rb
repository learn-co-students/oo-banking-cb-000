class Transfer
  # your code here
  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = 'pending'
  end

  def valid?
    sender.valid? && receiver.valid?
  end

  def execute_transaction
    if sender.valid? && sender.balance >= @amount
      if status == "pending"
        receiver.balance += @amount
        sender.balance -= @amount
        @status = "complete"
      end
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if receiver.valid? && receiver.balance >= @amount
      if status == "complete"
        sender.balance += @amount
        receiver.balance -= @amount
        @status = "reversed"
      end
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end
end
