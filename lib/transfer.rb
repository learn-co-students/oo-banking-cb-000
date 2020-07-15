class Transfer
  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

def valid?
  #The complicated way to validate bank accounts
  #if @sender.status == "open" && @sender.balance > 0 && @receiver.status == "open" && @receiver.balance > 0
  #The smooth way to validate bank accounts
  if @sender.valid? && @receiver.valid? #&& (@sender.balance >= @amount)
    true
  else
    false
  end
end

def execute_transaction
if self.valid? && @status == "pending" && @sender.balance > @amount
  @sender.balance -= @amount
  @receiver.balance += @amount
  @status = "complete"
else
  @status = "rejected"
  "Transaction rejected. Please check your account balance."
end #endif
end

def reverse_transfer
  if @status == "complete" && self.valid? && @receiver.balance > @amount
    @sender.balance += @amount
    @receiver.balance -= @amount
    @status = "reversed"
  else
    @status = "rejected"
    "Transaction Rejected."
  end
end

end
