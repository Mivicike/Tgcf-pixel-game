/// @description A manager for handling dialogues in the game
function DialogueManager() constructor {
	/// @type {Struct.DialogueData}
	dialogue = undefined;
	dialogue_instance = undefined;

	// Internal flag to prevent dialogue spamming should only be altered inside this script
	can_dialogue_trigger = true;
	dialogue_cooldown_timer = 0;
	dialogue_cooldown_duration = 30; // Cooldown duration in steps (e.g., 30 steps = 0.5 seconds at 60 FPS)

	static update = function() {
		var dialogue_prevented = instance_exists(obj_Dialogue) || instance_exists(Obj_Shop);
		if (dialogue_prevented)
		{
			dialogue_cooldown_timer = dialogue_cooldown_duration;
		}
		else
		{
			if (dialogue_cooldown_timer > 0) {
				dialogue_cooldown_timer--;
			}

		}

		can_dialogue_trigger = dialogue_cooldown_timer == 0;
	}

	static start_new_dialogue = function(_dialogue) {
		dialogue = _dialogue;

		/// @type {Id.Instance.obj_Dialogue}
		dialogue_instance = instance_create_depth(0, 0, 0, obj_Dialogue);
		dialogue_instance.messages = dialogue.messages;

		return dialogue_instance;
	}

	static can_dialogue_start = function() {
		return can_dialogue_trigger;
	}

	static is_dialogue_active = function() {
		return instance_exists(obj_Dialogue);
	}

	static complete_dialogue = function() {
		if (dialogue.open_shop_after_dialogue) {
			var new_shop = instance_create_depth(0, 0, -9999, Obj_Shop);
			new_shop.shop_items = dialogue.shop.shop_items;
			new_shop.num_items = array_length(dialogue.shop.shop_items);
			new_shop.purchase_flag = dialogue.shop.purchase_flag;

			audio_play_sound(snd_MenuOpen, 1, false);
		}

		if (instance_exists(dialogue_instance)) {
			instance_destroy(dialogue_instance);
		}

		dialogue = undefined;
		dialogue_instance = undefined;
	}
}