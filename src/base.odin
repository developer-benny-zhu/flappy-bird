package src

import "vendor:raylib"

Base :: struct {
    texture: raylib.Texture2D,
}

base_draw :: proc(b: ^Base) {
    source := raylib.Rectangle {
        0.0, 
        0.0,
        f32(b.texture.width),
        f32(b.texture.height)
    }
    destination := raylib.Rectangle {
        0.0,
        f32(WINDOW_HEIGHT - b.texture.height),
        WINDOW_WIDTH,
        f32(b.texture.height)
    }
    origin := raylib.Vector2 {
        0.0, 0.0
    }
    raylib.DrawTexturePro(b.texture, source, destination, origin, 0.0, raylib.WHITE)
}