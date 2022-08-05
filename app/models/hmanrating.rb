class Hmanrating < ApplicationRecord
  belongs_to :language, class_name: "Language",foreign_key: "selX3"
  belongs_to :hangman, foreign_key: "GId"
  belongs_to :member,optional:true
  def self.myrating(myid)
        Hmanrating.where("hmanratings.Id" => myid).left_joins(:member).select("hmanratings.*,members.firstname as membername").having('hmanratings.radRating is not null').group("hmanratings.id")[0]

  end

end
