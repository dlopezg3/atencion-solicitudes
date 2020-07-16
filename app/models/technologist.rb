class Technologist < ApplicationRecord
  belongs_to :office
  has_many :atentions
end
