class BankAccount
  attr_accessor :balance, :status
  attr_reader :name

  def initialize(name, balance=1000, status="open")
    @name = name
    @balance = balance.to_i
    @status = status
  end

  def deposit(amount)
    @balance = balance.to_i + amount.to_i
  end

  def withdraw(amount)
    @balance = balance.to_i - amount.to_i
  end

  def display_balance
    return "Your balance is $#{@balance}."
  end

  def valid?
    return true if status == "open" && balance.to_i > 0 else return false
  end

  def close_account
    @status = "closed"
  end
end
