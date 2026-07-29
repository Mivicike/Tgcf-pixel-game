event_inherited();

var _mission_active = scr_SaveData_GetFlag("sanlang_hunger_dialogue_done", false);
var _bought_ingredients = scr_SaveData_GetFlag("cooking_ingredients_bought", false);

if (_mission_active && !_bought_ingredients) {
	dialogue_sequence[0] = global.dialogues.StoreOwner_CookingIngredients;
} else {
	dialogue_sequence[0] = global.dialogues.test_dialogue;
}