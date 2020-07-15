class BankAccount
  attr_accessor  :status, :balance
  attr_reader :name 
  
  def initialize(name)
    @name = name
    @status = "open"
    @balance = 1000 
  end

  def deposit(amount)
    @balance += amount
  end

  def display_balance
    "Your balance is $#{@balance}."
  end
  
  def valid?
    if @status == "open" && balance > 0
      return true
    else
      return false
    end
  end
  
  def withdraw(amount)
    @balance -=amount if balance > amount 
  end
  
  def close_account
    @status = "closed" 
  end
  
end
