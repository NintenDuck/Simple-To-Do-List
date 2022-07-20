extends Control

onready var taskContainer = $TaskScroll/TaskContainer
onready var lowButton = $ButtonMarginContainer/ButtonContainer/Button


func _ready():
    lowButton.connect("pressed", self, "buttonPressed")
    taskContainer.connect("num_tasks_changed", self, "check_button_change")

func buttonPressed():
    taskContainer.delete_checked_tasks()


func check_button_change(tasksSelected):
    if tasksSelected >= 1:
        print("Boton debe eliminar tasks")
    else:
        print("Boton debe añadir tasks")
