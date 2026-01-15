
state_timer -= 1;

if (state_timer <= 0) {
    if (irandom(1) == 0) {
        state = 0; 
    } else {
        state = irandom_range(1, 4);
    }
    
    state_timer = irandom_range(60, 120);
}

switch (state) {
    case 0: //idle
        sprite_index = Spr_GreenGhostIdle;
        hspeed = 0;
        vspeed = 0;
    break;
    
    case 1: // left
        sprite_index = Spr_GreenGhostWalking_Left;
        hspeed = -walk_speed;
        vspeed = 0;
    break;
    
    case 2: // right
        sprite_index = Spr_GreenGhostWalking_Right;
        hspeed = walk_speed;
        vspeed = 0;
    break;
    
    case 3: // up
        sprite_index = Spr_GreenGhostWalking_Left;
        hspeed = 0;
        vspeed = -walk_speed;
    break;
    
    case 4: // down
        sprite_index = Spr_GreenGhostWalking_Right; 
        hspeed = 0;
        vspeed = walk_speed;
    break;
}
