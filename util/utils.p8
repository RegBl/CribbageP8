function set_state()
	for i,state in ipairs(gamestates) do
		if state==gamestate then
			update=updates[i]
			draw=draws[i]
		end
	end
end

-- TODO: move gamestate-specific _btns() functions to their respective gamestate files?
function update_gamestate_btns()
	if btnp(1) then
		player_one.hand:select_next()
		selected_index = player_one.hand:get_index_of_selected()
	end
	if btnp(0) then
		player_one.hand:select_previous()
		selected_index = player_one.hand:get_index_of_selected()
	end
end

-- TODO: move to gamestate/discard.p8?
function update_discard_btns()
	if btnp(5) and player_one.hand:get_index_of_selected() and (not player_one_has_played) then
		crib:take_card(player_one.hand:give_selected_card())
		play_rnd_card_snd()
		player_one_has_played = true
		delay_start = time()
	end
	if (time() - delay_start == 1) and player_one_has_played then
		crib:take_card(player_two.hand:give_card())
		play_rnd_card_snd()
		player_one_has_played = false
	end
end

-- TODO: move to gamestate/game.p8?
function update_game_btns()
	if btnp(5) and player_one.hand:get_index_of_selected() and (not player_one_has_played) then
		p1_selected_card = player_one.hand:give_selected_card()
		if (handle_tableau_score(player_one, p1_selected_card:get_value())) then
			player_one.score = player_one.score + p1_selected_card:get_value()
			tableau_hand:take_card(p1_selected_card)
			play_rnd_card_snd()
			player_one_has_played = true
			delay_start = time()
		end
	end
	if (time() - delay_start == 1) and player_one_has_played then
		p2_selected_card = player_two:give_card()
		if (handle_tableau_score(player_two, p2_selected_card:get_value())) then
			player_two.score = player_two.score + p2_selected_card:get_value()
			tableau_hand:take_card(p2_selected_card)
			play_rnd_card_snd()
			player_one_has_played = false
		end
	end
end

function play_rnd_card_snd()
	sfx(rnd(card_sounds))
end

function handle_tableau_score(player, value)
	local is_valid_play = true
	tableau_score = tableau_score + value
	if tableau_score > 31 then
		add(messages, {msg="please play a card that doesn't exceed 31", color=Color.RED})
		add(messages, {msg="no really, if you try to play that card, you'll break the rules of the game, so please", color=Color.RED})
		add(messages, {msg="don't do it", color=Color.RED})
		is_valid_play = false
	end
	if tableau_score == 31 then
		player.score = player.score + 2
		tableau_score = 0
	end

	return is_valid_play
end

function change_gamestate(state_name)
	gamestate = state_name
	add(state_history, state_name)
end