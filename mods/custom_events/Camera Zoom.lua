local zoomies = 0
function onEvent(name, value1, value2)
	if name == 'Camera Zoom' then
		zoomies = value1
        setProperty('defaultCamZoom', zoomies)
	end
end