package src

import "vendor:raylib"
import "core:fmt"

Sprite_2D :: struct {
    texture: raylib.Texture2D,
    transform_2d: Transform_2D,
    tint: raylib.Color,
    flip_x: bool,
    flip_y: bool
}

sprite_2d_draw :: proc(s_2d: ^Sprite_2D) {
    when ODIN_DEBUG {
        if s_2d.texture == ZERO_TEXTURE_2D {
            fmt.println("Did you forget to set texture?")
        }
    }
    source := raylib.Rectangle {
        0.0,
        0.0,
        f32(-s_2d.texture.width) if s_2d.flip_x else f32(s_2d.texture.width),
        f32(-s_2d.texture.height) if s_2d.flip_y else f32(s_2d.texture.height)
    }
    destination := raylib.Rectangle {
        s_2d.transform_2d.position.x,
        s_2d.transform_2d.position.y,
        f32(s_2d.texture.width) * s_2d.transform_2d.scale.x,
        f32(s_2d.texture.height) * s_2d.transform_2d.scale.y
    }
    origin := raylib.Vector2 {0.0, 0.0}
    raylib.DrawTexturePro(s_2d.texture, source, destination, origin, s_2d.transform_2d.rotation, s_2d.tint)
}