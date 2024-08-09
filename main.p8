function _init()
	delay_start=0
	player_one_has_played=false
	gamestate="title"
	tableau_score=0
	is_dev_mode=false

	messages={}
	dev_mode={}
	state_history={}

	-- TODO: create gamestate history so we can go back to previous gamestates
	gamestates = {
		"title",
		"discard",
		"game",
		"messages"
	}

	updates = {
		update_title,
		update_discard,
		update_game,
		update_messages
	}

	draws = {
		draw_title,
		draw_discard,
		draw_game,
		draw_messages
	}

	card_sounds={0,1}

	srand(stat(95))
	Deck.setup_decks()
	Player.setup_players()
end

function _update()
	if #messages != 0 then
		gamestate="messages"
	end
	set_state()
	update()
end

function _draw()
	if #messages == 0 then
		draw()
	else
		display_alerts()
	end
	if #dev_mode>0 and is_dev_mode then
		rectfill(0,0,127,(7*#dev_mode) + 1,Color.BLACK)

		for x=1,#dev_mode do
			print(dev_mode[x],0,0+(x-1)*8,Color.GREEN)
		end
		
		dev_mode={}
	end
end