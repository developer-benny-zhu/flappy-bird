package src

import "vendor:raylib"


Yellow_Bird :: struct {
    sprite_2d: Sprite_2D,
    velocity:  f32,
}

yellow_bird_update :: proc(y_b: ^Yellow_Bird, p_m: ^Pipe_Manager) {
    y_b.velocity += GRAVITY
    if raylib.IsKeyPressed(raylib.KeyboardKey.SPACE) {
        y_b.velocity = FLAP_FORCE
    }
    
    y_b.sprite_2d.transform_2d.position.y += y_b.velocity
}

yellow_bird_draw :: proc(y_b: ^Yellow_Bird) {
    sprite_2d_draw(&y_b.sprite_2d)
}