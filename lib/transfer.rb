require "pry"

class Transfer

	attr_reader :amount, :sender, :receiver
 	attr_accessor :status

	def initialize(sender, receiver, amount)
		@sender = sender
		@receiver = receiver
		@amount = amount
		@status = "pending"
	end 

	def valid?
		outcome = nil
		if(@sender.valid? && @receiver.valid? && @sender.balance >= @amount)
			outcome = true
		else
			@status = "rejected"
			outcome = false
		end
		outcome
	end

	def execute_transaction
		if(valid? && @status == "pending")
			@receiver.deposit(@amount)
			@sender.balance -= @amount
			@status = "complete"
		else
		    "Transaction rejected. Please check your account balance."
		end
	end

	def reverse_transfer
		if(@status == "complete")
			@receiver.balance -= @amount
			@sender.deposit(@amount)
			@status = "reversed"
		end
	end
end
