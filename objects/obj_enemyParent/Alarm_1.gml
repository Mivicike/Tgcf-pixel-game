// get current sprite name
var currentName = scr_ExtractName(id)


var baseName = string_copy(currentName, 1, string_length(currentName) - 1);
var baseIndex = asset_get_index(baseName + "Idle");

if (baseIndex != -1) sprite_index = baseIndex;


// remove red tint
image_blend = c_white;