class BankAccount
  attr_reader :name
  attr_accessor :balance, :status

  @@all = [ ]

  #Initializes a bank account with a name, a balance of 1000, and "open" status, but
  #can't change its name
  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
    @@all << self

  end 

  #can deposit money into its account
  def deposit(amount)
     @balance = self.balance + amount
  end 

  #can display its balance
  def display_balance 
    "Your balance is $#{self.balance}."
  end 

  def self.all
    @@all 
  end 

  #The valid? method checks to see if the account is valid with an open 
  #status and a balance greater than 0
  def valid?
    self.status == "open" && self.balance > 0

  end

  

  #can close its account
  def close_account
    self.status = "closed"
  end 

end
