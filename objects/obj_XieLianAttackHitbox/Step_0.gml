// Sync the hitbox's position and image index with the player character's position and animation frame
x = obj_XieLian.x;
y = obj_XieLian.y;
image_index = obj_XieLian.image_index;

switch(floor(image_index))
{
    case 0:
        active = false;
        break;
    default:
        active = true;
        break;
}


if (!active)
    return;

var hitByAttackNow = ds_list_create();
var hits = instance_place_list(x, y, obj_enemyParent, hitByAttackNow, false);
if (hits > 0) {
    for (var i = 0; i < hits; i++) {
        // If this instance has not yet been hit by this attack
        var hitID = hitByAttackNow[| i];
        if (ds_list_find_index(hit_by_attack, hitID) == -1) {
            ds_list_add(hit_by_attack, hitID);
            var _damage = damage;
            with(obj_XieLian) { // Trigger with player context to make sure all variables are accessible
                scr_Damage(hitID.id, _damage, self); // Damage depends on combo or not
            }
        }
    }

    // Destroy the hitbox as soon as it damages something
    instance_destroy()
}

if (image_index >= image_number - 1)
{
    instance_destroy();
}
