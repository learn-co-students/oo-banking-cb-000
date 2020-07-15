class Transfer
  attr_accessor :status
  attr_reader :sender, :receiver, :amount

  def initialize(sender, receiver, transfer_amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = transfer_amount
  end
  
  def valid?
    @sender.valid? && @receiver.valid?
  end
  
  def execute_transaction
    if valid? && @sender.balance >= @amount && @status != "complete"
      @sender.balance -= @amount
      @receiver.balance += @amount
      @status = "complete"
    else
      reject_transfer
    end
  end
  
  def reverse_transfer
    if @status == "complete"
      @receiver.balance -= @amount
      @sender.balance += @amount
      @status = "reversed"
    else
      reject_transfer
    end
  end
  
  def reject_transfer
    @status = "rejected"
    "Transaction rejected. Please check your account balance."
  end
end
