Pegboard = {}

function Pegboard.draw()
	player_colors={Color.RED,Color.BLUE}
	rectfill(6,1,120,24,Color.BROWN)
	for i=0,2 do
		rectfill(9,4+i*6,117,6+i*6,Color.RED)
		rectfill(9,7+i*6,117,9+i*6,Color.BLUE)
		for j=0,8 do
			for k=0,4 do
				pset(11+j*12+k*2,5+i*6,Color.BLACK)
				pset(11+j*12+k*2,8+i*6,Color.BLACK)
			end
		end
	end
end