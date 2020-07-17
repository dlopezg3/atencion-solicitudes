class Region < ApplicationRecord
  has_many :offices
  has_many :technologists, through: :offices
end
