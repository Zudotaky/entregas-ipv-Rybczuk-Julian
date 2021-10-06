extends Sprite

onready var fire_position:Position2D = $FirePosition

export var projectile_scene:PackedScene

var projectile_container:Node

func fire():
	var projectile_instance:Projectile = projectile_scene.instance()
	projectile_container.add_child(projectile_instance)
	projectile_instance.set_starting_values(fire_position.global_position,
	(get_global_mouse_position()-fire_position.global_position).normalized())
	projectile_instance.connect("delete_requested",self,"_on_projectile_deleterequested")

func _on_projectile_deleterequested(projectile):
	projectile_container.remove_child(projectile)
	projectile.queue_free()