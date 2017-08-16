class BankAccount

  attr_accessor :balance, :status
  attr_reader :name



  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
  end

  def deposit(deposit)
    self.balance += deposit
  end

  def display_balance
    "Your balance is $#{@balance}."
  end

  def close_account
    self.status = "closed"
  end

  def valid?
    self.status == "open" && self.balance > 0 ? true : false
  end

  def Transfer(sender, receiver, amount)
    transfer = Transfer.new(sender, receiver, amount)
  end

end
