// Movement Physics
xSpd = 0;
ySpd = 0;
grv = 0.5;
walk_spd = 4;

// Dash Settings
can_dash = true;
dash_spd = 12;
dash_duration = 10; // How many frames the dash lasts
dash_cooldown = 40; // Frames before you can dash again

// State Management
state = "FREE";

//coyote time
coyote_time_max = 6; // Frames of "grace period" (about 0.1 seconds)
coyote_counter = 0;

//Double Jump
jumps_max = 2;   // Total jumps allowed
jumps_count = 0; // Current jump count

