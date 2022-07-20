extends VBoxContainer

signal num_tasks_changed(taskNumber)

onready var tasks = get_children()

var tasksSelected = 0

func _ready():
	# When start, get access to all tasks on the list
	get_task_signal()


func get_task_signal():
	for task in tasks:
		task.connect("checkbox_value_changed", self, "_on_Task_checkbox_value_changed")


func add_new_task():
	pass


func delete_checked_tasks():
	for task in tasks:
		if task.checked:
			task.queue_free()
	update_task_list()


func update_task_list():
	tasks.clear()
	tasksSelected = 0
	emit_signal("num_tasks_changed", tasksSelected)
	yield(get_tree().create_timer(0.1),"timeout")
	tasks = get_children()


func has_checked_tasks():
	for task in tasks:
		if tasks.checked:
			return true
	return false


# If task is checked then tell App that at least one task is checked
func _on_Task_checkbox_value_changed(checked:bool):
	if checked:
		tasksSelected += 1
	else:
		tasksSelected -= 1
	
	emit_signal("num_tasks_changed", tasksSelected)
	