extends Node2D
const BLOCO = preload("res://bloco.tscn")
var num_blocos = 10  # Altere para o número desejado de blocos
var espacamento = 32  # Altere conforme necessário
# Called when the node enters the scene tree for the first time.
func _ready():
	for i in range(num_blocos):
		var bloco = BLOCO.instance()
		bloco.position.x = i * espacamento
		add_child(bloco)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
