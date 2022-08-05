class Member < ApplicationRecord
has_and_belongs_to_many :native_languages, class_name:"Language",:join_table => :member_native_languages
has_and_belongs_to_many :practice_languages, class_name:"Language", :join_table => :member_practice_languages
validates :txtEmail, format: { with: URI::MailTo::EMAIL_REGEXP }
belongs_to :country, optional: true
has_many :hangmen
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable
  def self.search(selX3, selX6, selCountry, txtCity, txtAgeMin, txtAgeMax, selGender, selIsClass, selX4, selTxtChat, selX13, selFace, txtFName, txtDesc, selOrder, txtSrchName, nRows)
    []
  end
  def semifullname
    firstname+" "+lastname[0]+"."
  end
  def firstname_initial
    firstname+" "+lastname[0]+"."
  end
  def fullname
    firstname+" "+lastname
  end
  def mygender
    case hidGender
    when "0"
      "Female"
    when "1"
      "Male"
    when "2"
      "Other"
      
    end
    
  end
  #,
  #       :recoverable, :rememberable, :validatable
 attr_accessor "selX3", "selX6", "selCountry", "txtCity", "txtAgeMin", "txtAgeMax", "selGender", "selIsClass", "selX4", "selTxtChat", "selX13", "selFace", "txtFName", "txtDesc", "selOrder", "txtSrchName", "nRows"
attr_accessor :txtAgeMin,:txtAgeMax,:selX3a, :selX3b,:selX3c,:selX6a,:selX6b,:selX6c, :"selX3", :selX6,:selX4,:selIsWantTextChat,:selX13,:selIsWantFace,:selIsClass,:txaDescr,:hidsUID,:txtUID,:pasPassw,:pasPassw_2,:txtPasswRem,:txtEmail,:txtEmail2,:txtNStudents
attr_accessor :txtFN, :txtLN, :selWantNews, :selWantAds,:selMemberAgree,:selTimeZ,:txtLoc,:txtAge,:hidProc,:selCountry
attr_accessor :hidGender,:hidIsClass,:hidNStudents,:selNStudents,:hidEmail,:hidEmail2,:hidDescr,:hidX3,:hidX3a,:hidX3b,:hidX3c,:hidX6,:hidX6a,:hidX6b,:hidX6c,:hidX4,:hidX13,:hidIsWantTextChat,:hidIsWantFace,:hidsUID,:hidPassw,:hidPassw_2,:hidPasswRem,:hidEditPro,:hidProc,:showmenu
attr_accessor :hidX3a, :hidX3b,:hidX3c,:hidX6a,:hidX6b,:hidX6c, :"hidX3", :hidX6
  attr_accessor :selIsClass,:selNStudents,:selNStudents,:selEmail,:selEmail2,:selDescr,:selX3,:selX3a,:selX3b,:selX3c,:selX6,:selX6a,:selX6b,:selX6c,:selX4,:selX13,:selIsWantTextChat,:selIsWantFace,:selsUID,:selPassw,:selPassw_2,:selPasswRem,:selEditPro,:selProc,:showmenu
attr_accessor :txtIsClass,:txtNStudents,:txtNStudents,:txtEmail,:txtEmail2,:txtDescr,:txtX3,:txtX3a,:txtX3b,:txtX3c,:txtX6,:txtX6a,:txtX6b,:txtX6c,:txtX4,:txtX13,:txtIsWantTextChat,:txtIsWantFace,:txtsUID,:txtPassw,:txtPassw_2,:txtPasswRem,:txtEditPro,:txtProc,:showmenu
  after_initialize do
  self.selIsClass ||= "false"
  self.selWantNews ||= "true"
  self.selWantAds ||= "true"
  self.selMemberAgree ||= "true"
      [:hidIsClass,:hidNStudents,:hidEmail,:hidEmail2,:hidDescr,:hidX3,:hidX3a,:hidX3b,:hidX3c,:hidX6,:hidX6a,:hidX6b,:hidX6c,:hidX4,:hidX13,:hidIsWantTextChat,:hidIsWantFace,:hidsUID,:hidPassw,:hidPassw_2,:hidPasswRem,:hidEditPro,:hidProc,:showmenu].each do |param|
        
        self.send("#{param.to_s}=", self.send(param.to_s.gsub('hid','sel'))) if !self.send("#{param.to_s}")
        self.send("#{param.to_s}=", self.send(param.to_s.gsub('hid','txt'))) if !self.send("#{param.to_s}")
      end
[:hidIsClass,:hidNStudents,:hidEmail,:hidEmail2,:hidDescr,:hidX3,:hidX3a,:hidX3b,:hidX3c,:hidX6,:hidX6a,:hidX6b,:hidX6c,:hidX4,:hidX13,:hidIsWantTextChat,:hidIsWantFace,:hidsUID,:hidPassw,:hidPassw_2,:hidPasswRem,:hidEditPro,:hidProc,:showmenu].each do |param|
        
        self.send("#{param.to_s.gsub('hid','sel')}=", self.send(param.to_s)) if !self.send("#{param.to_s.gsub('hid','sel')}")
        self.send("#{param.to_s.gsub('hid','txt')}=", self.send(param.to_s)) if !self.send("#{param.to_s.gsub('hid','txt')}")
      end
end
before_validation :mymember

  def mymember
        [:hidX3a, :hidX3b, :"hidX3",:hidX3c].each do |langue|
    language = Language.find(langue)
    next if !language
    self.native_languages.push(language)
    rescue => e
        p e.message
        next
      end
      [:hidX6b,:hidX6c, :hidX6,:hidX6a].each do |langue|
    language = Language.find(langue)
    next if !language
    self.practice_languages.push(language)
    rescue => e
        p e.message
        next
      end
    self.email=self.txtEmail
    self.password=self.pasPassw
  	self.description=self.txaDescr
    self.by_email=self.selX4
    self.text_chat=self.selIsWantTextChat
    self.voice_chat=self.selX13
    self.in_person=self.selIsWantFace
    self.teacher=self.selIsClass

    self.firstname=self.txtFN
    self.lastname=self.txtLN
    self.age=self.txtAge
    self.city=self.txtLoc
    self.country_id=self.selCountry
    self.timezone=self.selTimeZ

    self.ads=self.selWantAds
    self.news=self.selWantNews

      if self.hidProc == "1" 
          self.hidEmail =self.txtEmail
    self.hidPassw=self.pasPassw
  	self.hidDescr=self.txaDescr
    self.hidX4=self.selX4
    self.hidIsWantTextChat=self.selIsWantTextChat
    self.hidX13=self.selX13
    self.hidIsWantFace=self.selIsWantFace
    self.hidIsClass=self.selIsClass
          self.errors.add(:"txtNStudents") if self.selIsClass ==  "true" && self.txtNStudents.empty?
      ["txaDescr", "txtEmail","pasPassw"].each do |param|
        self.errors.add(:"#{param}") if self.send(param).empty?
      end
      lengthpass=self.send("pasPassw").try(:length).to_i
             self.errors.add(:"pasPassw") if !(lengthpass >= 4 && lengthpass <= 12)
             self.errors.add(:"pasPassw_2") if (self.send("pasPassw") != self.send("pasPassw_2"))
             self.errors.add(:"txtEmail2") if (self.send("txtEmail") != self.send("txtEmail2"))

      end
      if self.hidProc == "2"
        
          self.email=self.hidEmail
    self.password=self.hidPassw
  	self.description=self.hidDescr
    self.by_email=self.hidX4
    self.text_chat=self.hidIsWantTextChat
    self.voice_chat=self.hidX13
    self.in_person=self.hidIsWantFace
    self.teacher=self.hidIsClass

    self.firstname=self.txtFN
    self.lastname=self.txtLN
    self.age=self.txtAge
    self.city=self.txtLoc
    self.country_id=self.selCountry
    self.timezone=self.selTimeZ

    self.ads=self.selWantAds
    self.news=self.selWantNews
      end
      
    end
  
end
