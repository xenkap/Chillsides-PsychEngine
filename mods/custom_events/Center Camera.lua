function onEvent(name, value1, value2)
	if name == 'Center Camera' then
		if value1 == '' then
			triggerEvent('Camera Follow Pos', '', '')
		else
			triggerEvent('Camera Follow Pos', 631, 555)
		end
	end
end