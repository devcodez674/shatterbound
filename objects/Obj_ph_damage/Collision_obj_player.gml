/// @description Insert description here
// You can write your code in this editor

with (other) {
    // 1. Move player to the last checkpoint
    x = global.spawn_x;
    y = global.spawn_y;
	global.player_stats.current_player_hp = global.player_stats.current_player_hp - 100
    
    // 2. Kill all momentum (Crucial for physics-heavy games)
    move_Spd = 0; // If using custom movement
    ySpd = 0;
    xSpd = 0;
	invincibility = true
call_later(0.5, time_source_units_seconds, function() {
    global.player_stats.current_player_hp = 100;
	call_later(1.5, time_source_units_seconds, function() {
		global.player_stats.invincibility = false
	});
});

    // 3. Optional: Screen shake or flash to hide the snap
    //scr_screen_shake(5, 10); 
}
