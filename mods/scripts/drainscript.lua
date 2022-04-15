function opponentNoteHit(id, direction, noteType, isSustainNote)
	if getProperty('health') > 0.1 then
		if isSustainNote then
			setProperty('health', getProperty('health') - (0.02 * getProperty('ratingPercent')))
		else
			setProperty('health', getProperty('health') - (0.025 * getProperty('ratingPercent')))
		end
	end
end