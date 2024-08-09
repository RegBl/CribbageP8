function init_messages()
end

function update_messages()
    if #messages==0 then
        change_gamestate(state_history[#state_history])
    end
end

function draw_messages()
    
end