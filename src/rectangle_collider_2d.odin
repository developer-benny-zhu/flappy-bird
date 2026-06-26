package src

import "vendor:raylib"

Rectangle_Collider_2D :: struct {
    position: raylib.Vector2,
    size:     raylib.Vector2,
}

a_is_entirely_to_the_left_of_b :: #force_inline proc(a, b: Rectangle_Collider_2D) -> bool {
    a_right_edge := a.position.x + a.size.x
    b_left_edge := b.position.x
    return a_right_edge <= b_left_edge
}
a_is_entirely_to_the_right_of_b :: #force_inline proc(a, b: Rectangle_Collider_2D) -> bool {
    a_left_edge := a.position.x
    b_right_edge := b.position.x + b.size.x
    return a_left_edge >= b_right_edge
}

a_is_entirely_above_b :: #force_inline proc(a, b: Rectangle_Collider_2D) -> bool {
    a_bottom_edge := a.position.y + a.size.y
    b_top_edge := b.position.y
    return a_bottom_edge <= b_top_edge
}

a_is_entirely_below_b :: #force_inline proc(a, b: Rectangle_Collider_2D) -> bool {
    a_top_edge := a.position.y
    b_bottom_edge := b.position.y + b.size.y
    return a_top_edge >= b_bottom_edge
}


rectangle_collider_check :: proc(a, b: Rectangle_Collider_2D) -> bool {
    if a_is_entirely_to_the_left_of_b(a, b) {
        return false
    }
    if a_is_entirely_to_the_right_of_b(a, b) { 
        return false
    }
    if a_is_entirely_above_b(a, b) {
        return false
    }
    if a_is_entirely_below_b(a, b) {
        return false
    }
    return true
}