# class API < Sinatra::Base
#   def initialize
#     @ledger = Ledger.new
#     super() #rest of initialization from Sinatra
#   end
# end

# # Later, callers do this:
# app = API.new

# class API < Sinatra::Base
#   def initialize(ledger:)
#     @ledger = ledger
#     super() #rest of initialization from Sinatra
#   end
# end

# # Later, callers do this:
# app = API.new(ledger: Ledger.new) #dependency injection
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