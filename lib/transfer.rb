class Transfer
  # your code here
  attr_accessor :sender, :receiver, :amount, :status, :count

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = 50
  end

  def valid?
    sender.valid? && receiver.valid? ? true : false
  end

  def execute_transaction
    if self.valid? && self.status != "complete"
      self.sender.balance -= self.amount
      self.receiver.balance += self.amount
      self.status = "complete"
    elsif
      @status = 'pending' && @sender.valid? == false || @sender.balance < @amount
      return "Transaction rejected. Please check your account balance."
    end
  end


  def reverse_transfer
    if self.status == "complete"
      self.sender.balance += self.amount
      self.receiver.balance -= self.amount
      self.status = "reversed"
    end
  end

end
