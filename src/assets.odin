package src

import "vendor:raylib"

Assets :: struct {
    base: raylib.Texture2D,
    yellow_bird: raylib.Texture2D,
    pipe: raylib.Texture2D
}

assets_initialize :: proc(a: ^Assets) {
    a.base = raylib.LoadTexture("assets/game_objects/base.png")
    a.yellow_bird = raylib.LoadTexture("assets/game_objects/yellowbird-midflap.png")
    a.pipe = raylib.LoadTexture("assets/game_objects/pipe.png")
}

assets_deinitialize :: proc(a: ^Assets) {
    raylib.UnloadTexture(a.base)
    raylib.UnloadTexture(a.yellow_bird)
    raylib.UnloadTexture(a.pipe)
}