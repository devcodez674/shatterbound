/// @description collison with player
// You can write your code in this editor

if (global.spawn_x != x || global.spawn_y != y) {
    global.spawn_x = x;
    global.spawn_y = y-32;
    
    // Trigger a small "saved" animation or sound
    //image_index = 1; 
    //audio_play_sound(snd_checkpoint, 1, false);
}
