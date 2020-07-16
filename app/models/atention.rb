class Atention < ApplicationRecord
  belongs_to :technologist, optional: true
  belongs_to :business

  enum channel: { linea: 0, buzon: 1}
end
