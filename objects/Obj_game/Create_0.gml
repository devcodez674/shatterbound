/// @description Full Game variables
// You can write your code in this editor
//general

//checkpoint
global.checkpoint_id = 0

//player
global.player_stats ={
	max_player_hp: 100,
	current_player_hp: 100,
	invincibility: false
}
global.limits = {
	max_Shards: 99999,
	max_Void_Crystals: 999,
	max_crystal_meter: 10
}
global.player_abilitys = {
	unlocked_Crystal_Breach: false,
	unlocked_Crystallization: false,
	canDash: true,
	canDoubleJump: true
}

global.spawn_x = obj_player.x;
global.spawn_y = obj_player.y;
//system stats
global.paused = false 
global.debug_mode = false

//Progression
	//PvE
		if global.player_abilitys.unlocked_Crystal_Breach = true{
			
		}	
		else if global.player_abilitys.unlocked_Crystallization = true{
			
		}
if debug_mode = true {
	
}
		