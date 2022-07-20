extends VBoxContainer

signal taskChecked()

onready var tasks = get_children()


func _ready():
	# When start, get access to all tasks on the list
	get_task_signal()


func get_task_signal():
	print("Initial task list:")
	for task in tasks:
		print(task.name)
		task.connect("checkbox_value_changed", self, "_on_Task_checkbox_value_changed")


func append_new_task():
	pass


# If task is checked then tell App that at least one task is checked
func _on_Task_checkbox_value_changed(checked:bool):
	if checked:
		print("One task was checked")
		emit_signal("taskChecked")
	else:
		print("Task unchecked")


func delete_checked_tasks():
	for task in tasks:
		if task.checked:
			task.queue_free()
	update_task_list()

# TODO: Fix tasks array not updating when erasing
func update_task_list():
	tasks.clear()
	print(tasks)
	tasks = get_children()
	print("New task list:")
	for task in tasks:
		print(task.name)
