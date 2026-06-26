package src

import "vendor:raylib"
import "core:math/rand"

PIPE_GAP      :: 160.0
PIPE_DISTANCE :: 300.0

Pipe_Pair :: struct {
    top:    Pipe,
    bottom: Pipe,
}

Pipe_Manager :: struct {
    texture: raylib.Texture2D,
    pairs:   [4]Pipe_Pair,
    score: ^i32
}

randomize_pipe_height :: proc(pair: ^Pipe_Pair, x_pos: f32, texture_height: i32) {
    min_gap_center : f32 = 200.0 
    max_gap_center : f32 = 400.0 
    gap_center := rand.float32_range(min_gap_center, max_gap_center)

    pipe_h := f32(texture_height)
    pair.top.sprite_2d.transform_2d.position.x = x_pos
    pair.top.sprite_2d.transform_2d.position.y = gap_center - (PIPE_GAP / 2.0) - pipe_h
    pair.bottom.sprite_2d.transform_2d.position.x = x_pos
    pair.bottom.sprite_2d.transform_2d.position.y = gap_center + (PIPE_GAP / 2.0)
}

pipe_manager_initialize :: proc(p_m: ^Pipe_Manager) {
    for &pair, index in p_m.pairs {
        pair.top.sprite_2d.texture = p_m.texture
        pair.top.sprite_2d.tint = raylib.WHITE
        pair.top.sprite_2d.transform_2d = DEFAULT_TRANSFORM_2D
        pair.top.sprite_2d.flip_y = true
        pair.bottom.sprite_2d.texture = p_m.texture
        pair.bottom.sprite_2d.tint = raylib.WHITE
        pair.bottom.sprite_2d.transform_2d = DEFAULT_TRANSFORM_2D
        pair.bottom.sprite_2d.flip_y = false
        starting_x := 600.0 + f32(index) * PIPE_DISTANCE
        randomize_pipe_height(&pair, starting_x, p_m.texture.height)
    }
}

pipe_manager_update :: proc(p_m: ^Pipe_Manager) {
    for &pair in p_m.pairs {
        pair.top.sprite_2d.transform_2d.position.x -= 3.0
        pair.bottom.sprite_2d.transform_2d.position.x -= 3.0
        pipe_update(&pair.top)
        pipe_update(&pair.bottom)
        if pipe_pair_is_offscreen(&pair, p_m.texture.width) {
            furthest_x: f32 = 0.0
            for other_pair in p_m.pairs {
                if other_pair.top.sprite_2d.transform_2d.position.x > furthest_x {
                    furthest_x = other_pair.top.sprite_2d.transform_2d.position.x
                }
            }
            p_m.score^ += 1
            new_x := furthest_x + PIPE_DISTANCE
            randomize_pipe_height(&pair, new_x, p_m.texture.height)
        }
    }
}

pipe_pair_is_offscreen :: proc(pair: ^Pipe_Pair, texture_width: i32) -> bool {
    return pair.top.sprite_2d.transform_2d.position.x < -f32(texture_width)
}

pipe_manager_draw :: proc(p_m: ^Pipe_Manager) {
    for &pair in p_m.pairs {
        sprite_2d_draw(&pair.top.sprite_2d)
        sprite_2d_draw(&pair.bottom.sprite_2d)
    }
}