require 'rack/test'
require 'json'
require_relative '../../app/api.rb'

module ExpenseTracker
  describe "Expense tracker API" do
    include Rack::Test::Methods

    def app
      ExpenseTracker::API.new
    end

    it "records submitted expenses" do
      coffee = {
        'payee' => 'Starbucks',
        'amount' => 5.75,
        'date' => '2019-06-10'
      }
      post '/expenses', JSON.generate(coffee)
    end
  end
end
