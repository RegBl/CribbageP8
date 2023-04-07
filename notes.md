# Cribbage Notes

[Primary Rules](./rulebook_2020.pdf)
[Pagat Rules Reference](https://www.pagat.com/adders/crib6.html)

## Todo

* [ ] Opponent AI
    * [ ] Choose card for crib
    * [ ] What card to play
* Graphics
    * [ ] Draw stock deck
    * [ ] Rounded card corners
    * [x] Graphical board
        * [x] Draw brown background rectangle
    * [x] Card backs?
    * [ ] See opponent's hand?
    * [ ] Card drop shadow?
    * [x] Display face cards by letter, not number
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