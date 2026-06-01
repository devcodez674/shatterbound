draw_text(x, y - 32, state); 

// 1. GET INPUTS
var Key_Left     = keyboard_check(vk_left) || keyboard_check(ord("A"));
var Key_Right    = keyboard_check(vk_right) || keyboard_check(ord("D"));
var Key_up       = keyboard_check_pressed(vk_space); // Changed to _pressed for double jump logic
var Dash_Pressed = mouse_check_button_pressed(mb_right) || keyboard_check_pressed(vk_shift);

if (place_meeting(x, y + 1, Obj_ph_wall)) {
    coyote_counter = coyote_time_max; 
    jumps_count = 0; // RESET JUMPS ON GROUND
} else {
    coyote_counter--; 
}

// 2. STATE MACHINE
switch (state) {
    case "FREE":
        var _move = Key_Right - Key_Left;
        xSpd = _move * walk_spd;
        ySpd += grv;

        // --- IMPROVED JUMP LOGIC ---
        if (Key_up) {
            // First Jump (Coyote Time allows jumping slightly off ledges)
            if (coyote_counter > 0) {
                ySpd = -12;
                jumps_count = 1;
                coyote_counter = 0; // Consume coyote time
            } 
            // Double Jump
            else if (jumps_count < jumps_max && global.player_abilitys.canDoubleJump) {
                ySpd = -14; // Slightly shorter jump for the second one
                jumps_count++;
            }
        }

        // --- DASH TRIGGER ---
        if (Dash_Pressed && can_dash && global.player_abilitys.canDash) {
            var _is_midair = (coyote_counter <= 0);
            
            if (_is_midair) {
                var _dir = point_direction(x, y, mouse_x, mouse_y);
                xSpd = lengthdir_x(dash_spd, _dir);
                ySpd = lengthdir_y(dash_spd, _dir);
            } else {
                xSpd = sign(mouse_x - x) * dash_spd;
                ySpd = 0; 
            }

            state = "DASH";
            can_dash = false;
            alarm[0] = dash_duration; 
            alarm[1] = dash_cooldown; 
        }
    break;

    case "DASH":
        // Gravity is ignored here
    break;
}

// 3. COLLISION SYSTEM (No changes needed here)
if (place_meeting(x + xSpd, y, Obj_ph_wall)) {
    while (!place_meeting(x + sign(xSpd), y, Obj_ph_wall)) x += sign(xSpd);
    xSpd = 0;
}
x += xSpd;

if (place_meeting(x, y + ySpd, Obj_ph_wall)) {
    while (!place_meeting(x, y + sign(ySpd), Obj_ph_wall)) y += sign(ySpd);
    ySpd = 0;
}
y += ySpd;