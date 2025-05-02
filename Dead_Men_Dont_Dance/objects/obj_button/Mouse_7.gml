if text == "Play" {
	audio_stop_sound(snd_title_music);
	room_goto(Level1)
} else if text == "Instructions" {
	room_goto(Instructions)
} else if text == "Back" {
	room_goto(title_screen)
} else {
	game_end()	
}