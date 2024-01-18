extends Node2D
const BLOCO = preload("res://bloco.tscn")
const PERSONAGEM_1 = preload("res://personagem1.tscn")
var num_blocos = 10  # Altere para o número desejado de blocos
var espacamento = 80  # Altere conforme necessário
# Called when the node enters the scene tree for the first time.
func _ready():
	for i in range(num_blocos):
		var bloco = BLOCO.instantiate()
		bloco.position.x = i * espacamento
		bloco.position.y = 600
		add_child(bloco)
	var personagem1 = PERSONAGEM_1.instantiate()
	personagem1.position.x = 100
	personagem1.position.y = 500
	add_child(personagem1)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
