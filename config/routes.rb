Rails.application.routes.draw do
  devise_scope :employer do
    get "JobsAdd.asp",to:"employers/sessions#edit", constraints: lambda { |request| request.params[:Id] }


        patch "JobsAdd.asp",to:"employers/registrations#update"

    get "JobsEdit.asp",to:"employers/registrations#edit"
     get "JobsAdd.asp",to:"employers/registrations#new"
     post "JobsAdd.asp",to:"employers/registrations#create",as: :jobadd

      get "JobsOrder.asp",to:"employers/registrations#order", constraints: lambda { |request| request.params[:Id] }
post "/JobsLogin.asp",to:"employers/sessions#create"

    get "jobsAdd.asp",to:"employers/registrations#new"
    get "JobsDelete.asp",to:"employers/registrations#delete", constraints: lambda { |request| request.params[:Id] }
    post "JobsDelete.asp",to:"employers/registrations#destroy", constraints: lambda { |request| request.params[:Id] }


  end
  get "HManMsgAdd.asp",to:"hangman#reply"
  post "HManMsgAdd.asp",to:"hangman#replysent"
  post "HManFBK.asp",to:"hangman#fbk"
  devise_for :job_seekers, controllers: { registrations: 'job_seekers/registrations', sessions: 'job_seekers/sessions' }
  devise_scope :job_seeker do
    get "Jobs-resumes-Add",to:"job_seekers/registrations#new"
  end
      devise_for :employers, controllers: { registrations: 'employers/registrations', sessions: 'employers/sessions' }

  post "GenOrder.asp",to:"jobs#genorder"
  devise_for :learners, controllers: { sessions: 'learners/sessions' }
  devise_for :teachers, controllers: { sessions: 'teachers/sessions' }
  get 'wordmatch/index'
  get "/Pen-pals/Language/:language.asp",to:"penpals#bylanguage"
  get "Pen-pals/Country/:name.asp",to:"penpals#bycountry"
  get "Hangman.asp",to:"hangman#seeall"
  get "Minfo.asp",to:"emails#myinfo",as: :minfo
  get "MemberInfo.asp",to:"emails#myinfo"
  get "MembShowHistory.asp",to:"emails#previouscontacts"
  get "HmanList.asp",to:"hangman#cat2", constraints: lambda { |request| request.params[:Cat2] && request.params[:Cat1] && request.params[:x3] }
  get "HmanList.asp",to:"hangman#cat1", constraints: lambda { |request| request.params[:Cat1] && request.params[:x3] }
  get "HmanList.asp",to:"hangman#languagelist", constraints: lambda { |request| request.params[:x3] }
  get "HManList.asp",to:"hangman#cat2", constraints: lambda { |request| request.params[:Cat2] && request.params[:Cat1] && request.params[:x3] }
  get "HManList.asp",to:"hangman#cat1", constraints: lambda { |request| request.params[:Cat1] && request.params[:x3] }
  get "HManList.asp",to:"hangman#languagelist", constraints: lambda { |request| request.params[:x3] }

  get "HmanList.asp",to:"hangman#list",as: :hmanlist
  get "HManList.asp",to:"hangman#list"
  get "HManMember.asp",to:"hangman#member"
  get "HManRelG.asp",to:"hangman#relg"
  get "HmanRatings.asp",to:"hangman#ratings",as: :hmanratings
  get "HManRatings.asp",to:"hangman#ratings"
  post "/Minfo.asp",to:"emails#create"
get "CLScatter.asp",to:"wordmatch#index"
get "CLScatter.asp",to:"wordmatch#language1", constraints: lambda { |request| request.params[:x3] }
get "CLScatterPlay.asp",to:"wordmatch#lessonplay", constraints: lambda { |request| request.params[:LessonID] }
get "CLScatterPlay.asp",to:"wordmatch#play", constraints: lambda { |request| request.params[:Lang1ID] && request.params[:Lang2ID] }
post "CLScatterFn.asp",to:"wordmatch#endgame"
get "LessonScatter.asp",to:"wordmatch#choosegame", constraints: lambda { |request|request.params[:IdLang2] && request.params[:IdLang1]}
get "LessonScatter.asp",to:"wordmatch#chooselanguage2", constraints: lambda { |request| request.params[:IdLang1]}
get "Jobs-Listings.asp",to:"jobs#listing"

get "JobsFAQ.asp",to:"jobs#faq"

get "Jobs-resumes-Listings",to:"jobs#resumeslistings"
get "Jobs-Resumes-View.asp?Id=4704",to:"jobs#viewcv"
post "Jobs-Resumes-Add.asp",to:"jobs#preview"
post "Jobs-Resumes-Add.asp",to:"jobs#resumesubmitted"
get "JobsEmployer.asp",to:"jobs#employer"
get "LessonScatter.asp",to:"wordmatch#chooselanguage1"
get "LessonTableEdit.asp",to:"wordmatch#new"
get "LessonTableEdit.asp",to:"wordmatch#edit", constraints: lambda { |request| request.params[:Id]}
get "NotepadAdd.asp",to:"notepad#add", constraints: lambda { |request| request.params[:lang1] && request.params[:lang2]}
get "LessonListMine.asp",to:"wordmatch#seemy"
get "/Teachers/rte/rte/LessonPhraseEdit.asp",to:"teachers#lessonphraseedit"
post "/Teachers/rte/rte/LessonPhraseEdit.asp",to:"teachers#lessonphraseedit"
get "/Teachers/rte/rte/LessonFCardEdit.asp",to:"teachers#lessonfcardedit"
get "/Teachers/rte/rte/LessonMChoiceEdit.asp",to:"teachers#lessonmchoiceedit"
get "/Teachers/rte/rte/LessonEdit.asp?Type=13",to:"teachers#lessonedit13"
get "/Teachers/rte/rte/LessonEdit.asp",to:"teachers#lessonedit"
get "/Teachers/rte/rte/LessonEdit.asp?Type=91",to:"teachers#lessonedit91"
#get "/Teachers/rte/rte/LessonMChoiceView.asp?Id=430"
#get "/Teachers/rte/rte/LessonEdit.asp?demo=1"
#get "/Teachers/rte/rte/LessonView.asp?Type=91&Id=1001"
#get "/Teachers/rte/rte/LessonView.asp?Type=13&Id=579"
#get "Teachers/LessonQuizList.asp"
#get "Teachers/LessonArticleList.asp"
#get "Teachers/FAQsLearner.asp"
#get "Teachers/FAQs.asp"
#get "Teachers/Distance-Education.asp"
#get "Teachers/Distance-Education-Teachers.asp"
#get "Teachers/Jobs.asp"
#get "Teachers/ContactUs.asp"
get "ChatCompanion.asp",to:"language#chatcompanion"
get "NotePadHelp.htm",to:"notepad#help"
get "/Teachers/rte/rte/LessonView.asp",to:"teachers#viewlesson"
get "Teachers/TeacherInfo.asp?uid=21752",to:"teachers#info"
get "Teachers/LessonListTeacher.asp?uid=21752",to:"teachers#lessonslistteacher"
get "Teachers/LessonCreate.asp",to:"teachers#lessoncreate"
get "Teachers/Learner.asp",to:"teachers#learner"
get "NotepadAdd.asp",to:"notepad#add"
get "Notepad.asp",to:"notepad#clublibrary", constraints: lambda { |request| request.params[:show] == "2" && !request.params[:lang1] && !request.params[:lang2] }
get "Notepad.asp",to:"notepad#allmyentries", constraints: lambda { |request| request.params[:show] == "2" && request.params[:lang1] && request.params[:lang2] && request.params[:lang1].to_i == 0 && request.params[:lang2].to_i == 0 }
get "Notepad.asp",to:"notepad#entriestwolanguages", constraints: lambda { |request| request.params[:show] == "2" && request.params[:lang1].to_i > 0 && request.params[:lang2].to_i > 0 }
post "/NotepadAdd.asp",to:"notepad#addentry"
get "Teachers/LessonList.asp",to:"teachers#lessonlistbylanguage", constraints: lambda { |request| request.params[:x3Id] }

get "Teachers/LessonList.asp",to:"teachers#lessonlist"
get "/Teachers/LessonListMine.asp",to:"teachers#mylessons"
get "/Teachers/Default.asp",to:"teachers#findteacher"
get "/Teachers/Search-Learner.asp",to:"teachers#findlearner"
get "/Teachers/Teachers/Default.asp",to:"teachers#bycitycountrylanguage", constraints: lambda { |request| request.params[:txtCity] && request.params[:selX6] && request.params[:selCountry] }
get "/Teachers/Teachers/Default.asp",to:"teachers#bycountryandlanguage", constraints: lambda { |request| request.params[:selX6] && request.params[:selCountry] }
get "/Teachers/Teachers/Default.asp",to:"teachers#bycountry", constraints: lambda { |request| request.params[:selCountry] }
get "/Teachers/Teachers/Default.asp",to:"teachers#bylanguage", constraints: lambda { |request| request.params[:selX6] }

   devise_for :members, controllers: { sessions: 'members/sessions' }
   get "Teachers/HelpHiddenEmail.asp",to:"teachers#hiddenmail"
   get "Teachers/Privacy.asp",to:"teachers#privacypolicy"
devise_scope :learner do
  get "Teachers/LoginLearner.asp",to:"learners/sessions#new"
  get "teachers/LoginLearner.asp",to:"learners/sessions#new"
  get "/Teachers/LearnerAdCreate.asp?Showmenu=1",to:"learners/sessions#edit", constraints: lambda { |request| request.params[:ShowMenu] == "1" }

  get "Teachers/LearnerAdCreate.asp",to:"learners/registrations#successful"
end
get "Search.asp",to:"penpals#search", constraints: lambda { |request| request.params[:selX3] && request.params[:selTxtChat] }

devise_scope :teacher do
  get "Teachers/LoginTeacher.asp",to:"teachers/sessions#new"
  get "teachers/LoginTeacher.asp",to:"teachers/sessions#new"
  get "Teachers/SignUpTeacher.asp?showmenu=1",to:"teachers/registrations#new"
end
    devise_scope :member do
      get 'SignUp.asp', to: 'members/registrations#new'
      post 'SignUp.asp', to: 'members/registrations#create'
      get 'login.asp', to: 'members/sessions#new', as: :mylogin
    get "search.asp", to: "members/registrations#search"
    get "Search.asp", to: "members/registrations#search"
post "/members/LogIn.asp", to: "members/sessions#create"
    get "Member.asp", to: "members/sessions#editmyprofile"
    get "member.asp", to: "members/sessions#editmyprofile"
     post "/LogIn.asp", to: "members/sessions#create", as: :mylogincreate
    end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
get "Notepad.asp", to: "notepad#notepad", as: :notepad, constraints: lambda { |request| request.params[:show] == "2" }
get "Notepad.asp", to: "notepad#library", as: :library, constraints: lambda { |request| request.params[:show] == "1" }
get "HManBuilder.asp", to: "hangman#new"
get "HManMyGames.asp", to: "hangman#index"
get "HowTo.asp", to: "language#howto"
get "HowTo_fr.asp", to: "language#howto",as: :howto
get "penpals.asp", to: "penpals#index"
get "penpals_fr.asp", to: "penpals#index"
get "Games.asp", to: "wordgames#index"
get "Language-Lessons.asp", to: "language#lessons"
get "hangman.asp", to: "hangman#list"
post "HManPublish.asp", to: "hangman#publish"
 post "/HManBuilder.asp", to: "hangman#create"
 post "HManPlay.asp", to: "hangman#play"
 get "HManPlay.asp", to: "hangman#play1", constraints: lambda { |request| request.params[:GId] }
 patch "HManPlay.asp", to: "hangman#play1", constraints: lambda { |request| request.params[:GId] }

 get "/WhosOn.asp",to:"textchat#whoson"
 
 get "BBoardAdd.asp?first=1&selCat=5", to: "bboard#add", constraints: lambda { |request| request.params[:first] && request.params[:setCat] }
 get "BBoardAdd.asp", to: "bboard#add"
  post "/BBoardAdd.asp", to: "bboard#create"
 get "BBoard.asp", to: "bboard#category", constraints: lambda { |request| request.params[:selCat] && request.params[:X3] }
 get "BBoard.asp", to: "bboard#language", constraints: lambda { |request| request.params[:X3] }

 get "BBoard.asp", to: "bboard#index"
get "/BBoardSearch.asp",to:"bboard#search"
 get "/TextChat_fr.asp", to:"textchat#index"
 get "VoiceChat.asp", to:"voicechat#index"
 get "VoiceChat_fr.asp", to:"voicechat#index"
get "Default_:locale", to: "welcome#index"
get "/Learn_fr/:language.asp",to:"language#learn"
get "/Learn/:language.asp",to:"language#learn"
get "ChatFacilBody.asp",to:"textchat#chatfacile"
get "/Teachers/Search-Learner.asp",to:"language#searchlearner"
#get "scams.asp"
#get "LinkToUs.asp"
#get "FreeGold.asp"
get "faq.asp", to:"welcome#faq"
get "faq_fr.asp", to:"welcome#faq"
get "ContactUs.asp",to:"welcome#contactus"
get "Teachers",to:"teachers#index"
get "MultiPad.asp", to:"welcome#multipad"
get "Jobs.asp", to: "jobs#index"
get "DBShowCase.asp", to: "language#db"
get "ChatFacilFrm.asp", to:"language#chatfacile"
get "Helene.asp", to:"welcome#helene"
get "defaultMore.asp",to:"welcome#more"
get "Inbox.asp",to:"emails#inbox"
post "/Inbox.asp",to:"emails#delete", constraints: lambda { |request| request.params[:btnMsgDelete]=="Delete" }

get "awards.asp",to:"welcome#awards"
get "video.asp",to:"welcome#video"
get "OCOL.asp",to:"welcome#ocol"
get "OCOLTrEileen.asp",to:"welcome#eileen"
get "OCOLTrDYuen.asp",to:"welcome#yuen"
get "OCOLTrBelkacem.asp",to:"welcome#belkacem"
get "OCOLTrGBrown.asp",to:"welcome#brown"
get "/Country/:name.asp",to:"countries#show"
get "/Country/:name.asp",to:"countries#city"
root to: "welcome#index"
end
