Pegboard = {}

function Pegboard.draw()
	rectfill(18,1,120,24,Color.BROWN)
	for i=0,2 do
		rectfill(21,4+i*6,117,6+i*6,player_one.color)
		rectfill(21,7+i*6,117,9+i*6,player_two.color)
		for j=0,7 do
			for k=0,4 do
				pset(23+j*12+k*2,5+i*6,Color.BLACK)
				pset(23+j*12+k*2,8+i*6,Color.BLACK)
			end
		end
	end
end

function Pegboard.draw_scores()
    rectfill(2, 2, 15, 10, player_one.color)
    rectfill(2, 15, 15, 23, player_two.color)
    print(player_one.score, 4, 4, Color.BLACK)
    print(player_two.score, 4, 17, Color.BLACK)
end

function Pegboard.draw_peg(player)
	-- TODO: calculate peg position based on player score
	-- 2 players: red and blue
	-- 40 holes per row, 3 rows per player, 6 rows altogether
	-- score / 40 = row
	-- score % 40 = hole
	-- red and blue player have same x position
	-- blue player y position is red player y position + 3
	p1score_x = 23 + (player_one.score / 40)
	p1score_y = 6 + (flr(player_one.score / 40) * 6)
end