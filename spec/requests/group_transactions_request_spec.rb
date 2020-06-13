require 'rails_helper'

RSpec.describe 'GroupTransactions', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/group_transactions/index'
      expect(response).to have_http_status(:success)
    end
  end
end
