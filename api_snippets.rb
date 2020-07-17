require 'rspec/core'
require_relative 'spec/unit/app/api_spec.rb'
require 'sinatra/base'

class Ledger
  def record(_expense)
    ExpenseTracker::RecordResult.new
  end
end

class API < Sinatra::Base
  def initialize(ledger: Ledger.new) # helping the callers 
    @ledger = ledger
    super()
  end
end

# Pseudocode for what happens inside the API class
result = @ledger.record({ 'some' => 'data'})
result.success? #=> Boolean
result.expense_id #=> number
result.error_message #=> string or nil