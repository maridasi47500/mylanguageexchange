/*
LOGIC FUNCTIONS
Scatter Game
*/

function ShowStartInfo() {
    var game = new Scatter();
    game.Dom.StartBanner.dialog({ modal: true, width: '300px', title: 'Word Match Game' });

    game.Dom.StartButton.click(InitializeGame);
    game.Dom.TopScore.PlayAgainButton.click(InitializeGame);
}

function InitializeGame() {

    var game = new Scatter();
    game.Dom.StartBanner.dialog('close');
    var collection = game.Dom.Input.Collection;
    var input = game.Dom.Input;
    var gameContainer = game.Dom.GameContainer;
    gameContainer.show();
    $('#ReviewsContainer').hide();
    game.Dom.TopScore.Container.hide();


    // set game variables
    SetGameVariables(input, gameContainer);

    // loop through each input variable and create the elements accordingly
    collection.RecordID.each(function () {

        var currentHeight = $(gameContainer).height() - 100;
        var currentWidth = $(gameContainer).width() - 100;
        var _top = Math.round(Math.random() * currentHeight) + (gameContainer.offset().top)
        var _left = Math.round(Math.random() * currentWidth) + (gameContainer.offset().left);

        var columnNumber = $(this).next().val();
        var displayHTML = $.trim($(this).next().next().val());

        var newElement = game.Dom.Elements.Master.clone();
        newElement.offset({ top: _top, left: _left });
        newElement.find('span').html(displayHTML);
        newElement.find('.elementRecordID').val($(this).val());
        newElement.find('.elementColNum').val(columnNumber);
        newElement.removeClass('elementMaster').addClass('element');

        newElement.css('font-family', input.GameTextFont);
        newElement.css('font-weight', input.GameTextWeight);
        newElement.css('font-size', input.GameTextSize);
        newElement.css('background-color', input.ElementBgColor);
        newElement.css('padding', input.ElementPadding);
        newElement.css('color', input.GameTextColor);
        newElement.appendTo(gameContainer);
        newElement.css('display', 'inline');
    });

    game = null;

    SetDrag();

    SetTimer();

    SetPaging();


}

function SetGameVariables(input, gameContainer) {

    gameContainer.css('width', input.GameAreaWidth);
    gameContainer.css('height', input.GameAreaHeight);
    gameContainer.css('background-color', input.GameAreaBgColor);
}

function SetDrag() {

    var game = new Scatter();

    // set draggable elements
    game.Dom.Elements.Collection.draggable({
        opacity: 0.5,
        cursor: 'move',
        zIndex: 100
    });

    // set droppable elements
    game.Dom.Elements.Collection.droppable({
        hoverClass: "elementActive",
        tolerance: 'touch',
        drop: OnElementDrop
    });
}

function OnElementDrop(event, ui) {
    var game = new Scatter();

    var dragElement = ui.draggable;
    var dropElement = $($(event.target)[0]);

    var dragRecordID = dragElement.find(game.Dom.Elements.RecordID).val();
    var dropRecordID = dropElement.find(game.Dom.Elements.RecordID).val();

    var dragColumn = dragElement.find(game.Dom.Elements.ColNum).val();
    var dropColumn = dropElement.find(game.Dom.Elements.ColNum).val();

    var matched = false;
    if (dragColumn != dropColumn) {

        // split values and make arrays
        var dragArray = dragRecordID.split(',');
        var dropArray = dropRecordID.split(',');

        // check if dropRecordID contains drag ID
        if (dropArray.indexOf(dragRecordID) != -1) {

            // bingo
            matched = true;
        }

        // check if dragRecordID contains drop ID
        else if (dragArray.indexOf(dropRecordID) != -1) {

            // bingo
            matched = true;
        }

        if (matched == true) {
            // remove elements from the game
            dragElement.fadeOut('fast');
            dropElement.fadeOut('fast', function () {
                dragElement.remove();
                dropElement.remove();
                CheckGameFinish(dragRecordID, dropRecordID, dragColumn, dropColumn, matched);
            });
        }
    }
    if (matched == false) {
        var gameContainer = game.Dom.GameContainer;
        var duration = 700;

        var currentHeight = $(gameContainer).height() - 100;
        var currentWidth = $(gameContainer).width() - 100;
        var _top = Math.round(Math.random() * currentHeight) + (gameContainer.offset().top)
        var _left = Math.round(Math.random() * currentWidth) + (gameContainer.offset().left);

        dragElement.animate({ top: _top, left: _left }, duration);
        CheckGameFinish(dragRecordID, dropRecordID, dragColumn, dropColumn, matched);
    }
}

function CheckDragRevert() {
    return 'invalid';
}

var startstopTimer, startstopCurrent = 0;
function SetTimer() {
    startstopTimer = $.timer(function () {
        var min = parseInt(startstopCurrent / 6000);
        var sec = parseInt(startstopCurrent / 100) - (min * 60);
        var micro = pad(startstopCurrent - (sec * 100) - (min * 6000), 2);
        var output = "00"; if (min > 0) { output = pad(min, 2); }
//        $('.startstoptime').html('Elapsed Time: <span class="timeText">' + output + ":" + pad(sec, 2) + ":" + micro + "</span>");
        $('.startstoptime').html('Elapsed Time: <span class="timeText">' + startstopCurrent / 100 + "</span>");
        startstopCurrent += 7;
    }, 70, false);

    startstopCurrent = 0;
    startstopTimer.stop().once();
    startstopTimer.play(true);
}

// Padding function
function pad(number, length) {
    var str = '' + number;
    while (str.length < length) { str = '0' + str; }
    return str;
}

// check game ended or not
var _PageSize;
var _PageNumber = 1;
function CheckGameFinish(dragRecordID, dropRecordID, dragColumn, dropColumn, matched) {
    var game = new Scatter();
    var input = game.Dom.Input;

    var gameTime = $('.timeText').text();
    var remainingElements = game.Dom.Elements.Collection.length / 2;

    XHR_UpdateGameStatus(input.SessionID, input.LearnerID, input.LessonID, input.Lang1ID, input.Lang2ID, dragRecordID, dropRecordID, dragColumn, dropColumn, gameTime, remainingElements, _PageNumber, _PageSize, matched, OnUpdateGameStatusSucess);

    if (game.Dom.Elements.Collection.length == 0) {
        startstopTimer.pause();
        //alert('Game Ended, time: ' + gameTime);
		$('#GameTimeDan').text(gameTime);
		$('#hidGameTimeDan').val(gameTime);
    }
}

function OnUpdateGameStatusSucess(result, textStatus) {

    var game = new Scatter();

    var remainingElements = game.Dom.Elements.Collection.length / 2;

    if (remainingElements == 0) {
        console.log(result)
        //for (var i=0;i<5;i++)
        var scores = JSON.parse(result);
        console.log(result,scores)
        $('#tblScores>tbody').empty();
        $('#topScoreTemplate').tmpl(scores).appendTo('#tblScores>tbody');
        VerifyPagingLinks();
        game.Dom.GameContainer.hide();
        var topScore = game.Dom.TopScore;
        $('#ReviewsContainer').show();
        topScore.Container.show();
        topScore.CurrentScore.text($('.timeText').text());
        topScore.LastRecord.text(game.Dom.Input.LearnerPreviousRecord);
    }
}

function SetPaging() {
    _PageSize = $('.ScorePageSize').val();
    _PageNumber = 1;

    var game = new Scatter();
    var input = game.Dom.Input;

    game.Dom.TopScore.Prev.click(function () {
        _PageNumber -= 1;
        XHR_GetMoreScores(input.SessionID, input.LearnerID, input.LessonID, input.Lang1ID, input.Lang2ID, _PageNumber, _PageSize, OnGetMoreScoreSuccess);
    });

    game.Dom.TopScore.Next.click(function () {
        _PageNumber += 1;
        XHR_GetMoreScores(input.SessionID, input.LearnerID, input.LessonID, input.Lang1ID, input.Lang2ID, _PageNumber, _PageSize, OnGetMoreScoreSuccess);
    });
}

function OnGetMoreScoreSuccess(result) {
    var scores = JSON.parse(result);
    $('#tblScores>tbody').empty();
    $('#topScoreTemplate').tmpl(scores).appendTo('#tblScores>tbody');
    VerifyPagingLinks();

}

//---------------------------------------- AJAX CALLS ----------------------------------------------//

function XHR_UpdateGameStatus(SessionID, LearnerID, LessonID, Lang1ID, Lang2ID, RecordID1, RecordID2, ColNum1, ColNum2, ElapsedTime, RemainingElements, PageNumber, PageSize, Matched, OnSuccess) {

    var path = $('.PlayURL').val();
    $.post(path,
        {
            SessionID: SessionID,
            LearnerID: LearnerID,
            LessonID: LessonID,
            Lang1ID: Lang1ID,
            Lang2ID: Lang2ID,
            RecordID1: RecordID1,
            RecordID2: RecordID2,
            ColNum1: ColNum1,
            ColNum2: ColNum2,
            ElapsedTime: ElapsedTime,
            RemainingElements: RemainingElements,
            Matched: Matched,
			PageSize: $('.ScorePageSize').val()
        },
        function (response) {
            var text = $.trim(response);
            OnSuccess(text);
        });
}

function XHR_GetMoreScores(SessionID, LearnerID, LessonID, Lang1ID, Lang2ID, PageNumber, PageSize, OnSuccess) {

    var path = $('.ScoreURL').val();
    $.post(path,
        {
            LearnerID: LearnerID,
            SessionID: SessionID,
            LessonID: LessonID,
			Lang1ID: Lang1ID,
			Lang2ID: Lang2ID,
            PageNumber: PageNumber,
            PageSize: PageSize
        },
        function (response) {
            var text = $.trim(response);
            OnSuccess(text);
        });
}


//---------------------------------------- IMPL Helper ----------------------------------------------//


if (!Array.prototype.indexOf) {
    Array.prototype.indexOf = function (elt /*, from*/) {
        var len = this.length >>> 0;

        var from = Number(arguments[1]) || 0;
        from = (from < 0)
         ? Math.ceil(from)
         : Math.floor(from);
        if (from < 0)
            from += len;

        for (; from < len; from++) {
            if (from in this &&
          this[from] === elt)
                return from;
        }
        return -1;
    };
}

function htmlEncode(value) {
    //create a in-memory div, set it's inner text(which jQuery automatically encodes)
    //then grab the encoded contents back out.  The div never exists on the page.
    return $('<div/>').text(value).html();
}

function htmlDecode(value) {
    return $('<div/>').html(value).text();
}

function VerifyPagingLinks() {
    if (_PageNumber == 1)
        $('.aPrev').css('visibility', 'hidden');
    else
        $('.aPrev').css('visibility', 'visible');
}