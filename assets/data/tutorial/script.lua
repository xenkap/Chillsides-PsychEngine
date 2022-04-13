function onCreate()
	-- triggered when the lua file is started
	addCharacterToList('gf', 'girlfriend');
	addCharacterToList('gf_cheering', 'girlfriend');
	addCharacterToList('gf_arrows', 'girlfriend');
	addCharacterToList('gf', 'dad');
	addCharacterToList('gf_cheering', 'dad');
	addCharacterToList('gf_arrows', 'dad');
end

function onUpdate(elapsed)
	-- start of "update", some variables weren't updated yet
	if getProperty('dad.animation.curAnim.name') == 'singLEFT' then
		if gfName ~= 'gf_arrows' then
			triggerEvent('Change Character', 2, 'gf_arrows');
			triggerEvent('Change Character', 1, 'gf_arrows');
			triggerEvent('Play Animation', 'singLEFT', 'DAD')
		end
	elseif getProperty('dad.animation.curAnim.name') == 'singDOWN' then
		if gfName ~= 'gf_arrows' then
			triggerEvent('Change Character', 2, 'gf_arrows');
			triggerEvent('Change Character', 1, 'gf_arrows');
			triggerEvent('Play Animation', 'singDOWN', 'DAD')
		end
	elseif getProperty('dad.animation.curAnim.name') == 'singUP' then
		if gfName ~= 'gf_arrows' then
			triggerEvent('Change Character', 2, 'gf_arrows');
			triggerEvent('Change Character', 1, 'gf_arrows');
			triggerEvent('Play Animation', 'singUP', 'DAD')
		end
	elseif getProperty('dad.animation.curAnim.name') == 'singRIGHT' then
		if gfName ~= 'gf_arrows' then
			triggerEvent('Change Character', 2, 'gf_arrows');
			triggerEvent('Change Character', 1, 'gf_arrows');
			triggerEvent('Play Animation', 'singRIGHT', 'DAD')
		end
    else
        if rating > 0.84 and gfName ~= 'gf_cheering' then
		    triggerEvent('Change Character', 2, 'gf_cheering');
		    triggerEvent('Change Character', 1, 'gf_cheering');
        elseif rating < 0.84 and gfName ~= 'gf' then
		    triggerEvent('Change Character', 2, 'gf');
		    triggerEvent('Change Character', 1, 'gf');
        end
	end
end

function onUpdatePost(elapsed)
	-- start of "update", some variables weren't updated yet
	if getProperty('dad.animation.curAnim.name') == 'singLEFT' then
		if gfName ~= 'gf_arrows' then
			triggerEvent('Change Character', 2, 'gf_arrows');
			triggerEvent('Change Character', 1, 'gf_arrows');
			characterPlayAnim('dad', 'singLEFT', true);
		end
	elseif getProperty('dad.animation.curAnim.name') == 'singDOWN' then
		if gfName ~= 'gf_arrows' then
			triggerEvent('Change Character', 2, 'gf_arrows');
			triggerEvent('Change Character', 1, 'gf_arrows');
			characterPlayAnim('dad', 'singDOWN', true);
		end
	elseif getProperty('dad.animation.curAnim.name') == 'singUP' then
		if gfName ~= 'gf_arrows' then
			triggerEvent('Change Character', 2, 'gf_arrows');
			triggerEvent('Change Character', 1, 'gf_arrows');
			characterPlayAnim('dad', 'singUP', true);
		end
	elseif getProperty('dad.animation.curAnim.name') == 'singRIGHT' then
		if gfName ~= 'gf_arrows' then
			triggerEvent('Change Character', 2, 'gf_arrows');
			triggerEvent('Change Character', 1, 'gf_arrows');
			characterPlayAnim('dad', 'singRIGHT', true);
		end
    else
        if rating > 0.84 and gfName ~= 'gf_cheering' then
		    triggerEvent('Change Character', 2, 'gf_cheering');
		    triggerEvent('Change Character', 1, 'gf_cheering');
        elseif rating < 0.84 and gfName ~= 'gf' then
		    triggerEvent('Change Character', 2, 'gf');
		    triggerEvent('Change Character', 1, 'gf');
        end
	end
end