class Transfer
  
  attr_accessor :sender, :receiver, :amount, :status
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end
  
  def valid?
    self.sender.valid? && self.receiver.valid?
  end
  
  def execute_transaction
    # if (self.sender.balance > amount && self.sender.status = "open")
    #   self.status = "rejected"
    #   return "Transaction rejected. Please check your account balance."
    # end
    
    
    if(self.status == "pending" && self.valid? && self.sender.balance > amount)
      self.sender.balance -= amount
      self.receiver.balance += amount
      self.status = "complete"
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
      
    
  end
  
  def reverse_transfer
     if(self.status == "complete" && valid? && self.receiver.balance > amount)
      self.receiver.balance -= amount
      self.sender.balance += amount
      self.status = "reversed"
    else
       self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end
  
  
end
