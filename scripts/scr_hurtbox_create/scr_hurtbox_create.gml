
function hurtbox_create(image_xscale, image_yscale, x_offset, y_offset){
    var _hurtbox = instance_create_layer(x, y, layer, obj_hurt_box); // use layer or depth as needed
    _hurtbox.owner = id;
    _hurtbox.image_xscale = image_xscale;
    _hurtbox.image_yscale = image_yscale;
    _hurtbox.x_offset = x_offset;
    _hurtbox.y_offset = y_offset;
    
    return _hurtbox;
}