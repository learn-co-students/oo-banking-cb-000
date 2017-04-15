class Transfer
  attr_accessor :status,:sender,:receiver,:amount
  def initialize(sender, receiver,amount)
    @sender=sender
    @receiver=receiver
    @amount=amount
    self.status = "pending"
  end

  def valid?
    self.sender.valid? && @sender.balance>=@amount && self.receiver.valid?
  end

  def execute_transaction
    if self.valid? && @status=="pending"
      @receiver.deposit(@amount)
      @sender.deposit(-@amount)
      @status="complete"
    else 
      self.status="rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.status == "complete"
      @sender.deposit(@amount)
      @receiver.deposit(-@amount)
      self.status="reversed"
    else "transaction hasn't been completed"
    end
  end
      
end
