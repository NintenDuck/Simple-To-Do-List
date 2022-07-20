extends Button

enum btnType {
	ADD,
	DELETE
}

onready var buttonType = btnType.ADD


func _on_Button_pressed():
	pass # Replace with function body.


func change_button_type(typeOfButton:String = "+"):
	if typeOfButton == '+':
		text = '+'
	else:
		text = '-'
