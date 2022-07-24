extends Control

onready var task_container = $TaskScroll/TaskContainer
onready var btn_delete = $ButtonMarginContainer/btnDelete


func _ready():
	btn_delete.connect("pressed", self, "delete_tasks")
	task_container.connect("num_tasks_changed", self, "check_button_change")

func delete_tasks():
	task_container.delete_checked_tasks()


func check_button_change(tasksSelected):
	if tasksSelected >= 1:
		print("Boton debe eliminar tasks")
	else:
		print("Boton debe añadir tasks")
