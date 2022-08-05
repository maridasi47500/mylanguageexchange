function RVSpeak(TextToSay,Voice) {
	if (Voice){
		responsiveVoice.speak(TextToSay,Voice);
	}
	else{
		alert('No voice available for this language.');
	}
};