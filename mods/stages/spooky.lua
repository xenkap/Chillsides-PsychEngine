local allowCountdown = false
function onCreate()
	if not seenCutscene then
		precacheImage('characters/OG-BOYFRIEND')
		precacheImage('characters/FOXBOI')
		makeLuaSprite('charSelect', 'selection', -35, 0)
		scaleObject('charSelect', 0.685, 0.685)
		addLuaSprite('charSelect', true)
		setScrollFactor('charSelect', 0, 0)
		setObjectCamera('charSelect', 'other')
		makeAnimatedLuaSprite('char', 'characters/realBF', 403, 153)
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

local curChar = 0
function onUpdate()
	if allowCountdown and not seenCutscene then
		if keyJustPressed('accept') then
			objectPlayAnimation('char', 'hey', false)
			allowCountdown = false
			runTimer('countdown')
			runTimer('flash', 0.6)
			playSound('confirmMenu', 1)
		end
		if keyJustPressed('left') or keyJustPressed('right') then
			playSound('scrollMenu', 4)
			if keyJustPressed('left') then
				if curChar == 0 then
					curChar = 2
				else
					curChar = curChar - 1
				end
			else
				if curChar == 2 then
					curChar = 0
				else
					curChar = curChar + 1
				end
			end
			if curChar == 0 then
				makeAnimatedLuaSprite('char', 'characters/realBF', 403, 153)
				triggerEvent('Change Character', 'bf', 'bf')
			elseif curChar == 1 then
				makeAnimatedLuaSprite('char', 'characters/OG-BOYFRIEND', 403, 160)
				triggerEvent('Change Character', 'bf', 'og-bf')
			else
				makeAnimatedLuaSprite('char', 'characters/FOXBOI', 403, 160)
				triggerEvent('Change Character', 'bf', 'foxboi')
			end
			addAnimationByPrefix('char', 'idle', 'BF idle dance', 24, true)
			addAnimationByPrefix('char', 'hey', 'BF HEY!!', 24, false)
			addLuaSprite('char', true)
			setScrollFactor('char', 0, 0)
			setObjectCamera('char', 'other')
		end
	end
end

function onTimerCompleted(tag)
	if tag == 'countdown' then
		stopSound('lunchbox')
		allowCountdown = true
		startCountdown();
		allowCountdown = false
		removeLuaSprite('charSelect', true)
		removeLuaSprite('char', true)
		cameraFlash('other', '000000', 0.5, true)
	end
	if tag == 'flash' then
		soundFadeOut('lunchbox', 0.125, 0)
		cameraFlash('other', 'FFFFFF', 100000, true)
	end
end