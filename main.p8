function _init()
	delay_start=0
	player_one_has_played=false
	gamestate="title"
	tableau_score=0

	messages={}
	dev_mode={}

	-- TODO: add 'messages' gamestate
	gamestates = {
		"title",
		"discard",
		"game",
	}

	updates = {
		update_title,
		update_discard,
		update_game,
	}

	draws = {
		draw_title,
		draw_discard,
		draw_game,
	}

	card_sounds={0,1}

	srand(stat(95))
	Deck.setup_decks()
	Player.setup_players()
end

function _update()
	if #messages == 0 then
		if btnp(5) then
			deli(messages)
		end
	end
	set_state()
	update()
end

function _draw()
	if #dev_mode>0 then
		rectfill(0,0,127,(6*#dev_mode) + 1,Color.BLACK)

		for x=1,#dev_mode do
			print(dev_mode[x],0,0+(x-1)*8,Color.GREEN)
		end
		
		dev_mode={}
	end
	if #messages == 0 then
		draw()
	else
		display_alerts()
	end
end