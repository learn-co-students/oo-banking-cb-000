class BankAccount
  # can't change its name
  attr_reader :name
  attr_accessor :balance, :status

   # can initialize a Bank Account
   # initializes with a name
   # always initializes with balance of 1000
   # always initializes with a status of 'open'
   def initialize(name)
     @name = name
     @balance = 1000
     @status = 'open'
   end

   # can deposit money into its account
   def deposit(deposit_amount)
     @balance = @balance + deposit_amount
   end

   # can display its balance
   def display_balance
     "Your balance is $#{balance}."
   end

   # is valid with an open status and a balance greater than 0
   def valid?
     status == 'open' && balance > 0 ? true : false
   end

   # can close its account
   def close_account
   end
end
