package src

Pipe :: struct {
    sprite_2d: Sprite_2D,
    rectangle_collider_2d: Rectangle_Collider_2D
}

pipe_draw :: proc(p: ^Pipe) {
    sprite_2d_draw(&p.sprite_2d)
}

pipe_update :: proc(p: ^Pipe) {
    p.rectangle_collider_2d.position = p.sprite_2d.transform_2d.position
    p.rectangle_collider_2d.size.x = f32(p.sprite_2d.texture.width)
    p.rectangle_collider_2d.size.y = f32(p.sprite_2d.texture.height)
}