class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  # Example: Check if user is a barber
  def barber?
    role == 'barber'
  end

  # Example: Check if user is a client
  def client?
    role == 'client'
  end
end
