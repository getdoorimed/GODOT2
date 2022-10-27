extends Node

onready var music = AudioStreamPlayer.new()

var music_tracks = {
	"main":"res://sfx/Music/[YT2mp3.info] - Alan Walker - Fade [COPYRIGHTED NCS Release] (320kbps).mp3",
	"title_track":"res://sfx/Music/[YT2mp3.info] - alan walker - faded (ncs release) at very low quality (320kbps).mp3",
}

var sound_effects = {
	"jump":"res://sfx/Music/[YT2mp3.info] - Retro 8 bit Jump Sound Effect for FREE!! iggchan (320kbps).mp3",
	
	
	
}

var music_db = 1
var sound_db = 1

func change_music_db(val):
	music_db = linear2db(val)
	
func change_sound_db(val):
	sound_db = linear2db(val)
	
func _ready():
	music.stream = load(music_tracks["main"])
	add_child(music)
	music.play()
