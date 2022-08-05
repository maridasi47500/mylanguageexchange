class Language < ApplicationRecord
translates :name
  has_many :hangmen,class_name:"Hangman",foreign_key:"language"
  def self.myhangmen
    left_joins(:hangmen).select("languages.*, count(distinct hangmen.id) as nbhangmen").group("languages.id")
  end

end