class Transfer
  # your code here

  attr_reader :sender, :receiver, :status, :amount
  def initialize(sender, receiver, amount)
    @sender=sender
    @receiver = receiver
    @amount=amount
    @status = 'pending'
  end

  def valid?
    # instances?
    @sender.valid? and @receiver.valid?

  end

  def execute_transaction
    # doesnt make sense that this would be valid for this test
    # p @sender.valid?

    # doesnt even go to this branch because it showing up as valid!!!! wtf
    if !valid? or @sender.balance < @amount
      #bull
      @status = 'rejected'
      return "Transaction rejected. Please check your account balance."


    elsif @status != "complete"
    @sender.balance -= @amount
    @receiver.balance += @amount
    @status = "complete"
  end

  end

  def reverse_transfer
    if @status == "complete"
    @sender.balance += @amount
    @receiver.balance -= @amount
    @status = "reversed"
  end
  end
end
