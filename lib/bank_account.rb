class BankAccount

  attr_accessor :status, :balance
  attr_reader :name

  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
  end

  def deposit(deposit)
    @balance = @balance + deposit
    @balance

  end

  def display_balance
    "Your balance is $#{@balance}."
  end

  def valid?
    if @balance > 0 && @status == "open"
      return true
    else false
    end
  end

  def close_account
    @status = "closed"
    @balance = 0
  end



end
