require_relative './lib/bank_account'
require_relative './lib/transfer'

require 'pry'
require 'rake'

puts "Welcome to Backing and Transfer"

def reload!
  load "./lib/bank_account.rb"
  load "./lib/transfer.rb"
end

desc "A Console: rake console"
task :console do
  Pry.start
end
