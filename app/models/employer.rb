class Employer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  attr_accessor :hidProc, :hidEmail, :hidPassword,"txtEmail", "pasPassword1", "pasPassword2"
  attr_accessor :hidTotal,:hidEmail,:hidProdName,:hidProdType,:hidActURL,:hidCancelURL
  before_validation :myparams
  belongs_to :country,optional:true,foreign_key:"hidCountry"
  def genorder
    self.hidTotal=10
    self.hidEmail=self.email
    self.hidProdName=self.hidTitle
    self.hidProdType="Job Ad Lasting 30 Days" 
  self.hidProdID=self.id
  self.hidActURL = "/JobsOrderActivate.asp"
  self.hidCancelURL="/Jobs.asp"
  end
  def myparams
    self.email=self.hidEmail
    if self.pasPassword1
    if self.pasPassword1 == self.pasPassword2
      self.password=self.pasPassword1
    else
      self.errors.add(:password)
    end
    end
    if self.hidPassword
      self.email=self.hidEmail
      self.password=self.hidPassword
    end
  end
end
