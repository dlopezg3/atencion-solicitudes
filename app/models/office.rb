class Office < ApplicationRecord
  belongs_to :region
  has_many :technologists
end
