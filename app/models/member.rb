class Member < ApplicationRecord
has_and_belongs_to_many :languages, :join_table => :member_languages
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
attr_accessor :"selX3", :selX6,:selX4,:selIsWantTextChat,:selX13,:selIsWantFace,:selIsClass,:txaDescr,:hidsUID,:txtUID,:pasPassw,:pasPassw_2,:txtPasswRem,:txtEmail,:txtEmail2
end
