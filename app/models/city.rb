class City < ApplicationRecord
  belongs_to :country,optional:true
  def self.bigcities
    all
  end
end
