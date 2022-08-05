class Hmanrating < ApplicationRecord
  belongs_to :language, class_name: "Language",foreign_key: "selX3"
  belongs_to :hangman, foreign_key: "GId"
end
