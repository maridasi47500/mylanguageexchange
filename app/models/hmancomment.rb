class Hmancomment < ApplicationRecord
  belongs_to :member
  belongs_to :hmanrating,foreign_key:"MId"
end
