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
    background := Background {
        sprite_2d = Sprite_2D {
            transform_2d = Transform_2D {
                position = raylib.Vector2 {0, 0},
                scale = raylib.Vector2 {2.777777778, 1.171875},
            },
            texture = assets.background,
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
        background_draw(&background)
        score_text := fmt.tprintf("Score: %v", score)
        raylib.DrawText(fmt.ctprintf(score_text), 10, 10, 20, raylib.BLACK)
        pipe_manager_draw(&pipe_manager)
        pipe_manager_update(&pipe_manager)
        yellow_bird_update(&yellow_bird, &pipe_manager, &score)
        base_draw(&base)
        yellow_bird_draw(&yellow_bird)
        raylib.EndDrawing()
    }
    assets_deinitialize(&assets)
    raylib.CloseWindow()

}