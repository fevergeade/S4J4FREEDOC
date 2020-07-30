class Patient < ApplicationRecord
  has_many :appointments
  belongs_to :city
  has_many :doctors, through: :appointments
end
