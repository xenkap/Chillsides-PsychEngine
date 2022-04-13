function onCreate()
	if boyfriendName ~= 'bf-pixel' then
		setPropertyFromClass('GameOverSubstate', 'characterName', 'bfDeath');
	end
end