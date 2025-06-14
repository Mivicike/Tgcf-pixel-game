if (liv > 0) {
    liv -= 1;
    audio_play_sound(Snd_DmgXieLian, 1, false);
    instance_destroy(other);
}
