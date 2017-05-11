class Transfer
  # your code here
attr_accessor :status
  attr_reader :sender, :receiver, :amount

  def initialize(sender, receiver, amount)
  	@sender = sender
  	@receiver = receiver
  	@status = "pending"
  	@amount = amount
  end

  def valid?
  	if @sender.valid? == true && @receiver.valid? == true
  		true
  	else
  		false
  	end
  end

  def execute_transaction
  	if @sender.valid? == false || @sender.balance < @amount
  		@status = "rejected"
  		return "Transaction rejected. Please check your account balance."
  	elsif @sender.valid? == true && @status == "pending"
	  	@receiver.balance = @receiver.balance + @amount
	  	@sender.balance = @sender.balance - @amount
	  	@status = "complete"
	end
  end

  def reverse_transfer
  	if @sender.valid? == false
  		print "Transaction rejected. Please check your account balance."
  		@status = "rejected"
  	elsif @sender.valid? == true && @status == "complete"
	  	@receiver.balance = @receiver.balance - @amount
	  	@sender.balance = @sender.balance + @amount
	  	@status = "reversed"
	end
  end

end
