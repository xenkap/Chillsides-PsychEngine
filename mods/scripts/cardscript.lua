function onSongStart()
	makeLuaSprite('back', 'startCard/'..songName, -500, 150)
	scaleObject('back', 0.6, 0.6)
	doTweenX('move left', 'back', -10, 0.5, 'circOut')
	addLuaSprite('back', true)
	setScrollFactor('back', 0, 0)
	setObjectCamera('back', 'other')
	if songName == 'Tutorial' then
		runTimer('Timer', 1)
	else
		runTimer('Timer', 2)
	end
end

function onTimerCompleted(tag)
	if tag == 'Timer' then
		doTweenX('move left', 'back', -500, 1, 'circIn')
		doTweenAlpha('Disapear1', 'back', 0, 1, 'linear')
		runTimer('Timer2', 1)
	elseif tag == 'Timer2' then
		removeLuaSprite('back', true)
		close(false)
	end
end