package src

import "vendor:raylib"

import "core:fmt"

main :: proc() {
    score :i32= 0
    raylib.InitWindow(WINDOW_WIDTH, WINDOW_HEIGHT, WINDOW_TITLE)
    raylib.SetTargetFPS(WINDOW_FPS)

    assets := Assets {}
    assets_initialize(&assets)

    base := Base {
        texture = assets.base
    }
    yellow_bird := Yellow_Bird {
        sprite_2d = Sprite_2D {
            transform_2d = DEFAULT_TRANSFORM_2D,
            texture = assets.yellow_bird,
            tint = raylib.WHITE
        }
    }
    pipe_manager := Pipe_Manager {
        score = &score,
        texture = assets.pipe
    }
    pipe_manager_initialize(&pipe_manager)
    for !raylib.WindowShouldClose() {
        raylib.BeginDrawing()
        raylib.ClearBackground(raylib.WHITE)
        score_text := fmt.tprintf("Score: %v", score)
        raylib.DrawText(fmt.ctprintf(score_text), 10, 10, 20, raylib.BLACK)
        pipe_manager_draw(&pipe_manager)
        pipe_manager_update(&pipe_manager)
        yellow_bird_update(&yellow_bird, &pipe_manager)
        base_draw(&base)
        yellow_bird_draw(&yellow_bird)
        raylib.EndDrawing()
    }
    assets_deinitialize(&assets)
    raylib.CloseWindow()

}