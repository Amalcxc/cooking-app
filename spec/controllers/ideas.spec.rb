require 'rails_helper'
require_relative '../support'

RSpec.describe IdeasController do
  before(:all) { @user = User.create(name: 'NewUser', username: 'Newuser', email: 'user@example.com', password: '1234567',password_confirmation: '1234567') }

  describe 'GET welcome' do
    it 'redirect to the Homepage template' do
      log_in(@user)

      get :index
      expect(response).to redirect_to('/welcome')
    end
  end
end