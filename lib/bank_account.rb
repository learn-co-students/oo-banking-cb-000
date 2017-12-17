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
end
