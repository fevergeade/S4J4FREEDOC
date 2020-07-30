class Speciality < ApplicationRecord
  has_many :join_doc_specs
  has_many :doctors, through: :join_doc_specs
end
