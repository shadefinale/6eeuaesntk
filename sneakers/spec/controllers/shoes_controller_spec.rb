require 'rails_helper'

describe ShoesController do
  context 'shoes happy path' do
    it 'should not render new shoe template if valid' do
      new_user = create(:user)
      post :create, shoe: attributes_for(:shoe, user: new_user), user_id: new_user.id
      expect(response).not_to render_template(:new)
    end

    it 'should create a new shoe if valid' do
      new_user = create(:user)
      expect do
        post :create, shoe: attributes_for(:shoe, user: new_user), user_id: new_user.id
      end.to change(Shoe, :count).by(1)
    end
  end

  context 'shoes sad path' do
    it 'should render new shoe template if invalid' do
      new_user = create(:user)
      post :create, shoe: attributes_for(:shoe, user: new_user, brand: ""), user_id: new_user.id
      expect(response).to render_template(:new)
    end

    it 'should not create a new shoe if invalid' do
      new_user = create(:user)
      expect do
        post :create, shoe: attributes_for(:shoe, user: new_user, brand: ""), user_id: new_user.id
      end.to change(Shoe, :count).by(0)
    end
  end
end
