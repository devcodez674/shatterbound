/// @description Manual View Control
if (!instance_exists(target)) exit;

// 1. Calculate the Overshoot (Leading the player)
var _move_dir = sign(target.xSpd); 
if (_move_dir != 0) {
    current_overshoot = lerp(current_overshoot, _move_dir * overshoot_dist, 0.05);
}

// 2. Smoothly follow the player's position + overshoot
x = lerp(x, target.x + current_overshoot, lerp_spd);
y = lerp(y, target.y - 16, lerp_spd);

// 3. Subtract half the camera size to get the TOP-LEFT corner
// GameMaker needs the top-left corner to position the view
var _vx = x - (cam_w / 2);
var _vy = y - (cam_h / 2);

// 4. Clamp (Keep the camera inside the room)
_vx = clamp(_vx, 0, room_width - cam_w);
_vy = clamp(_vy, 0, room_height - cam_h);

// 5. MANUALLY SET THE VIEW POSITION
camera_set_view_pos(view_camera[0], _vx, _vy);