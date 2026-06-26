package src

import "vendor:raylib"


Yellow_Bird :: struct {
    sprite_2d: Sprite_2D,
    velocity:  f32,
    rectangle_collider_2d: Rectangle_Collider_2D
}

yellow_bird_update :: proc(y_b: ^Yellow_Bird, p_m: ^Pipe_Manager, score: ^i32) {
    y_b.velocity += GRAVITY
    y_b.rectangle_collider_2d.position = y_b.sprite_2d.transform_2d.position
    y_b.rectangle_collider_2d.size.x = f32(y_b.sprite_2d.texture.width)
    y_b.rectangle_collider_2d.size.y = f32(y_b.sprite_2d.texture.height)
    if raylib.IsKeyPressed(raylib.KeyboardKey.SPACE) {
        y_b.velocity = FLAP_FORCE
    }
    for &pipe_pair in p_m.pairs {
        if rectangle_collider_check(y_b.rectangle_collider_2d, pipe_pair.top.rectangle_collider_2d) {
            score^ = 0
        }
        if rectangle_collider_check(y_b.rectangle_collider_2d, pipe_pair.bottom.rectangle_collider_2d) {
            score^ = 0
        }
    }
    y_b.sprite_2d.transform_2d.position.y += y_b.velocity
}

yellow_bird_draw :: proc(y_b: ^Yellow_Bird) {
    sprite_2d_draw(&y_b.sprite_2d)
}