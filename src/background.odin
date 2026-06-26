package src

Background :: struct {
    sprite_2d: Sprite_2D
}

background_draw :: proc(b: ^Background) {
    sprite_2d_draw(&b.sprite_2d)
}