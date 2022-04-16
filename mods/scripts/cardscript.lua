function onSongStart()
	makeLuaSprite('back', 'startCard/'..songName, -800, 150)
	scaleObject('back', 0.6, 0.6)
	if songName == 'Roses' then
		runTimer('roses', 2)
	else
		doTweenX('move left', 'back', -10, 0.5, 'circOut')
	end
	addLuaSprite('back', true)
	setScrollFactor('back', 0, 0)
	setObjectCamera('back', 'hud')
	if songName == 'Tutorial' then
		runTimer('Timer', 1)
	elseif songName == 'Roses' then
		runTimer('Timer', 5)
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
	if tag == 'roses' then
		doTweenX('move left', 'back', -10, 0.5, 'circOut')
	end
end