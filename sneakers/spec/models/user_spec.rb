require 'rails_helper'

describe User do
  context 'length validations' do
    it 'should fail if username too short' do
      new_user = build(:user, username: "11111")
      expect(new_user).to be_invalid
    end

    it 'should fail if username not too short' do
      new_user = build(:user, username: "111111")
      expect(new_user).to be_valid
    end

    it 'should fail if username too long' do
      new_user = build(:user, username: "1" * 21)
      expect(new_user).to be_invalid
    end

    it 'should fail if username too long' do
      new_user = build(:user, username: "1" * 20)
      expect(new_user).to be_valid
    end
  end
end
