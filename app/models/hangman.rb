class Hangman < ApplicationRecord
  attr_accessor :hidPnum,:chkHide1, :chkHide2, :chkHide3, :chkHide4, :chkHide5, :chkHide6, :chkHide7, :chkHide8, :chkHide9, :chkHide10, :chkHide11, :chkHide12, :chkHide13, :chkHide14, :chkHide15, :chkHide16, :chkHide17, :chkHide18, :chkHide19, :chkHide20, :chkHide21, :chkHide22, :chkHide23, :chkHide24, :chkHide25, :chkHide26, :chkHide27, :chkHide28, :chkHide29, :chkHide30, :chkHide31, :chkHide32, :chkHide33, :chkHide34, :chkHide35, :chkHide36, :chkHide37, :chkHide38, :chkHide39, :chkHide40
  attr_accessor "txtTitle", "txtGuess", "selX3", "selCat1", "selCat2"
  attr_accessor :hidPGID,:txtWinMsg, :txtLoseMsg,:txaDesc, :txtEquiv1, :txtEquiv2, :txtEquiv3,:txtHint1, :txtHint2,:txtHint3,:txtWinMsg, :txtLoseMsg,:txaDesc,:hidTitle,:hidGuess,:hidPGuess,:hidPTitle,:hidPGid,:hidEditMode,:hidGId,:hidHide,:hidTitle,:hidX3,:hidCat1,:hidCat2,:hidHint1,:hidHint2,:hidHint3,:hidEquiv1,:hidEquiv2,:hidEquiv3,:hidDesc,:hidWinMsg,:hidLoseMsg,:hidGId,:hidPTitle,:hidPGuess,:hidPGId
  attr_accessor :PlayerGuess,:hidPlayerGuessAll, :hidnumWrongGuesses,:hidHintsAll
  belongs_to :member, optional:true
  has_many :ratings,class_name:"Hmanrating", foreign_key: "GId"

  belongs_to :mylanguage,class_name:"Language",foreign_key:"language",optional:true
  belongs_to :myhangmancat,class_name:"Hangmancat",foreign_key:"category",optional:true
  belongs_to :myhangmantype,class_name:"Hangmantype",foreign_key:"types",optional:true
  before_validation :savevalues
  def self.sortby(sort)
    case sort
    when "Rating"
    
    left_joins(:ratings).select("hangmen.*, hmanratings.radRating as rating, count(hmanratings.radRating) as countrating, avg(hmanratings.radRating) as moyrating").having('countrating is not null').group("hangmen.id").order("moyrating" => :desc)

    else
      order(created_at: :asc).left_joins(:ratings).select("hangmen.*, hmanratings.radRating as rating, count(hmanratings.radRating) as countrating, avg(hmanratings.radRating) as moyrating").having('countrating is not null').group("hangmen.id")

    end
  end
  def moyratings
    Hangman.where("hangmen.id" => self.id).joins(:ratings).select("hangmen.*, hmanratings.radRating as rating, avg(hmanratings.radRating) as moyrating").having('rating is not null').group("hangmen.id")[0].try(:moyrating)
  end
  def mysamplehangman
    if self.hidPGID
    Hangman.find(self.hidPGID) rescue Hangman.new
    else
    Hangman.find(self.hidGId) rescue Hangman.new
    end
  end
  def nbhints
    [self.hint1,self.hint2,self.hint3].select{|h|h.to_s.strip.squish.length > 0}.length
  end
  def win?
    i=-1
    p "guess #{self.guess} , liste des caractères cachés : #{hide}"
    m=self.guess
    k=m.split('')
    p k
    k=k.all? do |f|
      i+=1
      p i
      p "lettre #{f}"
      p hide[i] == '1' ? "caché" : "visible"
      p self.hidPlayerGuessAll
      p "======="
      p self.hide[i] == "0" || self.hidPlayerGuessAll.to_s.downcase.include?(I18n.transliterate(f.downcase))
      f == " " || self.hide[i] == "0" || self.hidPlayerGuessAll.to_s.downcase.include?(I18n.transliterate(f.downcase))
    
    end
    p self.hidPlayerGuessAll
    p "win"
    p self.hidnumWrongGuesses.to_i <= 6 && k
     self.hidnumWrongGuesses.to_i <= 6 && k
  end
  def lose?
    p "lose"
    p self.hidnumWrongGuesses.to_i == 6 && !self.win?
    self.hidnumWrongGuesses.to_i == 6 && !self.win?
  end
  def samplelanguage
    hiddenlanguage.try(:name) || mysamplehangman.mylanguage.try(:name)
  end
  def sampletype
    hiddentype.try(:name) || mysamplehangman.myhangmantype.try(:name)
  end
  def hiddencat
    Hangmancat.find(hidCat2) rescue nil
  end
  def hiddentype
    Hangmantype.find(hidCat1) rescue nil
  end
  def hiddenlanguage
    Language.find(hidX3) rescue nil
  end
  def samplecat
    hiddencat.try(:name) || mysamplehangman.myhangmancat.try(:name)
  end
  def playing?
    p "playing"
    p self.hidnumWrongGuesses.to_i < 6
    self.hidnumWrongGuesses.to_i < 6
  end
  def nbequiv
    [self.equiv1,self.equiv2,self.equiv3].select{|h|h.to_s.strip.squish.length > 0}.length
  end
  def guess
    read_attribute(:guess) || self.hidGuess
  end
  def hide
    read_attribute(:hide) || self.hidHide
  end
  def useletter(a)
    self.hidPlayerGuessAll.to_s.downcase.include?(I18n.transliterate(a))
  end
  def initialize_with_new
    self.txtTitle =self.hidTitle
    self.txtGuess =self.hidGuess
    self.selX3 =self.hidX3
      self.selCat1 =self.hidCat1
        self.selCat2 =self.hidCat2
  end

  def initialize_with_other
    other=Hangman.find(self.hidPGID) rescue nil
    if other
    self.txtGuess =self.hidGuess
    self.selX3 =self.hidX3
      self.hidCat1 =other.types
      self.selCat1=other.types
      self.hidCat2 =other.category
        self.selCat2=other.category
    end
  end
  def initialize_with_id
    other=Hangman.find(self.hidGId) rescue nil
    if other
    case self.hidPnum
    when "0"
    self.hidTitle =other.title
    self.txtTitle =other.title
    self.hidGuess =other.guess
    self.txtGuess =other.guess
    self.hidX3 =other.language
    self.selX3 =other.language
      self.hidCat1 =other.types
      self.selCat1=other.types
      self.hidCat2 =other.category
        self.selCat2=other.category

    when "1"
(0..39).to_a.each do |x|
  
  if other.hide[x] == "1" 
    self.send("chkHide#{x+1}=","true") 
    else 
  self.send("chkHide#{x+1}=","false")
  end
end
    when "2"
        self.txtHint1 =other.hint1
        self.txtHint2 =other.hint2
        self.txtHint3 =other.hint3
        self.txaDesc =other.desc
      self.txtEquiv1 =other.equiv1
        self.txtEquiv2 =other.equiv2
        self.txtEquiv3 =other.equiv3
        self.txtWinMsg =other.winmsg
        self.txtLoseMsg =other.losemsg
    when "3"
              self.hidHint1 =self.txtHint1
        self.hidHint2=self.txtHint2
        self.hidHint3=self.txtHint3
        self.hidDesc=self.txaDesc
      self.hidEquiv1=self.txtEquiv1
        self.hidEquiv2=self.txtEquiv2
        self.hidEquiv3 =self.txtEquiv3
        self.hidWinMsg=self.txtWinMsg
        self.hidLoseMsg=self.txtLoseMsg

    end
    end
  end
  def savevalues
        

    if self.PlayerGuess.nil?
      
    p "edit profile"
    if self.hidPnum == "1"
      p "1"
    
    self.hidTitle =self.txtTitle
    self.hidGuess =self.txtGuess
    self.guess =self.txtGuess
    self.hidX3 =self.selX3
      self.hidCat1=self.selCat1
      self.hidCat2 =self.selCat2
      p hidHide
      p txtTitle
      p hide
            self.hide ||=self.hidHide
(0..39).to_a.each do |x|
  
  if self.hide[x] == "1" 
    self.send("chkHide#{x+1}=","true") 
    else 
  self.send("chkHide#{x+1}=","false")
  end
end

    elsif self.hidPnum == "2"
      p "2"
      
      hidestr= (1..40).map{|x|self.send("chkHide#{x}") == "true" ? "1" : "0"}.join('')
      self.hidHide=hidestr
        self.txtHint1=self.hidHint1
        self.txtHint2=self.hidHint2
        self.txtHint3=self.hidHint3
        self.txaDesc=self.hidDesc
      self.txtEquiv1=self.hidEquiv1
        self.txtEquiv2=self.hidEquiv2
        self.txtEquiv3=self.hidEquiv3
        self.txtWinMsg=self.hidWinMsg
        self.txtLoseMsg=self.hidLoseMsg
    elsif self.hidPnum == "3"
      p "3"
      self.language=self.hidX3
    self.types=self.hidCat1
    self.guess=self.hidGuess
    self.title=self.hidTitle
    self.category= self.hidCat2
      self.hide=self.hidHide
      self.hint1=self.txtHint1
      self.hidHint1 =self.txtHint1
        self.hint2=self.txtHint2
        self.hidHint2=self.txtHint2
        self.hint3=self.txtHint3
        self.hidHint3=self.txtHint3
        self.desc=self.hidDesc
        self.hidDesc=self.txaDesc
      self.equiv1=self.txtEquiv1
      self.hidEquiv1=self.txtEquiv1
        self.equiv2=self.txtEquiv2
        self.hidEquiv2=self.txtEquiv2
        self.equiv3=self.txtEquiv3
        self.hidEquiv3=self.txtEquiv3
        self.winmsg=self.txtWinMsg
        self.hidWinMsg=self.txtWinMsg
        self.losemsg=self.txtLoseMsg
        self.hidLoseMsg=self.txtLoseMsg
    end
    end
    
  end
  before_save do
    if self.PlayerGuess.nil? || (!self.hidGId.nil? && !self.hidGId.empty?)
        self.language=self.hidX3
    self.types=self.hidCat1
    self.guess=self.hidGuess
    self.title=self.hidTitle
    self.category= self.hidCat2
      self.hide=self.hidHide
      self.hint1=self.hidHint1
      self.hidHint1 =self.hidHint1
        self.hint2=self.hidHint2
        self.hint3=self.hidHint3
        self.desc=self.hidDesc
      self.equiv1=self.hidEquiv1
        self.equiv2=self.hidEquiv2
        self.equiv3=self.hidEquiv3
        self.winmsg=self.hidWinMsg
        self.losemsg=self.hidLoseMsg
    end
  end
  after_update do
    if !self.PlayerGuess.nil? && !self.PlayerGuess.empty?
          
        
      p "choisit une nouvelle lettre"
      self.hidnumWrongGuesses=self.hidnumWrongGuesses.to_i + 1 if !I18n.transliterate(self.hidGuess).downcase.include?(self.PlayerGuess.downcase)
      self.hidPlayerGuessAll = self.hidPlayerGuessAll.to_s + self.PlayerGuess
         
          
  end
  end
  def mywinlosevalues
      self.hint1=self.hidHint1
      self.hidHint1 =self.hidHint1
        self.hint2=self.hidHint2
        self.hint3=self.hidHint3
        self.language =self.hidX3
        self.desc=self.hidDesc
      self.equiv1=self.hidEquiv1
        self.equiv2=self.hidEquiv2
        self.equiv3=self.hidEquiv3
        self.winmsg=self.hidWinMsg
        self.losemsg=self.hidLoseMsg  end
  after_initialize do
    if !self.hidGId.nil? && self.hidGId.empty? && !self.hidPnum.nil?
      p hidGId
    p "this is not an update this is create"
    if self.PlayerGuess.nil?
        p self.hidTitle
    p "title"
    if self.hidTitle == ""
self.hidTitle =self.txtTitle
    end
    end
    p self.hidTitle
    if self.hidPnum == "3"
        self.language=self.hidX3
    self.types=self.hidCat1
    self.guess=self.hidGuess
    self.title=self.hidTitle
    self.category= self.hidCat2
      self.hide=self.hidHide
      self.hint1=self.txtHint1
      self.hidHint1 =self.txtHint1
        self.hint2=self.txtHint2
        self.hidHint2=self.txtHint2
        self.hint3=self.txtHint3
        self.hidHint3=self.txtHint3
        self.desc=self.txaDesc
        self.hidDesc=self.txaDesc
      self.equiv1=self.txtEquiv1
      self.hidEquiv1=self.txtEquiv1
        self.equiv2=self.txtEquiv2
        self.hidEquiv2=self.txtEquiv2
        self.equiv3=self.txtEquiv3
        self.hidEquiv3=self.txtEquiv3
        self.winmsg=self.txtWinMsg
        self.hidWinMsg=self.txtWinMsg
        self.losemsg=self.txtLoseMsg
        self.hidLoseMsg=self.txtLoseMsg
    end
      
    end
      if !self.PlayerGuess.nil? && !self.PlayerGuess.empty?
          
        
      p "choisit une nouvelle lettre"
      self.hidnumWrongGuesses=self.hidnumWrongGuesses.to_i + 1 if !I18n.transliterate(self.hidGuess).downcase.include?(self.PlayerGuess.downcase)
      self.hidPlayerGuessAll = self.hidPlayerGuessAll.to_s + self.PlayerGuess
         
          
  end
  end

  
end

