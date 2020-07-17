class Atention < ApplicationRecord
  belongs_to :technologist, optional: true
  belongs_to :business
  belongs_to :user

  enum channel: { linea: 0, buzon: 1}
end
