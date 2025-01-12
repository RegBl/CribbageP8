function init_messages()
end

-- TODO: figure out where to have the code that changes from messages gamestate
-- Currently here, in main _update() and _draw()
-- I generally handle gamestate changes in the current gamestate's update function
-- But also the message gamestate needs to be able to happen at any time
function update_messages()
    if #messages==0 then
        change_gamestate(state_history[#state_history])
    end
end

function draw_messages()
    
end