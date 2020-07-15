
require "pry"
class Transfer
attr_reader :sender
attr_reader :receiver
attr_reader :amount
attr_accessor :status


  def initialize(sender, receiver,money)
    @sender = sender
    @receiver =receiver
    @amount = money
    @status = "pending"
  end


def valid?
  if @sender.valid? ==true && @receiver.valid? ==true
    return true
  else
    return false
end
end

def execute_transaction
  if @status != "complete" && @sender.valid? && @receiver.valid? && @sender.balance >= @amount
    @sender.balance -= @amount
    @receiver.balance += @amount
    self.status = "complete"
    return self.status

else
  self.status = "rejected"
   return "Transaction rejected. Please check your account balance."
end

end


def reverse_transfer
  if self.status == "complete" && self.valid? == true
    @sender.balance += @amount
    @receiver.balance -= @amount
    self.status = "reversed"
  else
    return "error"
end


end


end
