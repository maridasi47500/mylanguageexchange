class Hangmancat < ApplicationRecord
  translates :name
  has_many :hangmen,class_name:"Hangman",foreign_key:"category"
  def self.myhangmen(lang,type)
    left_joins(:hangmen).select("hangmancats.*, (select count(distinct h.id) from hangmen h where h.language = '#{lang}' and h.types = '#{type}' and h.category = hangmancats.id) as nbhangmen").group("hangmancats.id")
  end
end
