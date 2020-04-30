require 'pry'

class Transfer
attr_accessor  :status
attr_reader :sender, :receiver, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = 'pending'
  end

  def valid?
    sender.valid? && receiver.valid?
  end

  def execute_transaction
    if valid? && @status == 'pending' && sender.balance > @amount
      complete_transfer
      elsif
        @status == 'complete'
        "This transfer has already been completed"
      else
        reject_transfer
        #binding.pry
    end
  end

  def complete_transfer
    sender.balance -= amount
    receiver.balance += amount
    @status = 'complete'
  end

  def reject_transfer
    @status = 'rejected'
    "Transaction rejected. Please check your account balance."
  end


  def reverse_transfer
    if valid? && @status == 'complete'
      sender.balance += amount
      receiver.balance -= amount
      @status = 'reversed'
    end
  end
end
