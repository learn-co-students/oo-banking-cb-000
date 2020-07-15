require 'pry'

class Transfer
  attr_accessor :status, :amount, :sender, :receiver 
  
  def initialize(sender, receiver, amount)
    @sender = sender 
    @receiver = receiver 
    @amount = amount 
    @status = "pending"
  end 
  
  def valid?
    self.receiver.valid? && self.sender.valid?
  end 
  
  def execute_transaction 
    if valid? && self.status == "pending" && self.sender.balance >= self.amount
      # binding.pry 
      self.sender.balance -= self.amount 
      self.receiver.balance += self.amount 
      self.status = "complete"
    else 
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end 
  end 
  
  def reverse_transfer 
    if self.status == "complete"
      self.receiver.balance -= self.amount 
      self.sender.balance += self.amount 
      self.status = "reversed"
    end 
  end 
  
end
