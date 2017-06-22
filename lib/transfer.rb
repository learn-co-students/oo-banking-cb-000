class Transfer

  attr_accessor :sender, :receiver, :amount, :status

  def initialize( sender, receiver, amount )
    @sender = sender
    @receiver= receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    sender.valid? && receiver.valid?
  end

  def execute_transaction

    #puts "*******  BEFORE  ********"
    #puts @sender.valid?
    #puts @receiver.valid?
    #puts @amount
    #puts @sender.balance
    #puts @receiver.balance
    #puts "*******  BEFORE  ********"

    if @sender.valid? && @receiver.valid? && @sender.balance >= amount && @status == "pending"
      @receiver.deposit( @amount )
      @sender.deposit( -@amount )
      @status = "complete"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
    #puts "******  AFTER  *********"
    #puts @sender.balance
    #puts @receiver.balance
    #puts "******  AFTER  *********"

  end

  def reverse_transfer
    if self.status == "complete"
      @receiver.deposit( -@amount )
      @sender.deposit( @amount )
      @status = "reversed"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

end
