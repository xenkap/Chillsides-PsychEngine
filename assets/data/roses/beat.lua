function onCreate()
	triggerEvent('Add Camera Zoom', 0.0075, 0.015)
end

function onStepHit()
	if curStep % 8 == 0 and curStep > 18 then
		triggerEvent('Add Camera Zoom', 0.0075, 0.015)
	end
end

function onBeatHit()
	if curBeat % 4 == 0 then
		triggerEvent('Add Camera Zoom', 0.0075, 0.015)
	end
end