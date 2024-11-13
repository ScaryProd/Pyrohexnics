extends AudioStreamPlayer


const background_music = preload("res://sounds/PyroheknicsFINALMP3.mp3")

func _play_music(music: AudioStream, volume = -1.0):
	if stream == music:
		return
	
	stream = music
	volume_db = volume
	play()

func play_background_music():
	_play_music(background_music)
