function set_state()
	for i,state in ipairs(gamestates) do
		if state==gamestate then
			update=updates[i]
			draw=draws[i]
		end
	end
end

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

function update_game_btns()
	if btnp(5) and player_one.hand:get_index_of_selected() and (not player_one_has_played) then
		p1_selected_card = player_one.hand:give_selected_card()
		player_one.score = player_one.score + p1_selected_card:get_value()
		tableau_hand:take_card(p1_selected_card)
		play_rnd_card_snd()
		player_one_has_played = true
		delay_start = time()
	end
	if (time() - delay_start == 1) and player_one_has_played then
		p2_selected_card = player_two.hand:give_card()
		player_two.score = player_two.score + p2_selected_card:get_value()
		tableau_hand:take_card(p2_selected_card)
		play_rnd_card_snd()
		player_one_has_played = false
	end
end

function play_rnd_card_snd()
	sfx(rnd(card_sounds))
end