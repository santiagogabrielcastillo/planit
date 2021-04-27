class CreditCard < ApplicationRecord
  belongs_to :user

  validates :number, :name, :expire, presence: true
  validates :number, length: { minimum: 16 }
end
