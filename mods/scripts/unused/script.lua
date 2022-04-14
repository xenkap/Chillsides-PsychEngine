local altAnim = 0;
local lastNotePlayed = 0;
local lastNotePlayedType = '';
local pressing = false;
local noteStillPlaying = false;
local lastSwitch = '';
stressingAnimations = {'stressLEFT', 'stressDOWN', 'stressUP', 'stressRIGHT'}
stressingLoopAnimations = {'stressLEFT-loop', 'stressDOWN-loop', 'stressUP-loop', 'stressRIGHT-loop'}

function onStepHit()
	if getProperty('health') > 1.25 and boyfriendName == 'bf' and rating < 0.75 and altAnim ~= 2 then
		altAnim = 2;
		triggerEvent('Alt Idle Animation', 'BF', '-flex');
	elseif getProperty('health') < 0.75 and boyfriendName == 'bf' and altAnim ~= 1 then
		altAnim = 1;
		triggerEvent('Alt Idle Animation', 'BF', '-stress');
	elseif getProperty('health') > 0.75 and getProperty('health') < 1.25 and altAnim ~= 0 then
		altAnim = 0;
		triggerEvent('Alt Idle Animation', 'BF', '');
	elseif altAnim ~= 1 and rating > 0.75 then
		altAnim = 0;
		triggerEvent('Alt Idle Animation', 'BF', '');
	end
end

function goodNoteHit(id, noteData, noteType, isSustainNote)
	debugPrint(health)
	if getProperty('health') < 0.75 and boyfriendName == 'bf' and noteType == '' then
		if noteData == 0 then
			triggerEvent('Play Animation', 'stressLEFT', 'BF')
		elseif noteData == 1 then
			triggerEvent('Play Animation', 'stressDOWN', 'BF')
		elseif noteData == 2 then
			triggerEvent('Play Animation', 'stressUP', 'BF')
		elseif noteData == 3 then
			triggerEvent('Play Animation', 'stressRIGHT', 'BF')
		end
	elseif getProperty('health') < 0.75 and boyfriendName == 'bf-car' and noteType == '' then
		if noteData == 0 then
			triggerEvent('Play Animation', 'stressLEFT', 'BF')
		elseif noteData == 1 then
			triggerEvent('Play Animation', 'stressDOWN', 'BF')
		elseif noteData == 2 then
			triggerEvent('Play Animation', 'stressUP', 'BF')
		elseif noteData == 3 then
			triggerEvent('Play Animation', 'stressRIGHT', 'BF')
		end
	end
	lastNotePlayed = noteData;
	lastNotePlayedType = noteType;
	noteStillPlaying = true;
	cancelTimer('noteStress')
	if isSustainNote == false then
		runTimer('noteStress', 0.55)
	else
		runTimer('noteStress', 0.2)
	end
	pressing = true;
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'noteStress' then
		noteStillPlaying = false;
		if pressing == false then
			if getProperty('boyfriend.animation.curAnim.name') == 'stressLEFT' or getProperty('boyfriend.animation.curAnim.name') == 'stressDOWN' or getProperty('boyfriend.animation.curAnim.name') == 'stressUP' or getProperty('boyfriend.animation.curAnim.name') == 'stressRIGHT' then
				characterDance('boyfriend');
			end
		end
	end
end

function onUpdate()
	if getProperty('health') < 0.75 and boyfriendName == 'bf' and lastNotePlayedType == '' then
		if pressing == true then
			if noteStillPlaying == false then
				characterPlayAnim('boyfriend', stressingLoopAnimations[lastNotePlayed+1], false);
			end
		end
	elseif getProperty('health') < 0.75 and boyfriendName == 'bf-car' and lastNotePlayedType == '' then
		if pressing == true then
			if noteStillPlaying == false then
				characterPlayAnim('boyfriend', stressingLoopAnimations[lastNotePlayed+1], false);
			end
		end
	end
end

function onUpdatePost()
	if getProperty('boyfriend.animation.curAnim.name') == 'scared' then
		pressing = false;
		if getProperty('health') < 0.75 and boyfriendName == 'bf' then
			characterPlayAnim('boyfriend', 'terrified', true);
		end
	elseif getProperty('boyfriend.animation.curAnim.name') == 'hey' then
		pressing = false;
		if getProperty('health') < 0.75 and boyfriendName == 'bf' then
			characterPlayAnim('boyfriend', 'ey', true);
		elseif getProperty('health') < 0.75 and boyfriendName == 'bf-car' then
			characterPlayAnim('boyfriend', 'ey', true);
		end
	elseif getProperty('boyfriend.animation.curAnim.name') == 'singLEFTmiss' or getProperty('boyfriend.animation.curAnim.name') == 'singDOWNmiss' then
		pressing = false;
	elseif getProperty('boyfriend.animation.curAnim.name') == 'singUPmiss' or getProperty('boyfriend.animation.curAnim.name') == 'singRIGHTmiss' then
		pressing = false;
	end
	if getProperty('health') < 0.75 and boyfriendName == 'bf' and lastNotePlayedType == '' then
		if pressing == true then
			if noteStillPlaying == false then
				characterPlayAnim('boyfriend', stressingLoopAnimations[lastNotePlayed+1], false);
			end
		end
	elseif getProperty('health') < 0.75 and boyfriendName == 'bf-car' and lastNotePlayedType == '' then
		if pressing == true then
			if noteStillPlaying == false then
				characterPlayAnim('boyfriend', stressingLoopAnimations[lastNotePlayed+1], false);
			end
		end
	end
	if keyPressed('left') == false and keyPressed('right') == false and keyPressed('up') == false and keyPressed('down') == false then
		if pressing == true then
			if noteStillPlaying == false then
				characterDance('boyfriend');
			end
		end
		pressing = false;
	end
end