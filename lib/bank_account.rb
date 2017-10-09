class BankAccount
  attr_accessor :balance, :status
  attr_reader :name
  @@all = []

  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
    @@all << self
  end

  def name
    @name.dup.freeze
  end

  def deposit(deposit_amount)
    @balance += deposit_amount
  end

  def display_balance
    "Your balance is $#{@balance}."
  end

  def valid?
    if @status == "open" && @balance > 0
      return true
    else
      false
    end
  end

  def close_account
    @status = "closed"
  end

  def self.all
    @@all
  end
end
