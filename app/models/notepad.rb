class Notepad < ApplicationRecord
  belongs_to :language1, class_name: "Language", foreign_key: 'lang1'
  belongs_to :language2, class_name: "Language", foreign_key: 'lang2'
end
