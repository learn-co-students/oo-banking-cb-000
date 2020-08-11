require 'pry'
class Transfer

  attr_reader :sender, :receiver
  attr_accessor :status, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    if self.sender.valid? && self.receiver.valid?
      true
    else
      false
    end
  end

  def execute_transaction
    if @status == "pending" && self.valid? && sender.balance > amount
      sender.balance = sender.balance - amount
      receiver.balance = receiver.balance + amount
      @status = "complete"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
      # if @status == "complete"
      # @sender.balance
      # @receiver.balance
    end
    # binding.pry
  end
# if @sender.balance = @sender.balance - amount
# @receiver.balance = @receiver.balance + amount
# self.status = "complete"
#
# && self.sender.balance > 0
#
#     if self.status == "pending"
#
# "Transaction rejected. Please check your account balance."
#     # end
#   end

  def execute
    @sender.balance = @sender.balance - amount
    @receiver.balance = @receiver.balance + amount
    self.status = "complete"
  end

  def reverse_transfer
    if @status == "complete"
      sender.balance = sender.balance + amount
      receiver.balance = receiver.balance - amount
      @status = "reversed"
    else
  end
end
  # your code here
end
