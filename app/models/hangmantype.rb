class Hangmantype < ApplicationRecord
  translates :name
  has_many :hangmen,class_name:"Hangman",foreign_key:"types"
  def self.myhangmen(lang)
    left_joins(:hangmen).select("hangmantypes.*, (select count(h.id) from hangmen h where h.language = '#{lang}' and h.types = hangmantypes.id) as nbhangmen").group("hangmantypes.id")
  end

end
