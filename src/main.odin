package src

import "vendor:raylib"


main :: proc() {
    raylib.InitWindow(WINDOW_WIDTH, WINDOW_HEIGHT, WINDOW_TITLE)
    raylib.SetTargetFPS(WINDOW_FPS)

    assets := Assets {}
    assets_initialize(&assets)

    base := Base {
        texture = assets.base
    }
    for !raylib.WindowShouldClose() {
        raylib.BeginDrawing()
        raylib.ClearBackground(raylib.WHITE)
        base_draw(&base)
        raylib.EndDrawing()
    }
    assets_deinitialize(&assets)
    raylib.CloseWindow()

}