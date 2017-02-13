class BankAccount

	attr_reader :name
	attr_accessor :balance, :status

	def initialize(name)
		@name = name
		@balance = 1000
		@status = "open"
	end

	def deposit(amount)
		@balance += amount
	end

	def display_balance
		"Your balance is $#{@balance}."
	end

	def valid?
		status = nil
		if(@status == "open" && @balance > 0)
			status = true
		else
			status = false
		end
		status
	end

	def close_account
		@status = "closed"
		@balance = 0
	end

end
