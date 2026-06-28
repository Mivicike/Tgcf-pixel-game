switch (floor(image_index))
{
    case 12:
    case 13:
    case 14:
        active = false;
        break;
    default:
        active = true;
}

visible = active;
x = obj_Bison.x;
y = obj_Bison.y