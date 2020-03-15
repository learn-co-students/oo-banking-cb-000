class Transfer

attr_accessor :sender, :receiver, :amount, :status
attr_reader 



def initialize(sender, receiver, amount)
  @amount = amount
  @status = "pending"
  @sender = sender
  @receiver = receiver
end

def valid?
  if @sender.valid? == true && @receiver.valid? == true 
    true 
  else false 
  end 
end

def execute_transaction
  if valid? && @sender.balance > amount && self.status != "complete"
  @receiver.balance = (@receiver.balance + amount)
  @sender.balance = (@sender.balance - amount)
    self.status = "complete"
else 
  
  self.status = "rejected"
  return "Transaction rejected. Please check your account balance."

end 
end 

def reverse_transfer
  if self.status == "complete" && valid? && @receiver.balance > amount
  @receiver.balance = (@receiver.balance - amount)
  @sender.balance = (@sender.balance + amount)
  self.status = "reversed"
end 
end 

end
