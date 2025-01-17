function init_messages()
end

-- TODO: figure out where to have the code that changes from messages gamestate
-- Currently here, in main _update() and _draw()
-- I generally handle gamestate changes in the current gamestate's update function
-- But also the message gamestate needs to be able to happen at any time
function update_messages()
    if #messages==0 then
        change_gamestate(state_history[#state_history-1])
    end
end

function draw_messages()
    display_messages_queue()
end

-- TODO: add wait for user input to show next message
function display_messages_queue()
    if #messages>0 then
        local msg=deli(messages,1)
        display_alert(msg.msg, msg.color)
    end
end

function display_alert(msg_txt, ...)
    local args = {...}
	local msg_text = msg_txt
	local msg_color = args[1] or Color.BLACK
	local num_lines = (ceil(#msg_text/29))+1
	local total_height = num_lines*6+6
	local top_y = 64 - (total_height/2)
	local bottom_y = 64 + (total_height/2)
	local msg_split = {}
	for i=1,num_lines do
		add(msg_split, sub(msg_text, 1, 29))
		msg_text = sub(msg_text, 30)
	end

	add(dev_mode, "num_lines: "..num_lines)
	add(dev_mode, "total_height: "..total_height)

	rectfill(2, top_y-4, 126, bottom_y+4, Color.BLACK)
	rectfill(4, top_y-2, 124, bottom_y+2, Color.LIGHT_GRAY)

	for x=1,num_lines+1 do
		if x==num_lines+1 then
			print("press ❎", 92, bottom_y-6)
		else
			print(msg_split[x], 6, top_y+(6*(x-1)), msg_color)
		end
	end
end