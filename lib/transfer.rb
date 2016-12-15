require 'pry'
class Transfer
  # your code here
  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender,receiver,amt)
    @status = "pending"
    @sender = sender
    @receiver = receiver
    @amount = amt
  end

  def valid?
    @sender.valid? && @receiver.valid?
  end

  def execute_transaction
    if self.valid? && (@sender.balance - @amount) > 0
      if @status != "complete"
        #take money from sender
        @sender.deposit(-@amount)
        #put money into receiver
        @receiver.deposit(@amount)
        #set status to closed
        @status = "complete"
      end
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."

    end
  end

  def reverse_transfer
    if @status == "complete"
      #take money from receiever for reverse_transfer
      @receiver.deposit(-@amount)
      #give money to sender
      @sender.deposit(@amount)
      @status = "reversed"
    end
  end


end
