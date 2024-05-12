pico-8 cartridge // http://www.pico-8.com
version 42
__lua__
--main
#include util/color.p8
#include util/utils.p8
#include main.p8
#include models/card.p8
#include models/deck.p8
#include models/player.p8
#include models/pegboard.p8
#include gamestate/discard.p8
#include gamestate/game.p8
#include gamestate/title.p8

--✽
--☉
--🅾️❎⬅️➡️⬆️⬇️
__gfx__
00000000055005500005500000555500000550000005500055500555005555000555555505005550005555000055550005555550005555500555555000055550
00000000555555550055550000555500005555000055550055500550055555500550550555055055055005500550055005500550055005500550055000050550
00700700555555550555555005055050055555500050050005505500550000550000550055055055055005500550055000000550055000000550000000550550
00077000555555555555555555555555555555550050050005555000500000050000550005055055055005500550055000005550055555000555550000500550
00077000055555505555555555555555555555550555555005555000500000055500550005055055005555500055550000005500055005500550055005500550
00700700055555500555555005500550055005500550055005505500550000555500550005055055000005500550055000055500055005500000055005555550
00000000005555000055550000055000000550005500005555500550055555500555550055055055055005000550055000055000055005500550055000000550
00000000000550000005500000555500005555005500005555500555005550550055500055505550055555000055550000055000005555000555550000000550
05555550005555000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
05500550055005500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000550000005500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000550000005500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00555500000555000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000550005500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
05500550055005500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
05555500055555500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00055555555000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
05555555555000000000005500000550000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
55550000555000000000005500000550000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
55500000555000000000005500000550000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
55500000000000000000005500000550000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
55500000000000000000005500000550000055555000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
55500000000000000000005500000550000055005500000000000000000000000000000000000000000000000000000000000000000000000000000000000000
55500000000055055005505505500550550000005500550000000550000000000000000000000000000000000000000000000000000000000000000000000000
55500000000055555505505555550555555005505505555550055555000000000000000000000000000000000000000000000000000000000000000000000000
55500000000055500500005550050555005055555505000550550005000000000000000000000000000000000000000000000000000000000000000000000000
55500000000055000005505500050550005050055505000550555555000000000000000000000000000000000000000000000000000000000000000000000000
55550000555055000005505500050550005050005505000550550000000000000000000000000000000000000000000000000000000000000000000000000000
05555555555055000005505505550550555055505005550550550055000000000000000000000000000000000000000000000000000000000000000000000000
00055555555055000005505555500555550055555500555550055555000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000550000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000005500550000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000005555500000000000000000000000000000000000000000000000000000000000000000000000000000000
__label__
77777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777
77000707770007070700070007777770070077000777777007700770070007000777777777000777777777777777777777777777777777777777777777777777
77070707770707070707770707777707070707077777770777077707070707077770777777070777777777777777777777777777777777777777777777777777
77000707770007000700770077777707070707007777770007077707070077007777777777070777777777777777777777777777777777777777777777777777
77077707770707770707770707777707070707077777777707077707070707077770777777070777777777777777777777777777777777777777777777777777
77077700070707000700070707000700770707000777770077700700770707000777777777000777777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777
77000707770007070700070007777700070707700777777007700770070007000777777777000777777777777777777777777777777777777777777777777777
77070707770707070707770707777770770707070777770777077707070707077770777777070777777777777777777777777777777777777777777777777777
77000707770007000700770077777770770707070777770007077707070077007777777777070777777777777777777777777777777777777777777777777777
77077707770707770707770707777770770007070777777707077707070707077770777777070777777777777777777777777777777777777777777777777777
77077700070707000700070707000770770007007777770077700700770707000777777777000777777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777
77070777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777
77070777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777
77000777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777
77770777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777
77770777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777
77777770000000000000000000000000000000000000000000000000000000000000000000077777777777777777777777777777777777777777777777777777
77777770880080777777777777707777777777777077777777777777777777777777777777077777777777777777777777777777777777777777777777777777
77777770880080777777777777707777777777777077777777777777777777777777777777077777777777777777777777777777777777777777777777777777
77777770008800777707077777707777000777777077770007777777777777777777777777077777777777777777777777777777777777777777777777777777
77777770008800777707077777707777770777777077777707777777777777777777777777077777777777777777777777777777777777777777777777777777
77777770880080777700077777707777000777777077777707777777777777777777777777077777777777777777777777777777777777777777777777777777
77777770880080777777077777707777077777777077777707777777777777777777777777077777777777777777777777777777777777777777777777777777
77777770008800777777077777707777000777777077777707777777777777777777777777077777777777777777777777777777777777777777777777777777
77777770008800777777777777707777777777777077777777777777777777777777777777077777777777777777777777777777777777777777777777777777
77777770880080777777777777707777777777777077777777777777777777777777777777077777777777777777777777777777777777777777777777777777
77777770880080777777777777707777777777777077777777777777777777777777777777077777777777777777777777777777777777777777777777777777
77777770008800777778877777707777700777777077770000777777777777777777777777077777777777777777777777777777777777777777777777777777
77777770008800777788887777707777000077777077770000777777777777777777777777077777777777777777777777777777777777777777777777777777
77777770880080777888888777707770000007777077707007077777777777777777777777077777777777777777777777777777777777777777777777777777
77777770880080778888888877707700000000777077000000007777777777777777777777077777777777777777777777777777777777777777777777777777
77777770008800778888888877707700000000777077000000007777777777777777777777077777777777777777777777777777777777777777777777777777
77777770008800777888888777707770077007777077700770077777777777777777777777077777777777777777777777777777777777777777777777777777
77777770880080777788887777707777700777777077777007777777777777777777777777077777777777777777777777777777777777777777777777777777
77777770880080777778877777707777000077777077770000777777777777777777777777077777777777777777777777777777777777777777777777777777
77777770008800777777777777707777777777777077777777777777777777777777777777077777777777777777777777777777777777777777777777777777
77777770008800777777777777707777777777777077777777777777777777777777777777077777777777777777777777777777777777777777777777777777
77777770880080777777777777707777777777777077777777777777777777777777777777077777777777777777777777777777777777777777777777777777
77777770880080777777777777707777777777777077777777777777777777777777777777077777777777777777777777777777777777777777777777777777
77777770008800777777777777707777777777777077777777777777777777777777777777077777777777777777777777777777777777777777777777777777
77777770008800777777777777707777777777777077777777777777777777777777777777077777777777777777777777777777777777777777777777777777
77777770880080777777777777707777777777777077777777777777777777777777777777077777777777777777777777777777777777777777777777777777
77777770880080777777777777707777777777777077777777777777777777777777777777077777777777777777777777777777777777777777777777777777
77777770008800777777777777707777777777777077777777777777777777777777777777077777777777777777777777777777777777777777777777777777
77777770008800777777777777707777777777777077777777777777777777777777777777077777777777777777777777777777777777777777777777777777
77777770880080777777777777707777777777777077777777777777777777777777777777077777777777777777777777777777777777777777777777777777
77777770880080777777777777707777777777777077777777777777777777777777777777077777777777777777777777777777777777777777777777777777
77777770008800777777777777707777777777777077777777777777777777777777777777077777777777777777777777777777777777777777777777777777
77777770008800777777777777707777777777777077777777777777777777777777777777077777777777777777777777777777777777777777777777777777
77777770880080777777777777707777777777777077777777777777777777777777777777077777777777777777777777777777777777777777777777777777
77777770880080777777777777707777777777777077777777777777777777777777777777077777777777777777777777777777777777777777777777777777
77777770008800777777777777707777777777777077777777777777777777777777777777077777777777777777777777777777777777777777777777777777
77777770008800777777777777707777777777777077777777777777777777777777777777077777777777777777777777777777777777777777777777777777
77777770880080777777777777707777777777777077777777777777777777777777777777077777777777777777777777777777777777777777777777777777
77777770880080777777777777707777777777777077777777777777777777777777777777077777777777777777777777777777777777777777777777777777
77777770008800777777777777707777777777777077777777777777777777777777777777077777777777777777777777777777777777777777777777777777
77777770008800777777777777707777777777777077777777777777777777777777777777077777777777777777777777777777777777777777777777777777
77777770880080777777777777707777777777777077777777777777777777777777777777077777777777777777777777777777777777777777777777777777
77777770880080777777777777707777777777777077777777777777777777777777777777077777777777777777777777777777777777777777777777777777
77777770000000000000000000000000000000000000000000000000000000000000000000077777777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777
77777770000000000000000000000000000000000000000000000000000000000000077777777777777777777777777777777777777777777777777777777777
77777770777777777777707777777777777077777777777777777777777777777777077777777777777777777777777777777777777777777777777777777777
77777770777777777777707777777777777077777777777777777777777777777777077777777777777777777777777777777777777777777777777777777777
77777770777700077777707777070777777077700770007777777777777777777777077777777777777777777777777777777777777777777777777777777777
77777770777707077777707777070777777077770777707777777777777777777777077777777777777777777777777777777777777777777777777777777777
77777770777700077777707777000777777077770770007777777777777777777777077777777777777777777777777777777777777777777777777777777777
77777770777777077777707777770777777077770770777777777777777777777777077777777777777777777777777777777777777777777777777777777777
77777770777777077777707777770777777077700070007777777777777777777777077777777777777777777777777777777777777777777777777777777777
77777770777777777777707777777777777077777777777777777777777777777777077777777777777777777777777777777777777777777777777777777777
77777770777777777777707777777777777077777777777777777777777777777777077777777777777777777777777777777777777777777777777777777777
77777770777777777777707777777777777077777777777777777777777777777777077777777777777777777777777777777777777777777777777777777777
77777770777700007777707777000077777077777887777777777777777777777777077777777777777777777777777777777777777777777777777777777777
77777770777700007777707777000077777077778888777777777777777777777777077777777777777777777777777777777777777777777777777777777777
77777770777070070777707770700707777077788888877777777777777777777777077777777777777777777777777777777777777777777777777777777777
77777770770000000077707700000000777077888888887777777777777777777777077777777777777777777777777777777777777777777777777777777777
77777770770000000077707700000000777077888888887777777777777777777777077777777777777777777777777777777777777777777777777777777777
77777770777007700777707770077007777077788888877777777777777777777777077777777777777777777777777777777777777777777777777777777777
77777770777770077777707777700777777077778888777777777777777777777777077777777777777777777777777777777777777777777777777777777777
77777770777700007777707777000077777077777887777777777777777777777777077777777777777777777777777777777777777777777777777777777777
77777770777777777777707777777777777077777777777777777777777777777777077777777777777777777777777777777777777777777777777777777777
77777770777777777777707777777777777077777777777777777777777777777777077777777777777777777777777777777777777777777777777777777777

__sfx__
0001000008610096100c6101061015620246200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00010000066100a61010610186102e620000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
911a0000180500000016050180500000016050180501b05016050180501b0501605000000180501b0500000018050000001605018050000001605018050000001b0501905018050160501b050190501805000000
031a00000061000000000000000030610000000000000000006100000000000000003061000000000000000000610000000000000000306100000000000000000061000000000000000030610000000000000000
011a00000c1500000007150000000c1500000007150000000a1500000005150000000a1500000005150000000c1500000007150000000c1500000007150000000515007150081500a15005150071500815000000
011a000000050070500c0500705000050070500c050070500a0500505001050050500a05005050010500505000050070500c0500705000050070500c050070500a0500805007050050500a050050500105005050
911a000016050180501b0501b050000001d0501b0500000016050180501b0501b050000001d0501b05000000190501b0501d0501d05000000200501d05000000190501b0501d0501d05000000200502005000000
011a00000a0500505002050050500a0500505002050050500a0500505002050050500a05005050020500505000000000000000000000000000000000000000000000000000000000000000000000000000000000
911a00002205000000200501f050000001d0501b05019050180501605018050190501b0501d0501f05020050220501f0501b0501f050200501d050190501d0501f0501b050180501b0501d0501b0501905016050
__music__
01 07084a44
00 07084a44
00 0b084344
02 0d084344

