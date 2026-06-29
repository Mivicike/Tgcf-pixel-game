switch (floor(image_index))
{
    case 0:
    case 1:
    case 2:
    case 3:
    case 4:
    case 10:
    case 11:
    case 12:
        active = false;
        break;
    default:
        active = true;
        break;
}

//visible = active;
if (instance_exists(obj_Bison))
{
    x = obj_Bison.x;
    y = obj_Bison.y;
}