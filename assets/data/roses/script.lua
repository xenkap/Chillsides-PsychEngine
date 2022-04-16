function onCreate()
	triggerEvent('BG Freaks Expression', '', '')
	setProperty("skipCountdown", true)
	addLuaScript('data/roses/beat')
end

function onBeatHit()
	if curBeat == 1 then
		makeLuaSprite('image', 'pixelUI/ready-pixel', 375, 250);
		setProperty('image.antialiasing', false);
		scaleObject('image', 6, 6);
		addLuaSprite('image', true);
		doTweenColor('hello', 'image', 'FFFFFFFF', 0.1, 'quartIn');
		setObjectCamera('image', 'hud');
		runTimer('fade', 0.1);
	elseif curBeat == 2 then
		makeLuaSprite('image', 'pixelUI/set-pixel', 410, 250);
		setProperty('image.antialiasing', false);
		scaleObject('image', 6, 6);
		addLuaSprite('image', true);
		doTweenColor('hello', 'image', 'FFFFFFFF', 0.1, 'quartIn');
		setObjectCamera('image', 'hud');
		runTimer('fade', 0.1);
	elseif curBeat == 3 then
		makeLuaSprite('image', 'pixelUI/date-pixel', 365, 250);
		setProperty('image.antialiasing', false);
		scaleObject('image', 6, 6);
		addLuaSprite('image', true);
		doTweenColor('hello', 'image', 'FFFFFFFF', 0.1, 'quartIn');
		setObjectCamera('image', 'hud');
		runTimer('fade', 0.3);
	elseif curBeat == 5 then
		close(false);
	end
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'fade' then
		doTweenAlpha('byebye', 'image', 0, 0.35, 'linear');
	end
end