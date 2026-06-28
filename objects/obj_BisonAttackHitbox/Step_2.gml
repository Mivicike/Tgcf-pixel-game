switch (floor(image_index))
{
    case 0:
    case 1:
    case 10:
    case 11:
    case 12:
        active = false;
        break;
    default:
        active = true;
        break;
}

visible = active;
x = obj_Bison.x;
y = obj_Bison.y;