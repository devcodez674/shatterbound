/// @description Initialize Camera Variables
cam_w = 640;
cam_h = 416;

target = obj_player;
lerp_spd = 0.1; 
overshoot_dist = 64;
current_overshoot = 0;

// Force Viewport Settings
view_enabled = true;
view_visible[0] = true;

// Link this object to View 0
view_set_wport(0, cam_w);
view_set_hport(0, cam_h);

// Update camera internal size
camera_set_view_size(view_camera[0], cam_w, cam_h);

// Start at player position
if (instance_exists(target)) {
    x = target.x;
    y = target.y;
}