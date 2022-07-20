extends Control

onready var taskContainer = $TaskScroll/TaskContainer
onready var lowButton = $ButtonMarginContainer/ButtonContainer/Button


func _ready():
    lowButton.connect("pressed", self, "buttonPressed")
    pass


func buttonPressed():
    taskContainer.delete_checked_tasks()
