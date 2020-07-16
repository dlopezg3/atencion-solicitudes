class Requirement < ApplicationRecord
  belongs_to :requirement_type
  has_many :atentions
end
