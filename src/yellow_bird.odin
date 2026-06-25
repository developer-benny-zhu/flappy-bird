package src

import "vendor:raylib"
Yellow_Bird :: struct {
    sprite_2d: Sprite_2D,
}

yellow_bird_draw :: proc(y_b: ^Yellow_Bird) {
    sprite_2d_draw(&y_b.sprite_2d)
    y_b.sprite_2d.transform_2d.position.y += GRAVITY
}