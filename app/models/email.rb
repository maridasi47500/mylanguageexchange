class Email < ApplicationRecord
  belongs_to :expediteur, optional: true, class_name:"Member"
  belongs_to :destinataire, optional: true, class_name:"Member",foreign_key:"UId"
  def self.lastmsg(member)
    where(expediteur_id: member.try(:id)).last
  end
end
