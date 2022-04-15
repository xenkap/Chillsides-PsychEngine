function onEvent(name, value1, value2)
	if name == 'Flash' then
		cameraFlash('other', value2, value1, true)
	end
end