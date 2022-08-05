/*
CLASSES STRUCTURE
Scatter Game
*/

var Scatter = function () {

    this.Dom = new DomList();

}

var DomList = function () {

    this.Input = new Input();
    this.Elements = new Elements();
    this.GameContainer = $('#gameContainer');
    this.TopScore = new TopScore();
    this.StartBanner = $('#startBanner');
    this.StartButton = $('.startNow');
}

var Input = function () {

    this.Collection = new InputCollection();
    this.SessionID = $('.SessionID').val();
    this.LearnerID = $('.LearnerID').val();
    this.LessonID = $('.LessonID').val();
    this.Lang1ID = $('.Lang1ID').val();
    this.Lang2ID = $('.Lang2ID').val();
    this.LearnerPreviousRecord = $('.LearnerPreviousRecord').val();

    this.GameAreaWidth = $('.GameAreaWidth').val();
    this.GameAreaHeight = $('.GameAreaHeight').val();
    this.GameAreaBgColor = $('.GameAreaBgColor').val();
    this.GameTextFont = $('.GameTextFont').val();
    this.GameTextWeight = $('.GameTextWeight').val();
    this.GameTextSize = $('.GameTextSize').val();
    this.GameTextColor = $('.GameTextColor').val();
    this.ElementBgColor = $('.ElementBgColor').val();
    this.ElementPadding = $('.ElementPadding').val();
}

var InputCollection = function () {

    this.RecordID = $('.RecordID');
    this.ColNumber = $('.ColNum');
    this.DisplayHTML = $('.DisplayHTML');
}

var Elements = function () {

    this.Master = $('.elementMaster');
    this.Collection = $('.element');
    this.RecordID = $('.elementRecordID');
    this.ColNum = $('.elementColNum');
}

var TopScore = function () {
    this.Container = $('#topScoreContainer');
    this.CurrentScore = $('#currentScore');
    this.LastRecord = $('#personalHighScore');
    this.Prev = $('.aPrev');
    this.Next = $('.aNext');
    this.PlayAgainButton = $('#aPlayAgain');
}