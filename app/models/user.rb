class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  validates :role, presence: true, inclusion: { in: %w[barber client] }

  # Barber-specific methods
  def barber?
    role == 'barber'
  end

  def client?
    role == 'client'
  end

  # Additional methods or associations can be added for barbers, if necessary
end
