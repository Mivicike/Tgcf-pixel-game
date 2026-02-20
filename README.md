TGCF Pixel Game

A game inspired by TGCF where you play as Xie Lian and get to meet characters from TGCF.
It does not follow the exact story of TGCF though it does feature some specific scenes and 
follows the overall story, just overly simplified. You explore the pixel art world of TGCF,
speak with characters and fight ghosts. 

Project Overview

This is a GameMaker Studio 2 project that implements a pixel art-based game with player movement, 
combat mechanics, character interactions, and environmental gameplay.
The game is inspired by "Heaven Official's Blessing" (Tian Guan Ci Fu) with XieLian as the player.

Player Mechanics
- Character Control: The arrows ← ↑ → ↓ or WASD to move. C to dash. X to attack
   (3 different variations, first, second and third animation). Hold A for 2 seconds to heal a heart. Z to interact.
- Damage System: Hurt box + Hit box collision detection for taking and dealing damage
- States: Multiple player states including:
  - Free/Idle
  - Attack
  - Dash

Environment
Rooms, multiple explorable areas:
- Puqi Village + Houses in Puqi village such as the restaurant and your home.
- The forest
- Qi rong cave
- A path between Puqi village and water town
- Water Town + A culture house and communication array
- Black water (beach side)
- Ghost City + a gambling house
- The heavenly court

Little elements: Walls, fences and other obstacles for environmental navigation.
- Depth Sorting: Automatic depth management for proper sprite layering
- Warp Points: Change rooms via `Obj_Warp` that is a purple block. They are at doors, end of pathways etc.. 

Interactive Elements
-  Button system for menus (press button to switch rooms)
  - Parent button class for extensibility but there is currently only a start button. 
- Fullscreen: Press space to Toggle fullscreen display mode
- The player can press Z when close to an interactive object (like NPC) to speak with them,
   this triggers the dialogue system


Project Structure
Tgcf pixel game/
├── .gitattributes		Git configuration for line endings
├── datafiles/			Game data and resources
├── objects/			Game objects (GML classes)
│   ├── Fullscreen/		Fullscreen toggle functionality
│   ├── Obj_Button		UI button objects
│   ├── Obj_Warp/		Room transition triggers when collision
│   ├── obj_walls/		Wall collision objects
│   ├── obj_XieLian/		Main player character
│   ├── obj_GreenGhost/	Enemy/NPC character
│   ├── obj_hurt_box/	Damage collision system
│   ├── obj_depthSorter/	Depth management system
│   ├── obj_obstacle/		Environmental obstacles
│   ├── obj_fence/		Fence, when the player is in front he appears
in front and when he is behind he appears behind.
│   ├── obj_SmallWall/	Smaller wall collision objects
│   ├── ParticleSystem/	For rain, snow etc
│   └── per_depthObject/	Persistent depth objects
├── options/			Game configuration
│   ├── main/			Main game options
├── rooms/			Game rooms, like different spaces
│   ├── menu/		Main menu room, where the game opens
│   └── puqi_village/		Starter area
├── scripts/			GML scripts and functions
│   ├── scr_hurtbox_create/			Damage box initialization
│   ├── scr_PlayerState_Attack_Combo	Combat combo logic
│   ├── scr_PlayerStateDash/		Dash movement state
│   ├── scr_PlayerStateFree/		Free/Idle movement state
└── sprites/					All assets, images.

Scripts Overview

Player State Management
- scr_PlayerStateFree: Handles normal exploration movement and input
- scr_PlayerStateDash: Switches to a dash state, shows a dash animation and moves faster. Activate on C. 
- scr_PlayerState_Attack: When press X player switches to attack state. EX: If the
   sprite = right then the attack sprite will also be right. 


Technical Features
Collision System
- Hurt box and Hitbox collisions
- Wall collision for environmental barriers like trees or houses
- Depth sorting to have the right assets appear above or below the player


Getting Started

Download GameMaker and connect it with git desktop
Create a new branch from main
If you want you can start the game by pressing F5 or the play button a little right from the top left corner.
In the assets browser you will see all of the folders. They are all sorted, so all
objects are under the objects and all sprites are under sprites. The player is obj_XieLian. 

Future Development
- Additional rooms and story progression
- More enemy types and NPC interactions
- Inventory system
- Additional sounds
- Dialogue system
- Save/load, checkpoints functionality
- Additional combat mechanics
- Teleportations that the player can unlock
- Cutscenes
