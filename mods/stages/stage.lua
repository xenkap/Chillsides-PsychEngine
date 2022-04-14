function onCreate()
	if not seenCutscene then
		makeLuaSprite('charSelect', 'selection', -35, 0)
		scaleObject('charSelect', 0.685, 0.685)
		addLuaSprite('charSelect', true)
		setScrollFactor('charSelect', 0, 0)
		setObjectCamera('charSelect', 'other')
		makeAnimatedLuaSprite('char', 'characters/BOYFRIEND', 403, 153)
		addAnimationByPrefix('char', 'idle', 'BF idle dance', 24, true)
		addAnimationByPrefix('char', 'hey', 'BF HEY!!', 24, false)
		addLuaSprite('char', true)
		setScrollFactor('char', 0, 0)
		setObjectCamera('char', 'other')
		playMusic('lunchbox', 1, true)
	end
end

function onStartCountdown()
	if not allowCountdown and not seenCutscene then --Block the first countdown
		allowCountdown = true;
		return Function_Stop;
	end
	return Function_Continue;
end

local leftWait = 0
local rightWait = 0
function onUpdate()
	if allowCountdown and not seenCutscene then
		if keyJustPressed('accept') then
			objectPlayAnimation('char', 'hey', false)
			allowCountdown = false
			runTimer('countdown')
			runTimer('flash', 0.6)
			playSound('confirmMenu', 1)
		end
		if keyJustPressed('left') then
			if leftWait == 0 then
				runTimer('left', 0.5)
			end
			leftWait = 1
			changeChar(-1)
			playSound('scrollMenu', 4)
		elseif keyJustPressed('right') then
			if rightWait == 0 then
				runTimer('right', 0.5)
			end
			changeChar(1)
			playSound('scrollMenu', 4)
		end
	end
end

function onTimerCompleted(tag, loops, loopsLeft)
	if allowCountdown and not seenCutscene then
		if tag == 'left' then
			if keyPressed('left') then
				leftWait = 0
				changeChar(-1)
				runTimer('left', 0.08)
				playSound('scrollMenu', 4)
			end
		elseif tag == 'right' then
			if keyPressed('right') then
				rightWait = 0
				changeChar(1)
				runTimer('right', 0.08)
				playSound('scrollMenu', 4)
			end
		end
	end
	if tag == 'countdown' then
		stopSound('lunchbox')
		allowCountdown = true
		startCountdown();
		allowCountdown = false
		removeLuaSprite('charSelect', true)
		removeLuaSprite('char', true)
		cameraFlash('other', '000000', 0.5, true)
	elseif tag == 'flash' then
		soundFadeOut('lunchbox', 0.125, 0)
		cameraFlash('other', 'FFFFFF', 100000, true)
	end
end

local curChar = 0
function changeChar(inc)
	curChar = curChar + inc
	if curChar > 1 then
		curChar = 0
	elseif curChar < 0 then
		curChar = 1
	end
	if curChar == 0 then
		makeAnimatedLuaSprite('char', 'characters/BOYFRIEND', 403, 153)
		triggerEvent('Change Character', 'bf', 'bf')
	elseif curChar == 1 then
		makeAnimatedLuaSprite('char', 'characters/OG-BOYFRIEND', 403, 153)
		triggerEvent('Change Character', 'bf', 'og-bf')
	end
	addAnimationByPrefix('char', 'idle', 'BF idle dance', 24, true)
	addAnimationByPrefix('char', 'hey', 'BF HEY!!', 24, false)
	addLuaSprite('char', true)
	setScrollFactor('char', 0, 0)
	setObjectCamera('char', 'other')
end