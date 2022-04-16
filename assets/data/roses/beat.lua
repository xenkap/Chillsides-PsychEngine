function onCreate()
	triggerEvent('Add Camera Zoom', 0.0075, 0.015)
end

function onStepHit()
	if curStep % 8 == 0 and curStep > 18 and curStep < 976 then
		triggerEvent('Add Camera Zoom', 0.0075, 0.015)
	end
end

function onBeatHit()
	if curBeat % 4 == 0 and curBeat < 244 then
		triggerEvent('Add Camera Zoom', 0.0075, 0.015)
	end
end

function onUpdate(elapsed)
	if keyJustPressed('back') then
		debugPrint('X: ', cameraX, ' Y: ', cameraY)
	end
end