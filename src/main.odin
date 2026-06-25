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
    yellow_bird := Yellow_Bird {
        sprite_2d = Sprite_2D {
            transform_2d = DEFAULT_TRANSFROM_2D,
            texture = assets.yellow_bird,
            tint = raylib.WHITE
        }
    }
    for !raylib.WindowShouldClose() {
        raylib.BeginDrawing()
        raylib.ClearBackground(raylib.WHITE)
        base_draw(&base)
        yellow_bird_draw(&yellow_bird)
        raylib.EndDrawing()
    }
    assets_deinitialize(&assets)
    raylib.CloseWindow()

}