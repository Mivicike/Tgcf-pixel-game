function scr_ExtractName(_target) {
    var fullName = sprite_get_name(_target.sprite_index);

    // Skip "Spr_"
    var startIndex = 5; // start after "Spr_"
    var baseEnd = 0;
    var caps = 0;

    for (var i = startIndex; i <= string_length(fullName); i++) {
        var ch = string_char_at(fullName, i);

        if (ch >= "A" && ch <= "Z") {
            caps += 1;

            // 2nd capital = animation starts
            if (caps == 3) {
                baseEnd = i - 1;
                break;
            }
        }
    }

    // If no second capital found, enemy name is everything after Spr_
    if (baseEnd == 0) baseEnd = string_length(fullName);

    // Extract: "Spr_" + <base>
    var baseName = string_copy(fullName, 1, baseEnd);

    return baseName;
}