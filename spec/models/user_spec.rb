require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it "is valid with valid attributes" do
      user1 = User.new(name: 'beatrice', email: 'bea@bea.bea', password_digest: 'q24nlq2k45')
      expect(user1).to be_valid
    end
    it "is invalid without a password"
    it "is invalid without password_validation"
  end
end
