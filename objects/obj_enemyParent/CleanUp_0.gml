// Save the enemy's state as dead in the save data
if (hp <= 0) {
    scr_SaveData_SetEnemyState(id, {dead: true});
}