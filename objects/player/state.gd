extends State
class_name PlayerState

var player: Player

func  _ready():
	await owner.ready
	player = owner
