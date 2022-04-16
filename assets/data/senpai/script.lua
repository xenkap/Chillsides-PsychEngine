function onCreate()
	triggerEvent('BG Freaks Expression', '', '')
	triggerEvent('BG Freaks Expression', '', '')
end

function onGameOver()
	setProperty('health', 1);
	startCountdown();
	return Function_Stop;
end