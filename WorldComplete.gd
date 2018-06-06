#WorldComplete.gd
extends Area2D
export(String, FILE,"*.tscn")var next_world    #selects file which contains new world
func _physics_process(delta):
	var bodies =get_overlapping_bodies()      #checks two body interaction
	for body in bodies:
		if body.name == "Player":         #if player body interacts load new scene
			get_tree().change_scene(next_world)
