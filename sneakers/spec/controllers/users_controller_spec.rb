require 'rails_helper'

describe UsersController do

  context '#show' do
    let(:user) { create(:user) }
    it 'should redirect to new user path if not logged in' do
      create(:user)
      get :show, id: 1
      expect(response).to redirect_to(new_user_path)
    end

    it 'should raise error if no id passed' do
      create(:user)
      expect{get :show}.to raise_error

    end
  end
end
