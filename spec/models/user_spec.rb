require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
    it { should validate_uniqueness_of(:api_key) }
    it { should validate_presence_of(:password).on(:create) }
    it { should validate_confirmation_of(:password).on(:create) }
  end

  describe 'associations' do
    it { should have_many(:favorites) }
  end
end
