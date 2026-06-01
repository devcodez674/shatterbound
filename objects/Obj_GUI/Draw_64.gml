/// @description Insert description here
// You can write your code in this editor

// Draw a simple background for the health bar
draw_set_color(c_black);
draw_rectangle(20, 20, 220, 50, false);

// Draw the actual health (assuming your player has a 'hp' variable)
draw_set_color(c_red);
// 200 is the width, obj_player.hp / max_hp gives you the percentage
draw_rectangle(20, 20, 20 + (global.player_stats.current_player_hp * 2), 50, false);

// Draw a label
draw_set_color(c_white);
draw_text(25, 28, "HP     ");

