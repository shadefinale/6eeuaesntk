require 'rails_helper'

describe Shoe do
  context 'shoe validations' do
    it 'should pass by default' do
      expect(build(:shoe)).to be_valid
    end

    it 'should fail without a brand' do
      expect(build(:shoe, brand: "")).to be_invalid
    end

    it 'shold fail without a model' do
      expect(build(:shoe, model: "")).to be_invalid
    end

    it 'should fail without a year' do
      expect(build(:shoe, year: "")).to be_invalid
    end

    it 'should fail without a purchase_date' do
      expect(build(:shoe, purchase_date: nil)).to be_invalid
    end
  end
end
