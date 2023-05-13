class HangmanController < ApplicationController
  protect_from_forgery except: [:create,:play,:publish,:play1,:fbk,:replysent]
  
  before_action :authenticate_member!, only: [:publish], notice: 'Sorry, this area is for members only.'
  before_action :authenticate_member!, only: [:reply]
  def fbk
    @hangman=Hangman.find(params[:GId])
    @rating=Hmanrating.new(fbk_params.merge({:member_id => current_member.try(:id)}))
    @rating.save
    #fbk_params
  end
  def list
    @languages=Language.all.myhangmen
  end
  def seeall
    @languages=Language.all.myhangmen
  end
  def reply
    @rating=Hmanrating.myrating(params[:MId])
    @hangman=@rating.hangman
  end
  def replysent
    @comment=Hmancomment.new(comment_params.merge({member_id: current_member.try(:id)}))
    @comment.save
  end
  def languagelist
    @language=Language.find(params[:x3]) rescue nil
    @types=Hangmantype.all.myhangmen(@language.id)
    
  end
  def cat1
    @language=Language.find(params[:x3]) rescue nil
    @type=Hangmantype.find(params[:Cat1])
    @categories=Hangmancat.all.myhangmen(params[:x3],params[:Cat1])
    
  end
  def cat2
    @language=Language.find(params[:x3]) rescue nil
    @type=Hangmantype.find(params[:Cat1])
    @category=Hangmancat.find(params[:Cat2])
    @hangmen=Hangman.where(myhangmancat:@category,myhangmantype:@type,mylanguage:@language).withratings
  end
  def relg
     @hangman=Hangman.find(params[:GId])
  end
  def ratings
    @hangman=Hangman.ratings(params[:GId])
    @ratings=@hangman.myratings(params[:Cnt])
  end
  def member
    @member=Member.find(params[:UId])
    @hangmen=@member.hangmen.sortby(params[:Sort])
  end
  def new
     @hangman=Hangman.new
     @hangman.hidGId = params[:GId]
     @hangman.hidPnum = "0"
     @hangman.initialize_with_id
  end
  def listgames
    
  end
  def index
    @hangmen=current_member.hangmen
  end
  def create
    @hangman=Hangman.new(myparams)
    if myparams[:hidPnum] == "1" && @hangman.valid?
      @hangman.initialize_with_id
      render :secondpart
    elsif myparams[:hidPnum] == "1" && !@hangman.valid?
      render :new
    elsif myparams[:hidPnum] == "2" && @hangman.valid?
      @hangman.initialize_with_id
      render :thirdpart
    elsif myparams[:hidPnum] == "2" && !@hangman.valid?
      @hangman.initialize_with_id
      render :secondpart
    elsif myparams[:hidPGID]
      p "same as other"
      @hangman.initialize_with_other
      render :new
    elsif myparams[:hidGId] == ""
      @hangman.initialize_with_new
      render :new

    end
  end
  def play
#    @hangman=Hangman.find(myparams[:hidGId]) rescue nil
#    if @hangman
#      @hangman.update(myparams)
#    else
    @hangman=Hangman.new(myparams) #if !@hangman
    
    @hangman.valid?
    @hangman.initialize_with_id
    if @hangman.win? || @hangman.lose?
      @hangman.mywinlosevalues
    end
#    @hangman.save
#    end

    
  end
  def play1
#    @hangman=Hangman.find(myparams[:hidGId]) rescue nil
#    if @hangman
#      @hangman.update(myparams)
#    else
    @hangman=Hangman.find(params[:GId]) #if !@hangman
    
    @hangman.update(playparams.merge(hidGuess: @hangman.guess,:PlayerGuess => params[:PlayerGuess].to_s))

    render :play
#    @hangman.save
#    end

    
  end

  def publish
    
    @hangman=Hangman.new(myparams.merge({member_id: current_member.try(:id)})) #if !@hangman
    if @hangman.hidGId.empty?
    @hangman.save
    else
      @hangman=Hangman.find(@hangman.hidGId)
      
      @hangman.update(myparams)
    end
  end
  private
  def fbk_params
    params.permit(:chkSameX3,"txtGuess", "selX3", "radRating", "txaFBKComments",:GId)
  end
  def myparams
    params.permit(:hidPGID,:hidPlayerGuessAll, :hidnumWrongGuesses, :hidHintsAll,:PlayerGuess,:txtWinMsg, :txtLoseMsg,:txaDesc, :txtEquiv1, :txtEquiv2, :txtEquiv3,:txtHint1, :txtHint2,:txtHint3,:hidPnum,:chkHide1, :chkHide2, :chkHide3, :chkHide4, :chkHide5, :chkHide6, :chkHide7, :chkHide8, :chkHide9, :chkHide10, :chkHide11, :chkHide12, :chkHide13, :chkHide14, :chkHide15, :chkHide16, :chkHide17, :chkHide18, :chkHide19, :chkHide20, :chkHide21, :chkHide22, :chkHide23, :chkHide24, :chkHide25, :chkHide26, :chkHide27, :chkHide28, :chkHide29, :chkHide30, :chkHide31, :chkHide32, :chkHide33, :chkHide34, :chkHide35, :chkHide36, :chkHide37, :chkHide38, :chkHide39, :chkHide40,"txtTitle", "txtGuess", "selX3", "selCat1", "selCat2",:hidTitle,:hidGuess,:hidPGuess,:hidPTitle,:hidPGid,:hidEditMode,:hidGId,:hidHide,:hidTitle,:hidX3,:hidCat1,:hidCat2,:hidHint1,:hidHint2,:hidHint3,:hidEquiv1,:hidEquiv2,:hidEquiv3,:hidDesc,:hidWinMsg,:hidLoseMsg,:hidGId,:hidPTitle,:hidPGuess,:hidPGId,:hidPnum,"txtTitle", "txtGuess", "selX3", "selCat1", "selCat2",:chkHide1, :chkHide2, :chkHide3, :chkHide4, :chkHide5, :chkHide6, :chkHide7, :chkHide8, :chkHide9, :chkHide10, :chkHide11, :chkHide12, :chkHide13, :chkHide14, :chkHide15, :chkHide16, :chkHide17, :chkHide18, :chkHide19, :chkHide20, :chkHide21, :chkHide22, :chkHide23, :chkHide24, :chkHide25, :chkHide26, :chkHide27, :chkHide28, :chkHide29, :chkHide30, :chkHide31, :chkHide32, :chkHide33, :chkHide34, :chkHide35, :chkHide36, :chkHide37, :chkHide38, :chkHide39, :chkHide40,:videos_attributes=>{},:myvideos=>[])
  end
  def playparams
    params.permit(:hidPlayerGuessAll, :hidnumWrongGuesses, :hidHintsAll,:PlayerGuess,:hidGuess)
  end
  def comment_params
    params.permit("txaCmts",:MId,:member_id)
  end
end
