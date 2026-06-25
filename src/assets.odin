package src

import "vendor:raylib"

Assets :: struct {
    base: raylib.Texture2D
}

assets_initialize :: proc(a: ^Assets) {
    a.base = raylib.LoadTexture("assets/game_objects/base.png")
}

assets_deinitialize :: proc(a: ^Assets) {
    raylib.UnloadTexture(a.base)
}