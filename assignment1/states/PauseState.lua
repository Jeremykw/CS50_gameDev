PauseState = Class{__includes = BaseState}

function PauseState:init()

end

function PauseState:update(dt)
	-- track pause time
	if gPlayPauseState.pauseTime then
    	gPlayPauseState.pauseTime = gPlayPauseState.pauseTime + dt
    else
    	gPlayPauseState.pauseTime = dt
    end

	if love.keyboard.wasPressed('p') then
        gStateMachine:change('countdown')
    end
end

function PauseState:render()
    for k, pair in pairs(gPlayPauseState.pipePairs) do
        pair:render()
    end

    love.graphics.setFont(flappyFont)
    love.graphics.print('Score: ' .. tostring(gPlayPauseState.score), 8, 8)

    gPlayPauseState.bird:render()
end