extends StateMachine

onready var move : State = $Move
onready var idle : State = $Move/Idle
onready var run : State = $Move/Run
onready var jump : State = $Move/Jump
onready var fall : State = $Move/Fall


func _ready() -> void:
	move.state_machine = self
	idle.state_machine = self
	run.state_machine = self
	fall.state_machine = self
