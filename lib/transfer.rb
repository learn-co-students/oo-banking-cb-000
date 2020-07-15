require 'pry'
class Transfer
  attr_accessor :sender, :receiver, :amount, :status
  
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = 'pending'
  end
  
  def valid?()
    return @status == 'pending' && @sender.valid?() && @receiver.valid?()
  end
  
  def execute_transaction()
    if @sender.balance < @amount || @receiver.balance < @amount
      @status = 'rejected'
      return "Transaction rejected. Please check your account balance."
    elsif valid?() 
      sender.balance -= amount 
      receiver.balance += amount
      @status = 'complete'
    end
  end
  
  def reverse_transfer()
    if status == 'complete'
      sender.balance += amount 
      receiver.balance -= amount
      @status = 'reversed'
    end 
  end
  
end
