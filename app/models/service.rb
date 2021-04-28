class Service < ApplicationRecord
  belongs_to :provider

  has_one_attached :photo
end
