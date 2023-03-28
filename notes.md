# Cribbage Notes

[Primary Rules](./rulebook_2020.pdf)
[Pagat Rules Reference](https://www.pagat.com/adders/crib6.html)

## Todo

* [ ] Opponent AI
    * [ ] Weighted choices?
        * [ ] Point values for certain choices, add together, highest total = final action
        * [ ] Introduce some randomness/"forgetfulness"
    * [ ] Choose card for crib
    * [ ] What card to play
        * [ ] During pegging
            * [ ] Keep lower cards until end of round unless it makes more sense to play them immediately
* Graphics
    * [ ] Draw stock deck
    * [ ] Rounded card corners
    * [x] Graphical board
        * [x] Draw brown background rectangle
    * [x] Card backs?
    * [ ] See opponent's hand?
    * [ ] Card drop shadow?
    * [x] Display face cards by letter, not number
    * [ ] Peg Board
        * [ ] Make 120 holes instead of current 135
            * [x] Take from left side
            * [ ] Replace with printed score
* Refactor decks
    * [ ] Crib
    * [ ] Player Hand
    * [ ] Tableau Hand
    * [ ] Tableau Deck?
* Gamestates
    * [x] Title
    * [ ] Deal and discard to crib
        * [x] Deal cards to players
        * [ ] Players discard to crib
        * [ ] Deal starter
    * [x] Main play
    * [ ] Scoring
        * [ ] Manual vs. automatic
* [x] AI play card after player
    * [x] Random
    * Strategy
* Scoring
    * Graphics
        * Game gamestate
            * Pegging
                * [ ] List running total?
                * [ ] Start card rank = Jack, 2 points "two for his heels"
                * [ ] Ace = 1 point
                * [ ] 2-9 = face value points
                * [ ] 10, Jack, Queen, King = 10 points
                * [ ] Running total from 1 to 31 then resets
                * [ ] Exactly 31 = 2 points "thirty-one for two"
                * [ ] If neither can reach 31, last to play gets 1 point "one for the go" "one for last"
                * [ ] If current player can't play without going over 31 and the other can, the other player plays
        * Scoring gamestate

## Done

~~* [ ] Round start mechanics~~
~~* [ ] Round middle mechanics~~
* [x] Select card in hand
    * [x] Card (or deck?) has 'selected' property
    * [x] 'Selected' = different fill color
    * [x] Get index of 'selected'
    * [x] Left key pressed
        ~~* [ ] If index == 1 do nothing~~
        * [x] if (index == 1) index = #deck
        * [x] index = index - 1
    * [x] Right key pressed
        ~~* [ ] If index == #deck do nothing~~
        * [x] if (index == #deck) index = 1
        * [x] index = index + 1
* [x] Objects know how to draw/print themselves
* [x] Play card from hand
    * [x] X button pressed
        * [x] Remove card from player hand
        * [x] Add card to tableau hand