class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 4 }
  validates :isAdmin, inclusion: { in: [true, false] }

  has_many :characters, foreign_key: 'id_user'
end
