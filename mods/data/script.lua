missedAnimations = {'singLEFTmiss','singDOWNmiss','singUPmiss','singRIGHTmiss'}
local opponentHits = 0;
local showDebugMiss = false;

function onCreate()
	debugPrint('Debugging messages turned off; use back keybinds to renable!! -kap')
end

function opponentNoteHit(id, direction, noteType, isSustainNote)
	if math.random(0, 0.02) > 0 then
		if showDebugMiss == true then
			debugPrint('missNormal', isSustainNote);
		end
		if isSustainNote == false then
			characterPlayAnim('dad', missedAnimations[direction+1], true);
			setProperty('health', getProperty('health') + 0.02);
			if math.random(0, 0.05) > 0 then
				playSound('missnote1', 0.1);
			elseif math.random(0, 0.15) < 1 then
				playSound('missnote2', 0.1);
			else
				playSound('missnote3', 0.1);
			end
			return Function_Stop;
		else
			if getProperty('health') > 0.04 then
				setProperty('health', getProperty('health') - 0.007);
			end
		end
	elseif math.random(0, 0.23) > 0 and opponentHits > 3 then
		if showDebugMiss == true then
			debugPrint('miss3', isSustainNote);
		end
		if isSustainNote == false then
			opponentHits = opponentHits - 2;
			characterPlayAnim('dad', missedAnimations[direction+1], true);
			setProperty('health', getProperty('health') + 0.02);
			if math.random(0, 0.05) > 0 then
				playSound('missnote1', 0.1);
			elseif math.random(0, 0.15) < 1 then
				playSound('missnote2', 0.1);
			else
				playSound('missnote3', 0.1);
			end
			return Function_Stop;
		else
			if getProperty('health') > 0.04 then
				setProperty('health', getProperty('health') - 0.007);
			end
		end
	elseif math.random(0, 0.7) > 0 and opponentHits > 7 then
		if showDebugMiss == true then
			debugPrint('miss7', isSustainNote);
		end
		if isSustainNote == false then
			opponentHits = opponentHits - 3;
			characterPlayAnim('dad', missedAnimations[direction+1], true);
			setProperty('health', getProperty('health') + 0.02);
			if math.random(0, 0.05) > 0 then
				playSound('missnote1', 0.1);
			elseif math.random(0, 0.15) < 1 then
				playSound('missnote2', 0.1);
			else
				playSound('missnote3', 0.1);
			end
			return Function_Stop;
		else
			if getProperty('health') > 0.04 then
				setProperty('health', getProperty('health') - 0.007);
			end
		end
	elseif math.random(0, 1.2) > 0 and opponentHits > 11 then
		if showDebugMiss == true then
			debugPrint('miss11', isSustainNote);
		end
		if isSustainNote == false then
			opponentHits = opponentHits - 3;
			characterPlayAnim('dad', missedAnimations[direction+1], true);
			setProperty('health', getProperty('health') + 0.02);
			if math.random(0, 0.05) > 0 then
				playSound('missnote1', 0.1);
			elseif math.random(0, 0.15) < 1 then
				playSound('missnote2', 0.1);
			else
				playSound('missnote3', 0.1);
			end
			return Function_Stop;
		else
			if getProperty('health') > 0.04 then
				setProperty('health', getProperty('health') - 0.007);
			end
		end
	else
		if isSustainNote == false then
			opponentHits = opponentHits + 1;
		end
		if getProperty('health') > 0.04 then
			setProperty('health', getProperty('health') - 0.02);
		end
	end
end

function onStepHit()
	if showDebugMiss == true then
		debugPrint('opponentHits =', opponentHits);
	end
end

function onBeatHit()
	if opponentHits > 0 then
		opponentHits = opponentHits - 1;
	end
end

function onUpdate(elapsed)
	if keyJustPressed('back') then
		if showDebugMiss == false then
			debugPrint('Debugging toggled on!')
			showDebugMiss = true;
		else
			debugPrint('Debugging toggled off!')
			showDebugMiss = false;
		end
	end
end