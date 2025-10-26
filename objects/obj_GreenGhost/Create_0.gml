// Hastighet när den går
walk_speed = 0.5;

// 0 = stilla, 1 = vänster, 2 = höger, 3 = upp, 4 = ner
state = 0;

// Tid tills nästa val
state_timer = irandom_range(60, 120); // 1-2 sek
