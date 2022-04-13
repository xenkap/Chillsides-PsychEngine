function onCreate()
	-- prep shit
	makeLuaSprite('annoyingFilter', 'blueEffect', -35, 0)
	scaleObject('annoyingFilter', 0.685, 0.685)
	addLuaSprite('annoyingFilter', true)
	setScrollFactor('annoyingFilter', 0, 0)
	setObjectCamera('annoyingFilter', 'hud')
	makeLuaSprite('annoyingFilter2', 'blue', -160, -100)
	setBlendMode('annoyingFilter2', 'OVERLAY')
	addLuaSprite('annoyingFilter2', true)
	setScrollFactor('annoyingFilter2', 0, 0)
	setObjectCamera('annoyingFilter2', 'game')
	makeAnimatedLuaSprite('prompt', 'prompt', 253, 153)
	addAnimationByPrefix('prompt', 'idle', 'click', 24, true)
	setScrollFactor('prompt', 0, 0)
	setObjectCamera('prompt', 'other')
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		--Check if the note is a snowball
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'snowball' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'snowball'); --Change texture
			setPropertyFromGroup('unspawnNotes', i, 'missHealth', 0.02); --Change amount of health to take when you miss like an idiot
		end
	end
	--debugPrint('Script started!')
end

-- Function called when you hit a note (after note hit calculations)
-- id: The note member id, you can get whatever variable you want from this note, example: "getPropertyFromGroup('notes', id, 'strumTime')"
-- noteData: 0 = Left, 1 = Down, 2 = Up, 3 = Right
-- noteType: The note type string/tag
-- isSustainNote: If it's a hold note, can be either true or false

dodgeAnimations = {'dodgeLEFT', 'dodgeDOWN', 'dodgeUP', 'dodgeRIGHT'}
function goodNoteHit(id, noteData, noteType, isSustainNote)
	if noteType == 'snowball' then
		characterPlayAnim('boyfriend', dodgeAnimations[noteData+1], true);
		setProperty('boyfriend.specialAnim', true);
	end
end

local healthDrain = 0;
function noteMiss(id, noteData, noteType, isSustainNote)
	if noteType == 'snowball' then
		playSound('snow', 5);
		healthDrain = healthDrain + 1.6 * difficulty;
	end
end

function onUpdate(elapsed)
	if healthDrain > 0 then

		-- click
		addLuaSprite('prompt', true)
		setProperty('boyfriend.stunned', true);

		-- overlay shit
		doTweenAlpha('deAlpha', 'annoyingFilter', (healthDrain / 50) + 0.05, 0.01, 'linear');
		doTweenAlpha('deAlpha2', 'annoyingFilter2', (healthDrain / 100) + 0.05, 0.01, 'linear');

		-- draining timer
		healthDrain = healthDrain - 0.2 * elapsed;

		-- checks if you can die, if yes then drain it faster
		if getProperty('health') > 0.2 then
			setProperty('health', getProperty('health') - 0.05 * elapsed);
		else
			healthDrain = healthDrain - 0.3 * elapsed;
		end

		-- shiver mechanic
		if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.'..'SPACE') == true then
			characterPlayAnim('boyfriend', 'shiver', false);
			runTimer('stress', 0.2)
			setProperty('boyfriend.specialAnim', false);
			healthDrain = healthDrain - (0.25 + (healthDrain/12));
		end

		-- change noteskin
		for i = 0, getProperty('playerStrums.length')-1 do
			if getPropertyFromGroup('playerStrums', i, 'texture') ~= 'frozen' then
				setPropertyFromGroup('playerStrums', i, 'texture', 'frozen');
			end
		end

	else

		-- click
		removeLuaSprite('prompt', false)
		setProperty('boyfriend.stunned', false);

		-- change noteskin back
		for i = 0, getProperty('playerStrums.length')-1 do
			if getPropertyFromGroup('playerStrums', i, 'texture') ~= 'NOTE_assets' then
				setPropertyFromGroup('playerStrums', i, 'texture', 'NOTE_assets');
			end
		end

		-- so no glitchiness
		healthDrain = 0

		-- overlay shit 2
		doTweenAlpha('deAlpha', 'annoyingFilter', 0, 0.1, 'linear');
		doTweenAlpha('deAlpha2', 'annoyingFilter2', 0, 0.1, 'linear');
		removeLuaSprite('prompt', false)

	end
end

function onTimerCompleted(tag, loops, loopsLeft)
	-- all this does is really stop the anim from lasting forever
	if tag == 'stress' then
		characterPlayAnim('boyfriend', 'idle', false);
	end
end