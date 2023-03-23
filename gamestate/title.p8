function init_title()
end

function update_title()
    if btnp(5) then
        gamestate = "discard"
    end
end

function draw_title()
    cls(Color.BLUE)
    sspr(0, 32, 56, 17, 36, 52)
    print("press ❎", 49, 72)
end