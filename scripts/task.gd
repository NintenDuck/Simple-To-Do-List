extends HBoxContainer

signal checkbox_value_changed(checked)

onready var taskCheckBox = $TaskCheckBox
var checked = false
# Notifies the Task Container that the task has changed
# warning-ignore:unused_argument
func _on_TaskCheckBox_toggled(btn_pressed) -> void:
	checked = taskCheckBox.is_pressed()
	emit_signal("checkbox_value_changed",checked)
