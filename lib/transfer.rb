class Transfer

attr_accessor :sender, :receiver, :amount
attr_reader :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    sender.valid? && receiver.valid?
  end

  def execute_transaction
    if valid? and sender.balance >amount and @status == "pending"
      self.sender.balance-= amount
      self.receiver.balance+= amount
      @status = "complete"
    else
      @status= "rejected"
      "Transaction rejected. Please check your account balance."
    end

  end

  def reverse_transfer
    if execute_transaction
      self.sender.balance += amount
      self.receiver.balance -= amount
      @status = "reversed"
    end 
  end


end
