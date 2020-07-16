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
      # assuminng we'll be posting some key - value pairs to the /expenses endpoint. we'll support sending and receiving data in JSON format. Because JSON objects convert to ruby hashes with string keys, we'l  use string keys in our example
      expect(last_response.status).to eq(200)
      parsed = JSON.parse(last_response.body)
      expect(parsed).to include('expense_id' => a_kind_of(Integer))
    end
  end
end
