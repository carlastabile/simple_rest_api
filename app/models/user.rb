class User < ApplicationRecord
  has_many :pets

  #Validate model fields
  validates :username, presence: true
  validates :password, presence: true, length: { in: 6..20 }
end
