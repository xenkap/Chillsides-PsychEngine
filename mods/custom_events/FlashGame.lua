function onEvent(name, value1, value2)
	if name == 'FlashGame' then
		cameraFlash('game', value2, value1, true)
	end
end