package src

Pipe :: struct {
    sprite_2d: Sprite_2D
}

pipe_draw :: proc(p: ^Pipe) {
    sprite_2d_draw(&p.sprite_2d)
}

pipe_update :: proc(p: ^Pipe) {
    
}