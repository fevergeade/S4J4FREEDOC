class Doctor < ApplicationRecord
  has_many :appointments
  has_many :patients, through: :appointments
  belongs_to :city
  has_many :join_doc_specs
  has_many :specitalities, through: :join_doc_specs
end
