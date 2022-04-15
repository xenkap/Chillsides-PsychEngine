function onEvent(name, value1, value2)
	if name == 'LinearAlphaHud' then
		-- hud
		doTweenAlpha('IF', 'camHUD', value2 , value1 + 0.01, 'linear')
	end
end