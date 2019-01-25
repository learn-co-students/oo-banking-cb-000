class Transfer
  attr_reader :sender, :receiver, :amount
  attr_accessor :status
  
  #This initializes a transfer with a sender, a receiver, always with a status of 
  #"pending", and initializes with a transfer amount of 50
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount

  end 

  def valid?
    sender.valid? && receiver.valid?
  end

  #can execute a successful transaction between two accounts
  #each transfer can only happen once
  #rejects a transfer if the sender doesn't have a valid account
  def execute_transaction
    if valid? && sender.balance > amount && self.status == "pending"
       sender.balance -= amount
       receiver.balance += amount
       self.status = "complete"
    else
      reject_transfer
    end

  end 

  #can reverse a transfer between two accounts
  #it can only reverse executed transfers
  def reverse_transfer
    if valid? && receiver.balance > amount && self.status == "complete"
      receiver.balance -= amount
      sender.balance += amount
      self.status = "reversed"

    else 
       reject_transfer
    end

  end 
 
  #The reject_transfer method is an extra method that will give the message that the 
  #transaction has been rejected if it was indeed rejected
  def reject_transfer
    self.status = "rejected"
    "Transaction rejected. Please check your account balance."
  end

end
