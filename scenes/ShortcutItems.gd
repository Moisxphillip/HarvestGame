extends GridContainer


# Called when the node enters the scene tree for the first time.
func _ready():
	#Associa o signal entre os slots de shortcut da bag e do usuário, para que seja atualizados ao mesmo tempo
	for i in range($"../Bag/Panel/ShortcutGrid".get_child_count()):
		get_child(i).sync_slot($"../Bag/Panel/ShortcutGrid".get_child(i))
		$"../Bag/Panel/ShortcutGrid".get_child(i).sync_slot(get_child(i))
		
	
