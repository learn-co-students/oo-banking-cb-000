class Transfer
  attr_accessor :sender, :receiver, :amount, :status
  attr_reader :test
  
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end
  
  def valid?
    if (@sender.valid? == true && @receiver.valid? == true)
      return true
    else
      return false
    end
  end
  
  def execute_transaction
    #puts "sender_valid? " + @sender.valid?.to_s
    #puts @sender.balance
    #puts @amount
    #puts @sender.balance >= @amount
    #puts "self_valid? " + self.valid?.to_s
    #puts "sender.status? " + @sender.status
    if (@status == "pending" && self.valid? == true && @sender.balance >= @amount)
      puts "executing transaction"
      @sender.deposit(-1 * @amount)
      @receiver.deposit(@amount)
      @status = "complete" 
    elsif (@sender.valid? == false || @sender.balance < @amount)
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    else
      # do nothing
    end
  end
  
  def reverse_transfer
    if @status == "complete"
      @sender.deposit(@amount)
      @receiver.deposit(-1 * @amount)
      @status = "reversed"
    else
    end
  end
end





