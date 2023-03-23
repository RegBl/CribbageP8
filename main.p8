function _init()
	delay_start=0
	player_one_has_played=false
	gamestate="title"

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
	set_state()
	update()
end

function _draw()
	draw()
end