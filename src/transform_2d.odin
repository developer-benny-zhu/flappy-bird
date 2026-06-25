package src

import "vendor:raylib"


DEFAULT_TRANSFROM_2D :: Transform_2D {
    scale = raylib.Vector2 {1.0, 1.0}
}
// Although alignment is 8 bytes, rather not force a coercion to get precision we don't even need.
Transform_2D :: struct {
    position: raylib.Vector2,
    scale: raylib.Vector2,
    rotation: f32
}