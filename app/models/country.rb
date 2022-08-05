class Country < ApplicationRecord
  translates :name
  has_many :cities
end
