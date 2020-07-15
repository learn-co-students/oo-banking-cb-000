class BankAccount
  attr_accessor :balance, :status
  attr_reader :name

  def initialize(name)
    @name = name
    @status = "open"
    @balance = 1000
  end

  def deposit(sum)
    @balance += sum
  end

  def display_balance
    return "Your balance is $#{@balance}."
  end

  def valid?
    return false if @balance == 0
    return false if @status == "closed"
    return true
  end

  def close_account
    @status = "closed"
  end

end
