class BankAccount

  attr_reader :name, :balance
  attr_accessor :balance, :status
  @@accounts = []

  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
    @@accounts << self

  end

  def valid?
    return true if @status == "open" && @balance > 0
    false
  end

  def deposit(amount)
    @balance = @balance + amount
  end
  def display_balance
    "Your balance is $#{@balance}."
  end
  def close_account
    self.status = "closed"
  end

end
