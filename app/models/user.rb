class User < ApplicationRecord
  has_secure_password
  has_many :favorites

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :api_key, uniqueness: true
  validates :password, presence: true, confirmation: true, on: :create

  before_create :generate_api_key

  private

  def generate_api_key
    self.api_key = SecureRandom.hex(10)
  end
end
