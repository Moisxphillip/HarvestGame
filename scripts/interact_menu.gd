extends Control

var player = null
var soilPlot = null
@onready var hud = get_parent()

func _ready() -> void:
	visible = false
	$PlantOptions.visible = false


func enable()->void:
	visible = true
	$PlantOptions.visible = false
	
	$MainOptions/VBoxContainer/Plant.disabled = (soilPlot.is_planted() or soilPlot.has_pests())
	
	$MainOptions/VBoxContainer/Water.disabled = soilPlot.is_watered()
		
	$PlantOptions/VBoxContainer/Rose.disabled =  $"../UI/Bag".has_item_quantity("Rose Seed") > 0
	
	$PlantOptions/VBoxContainer/Sunflower.disabled = $"../UI/Bag".has_item_quantity("Sunflower Seed") > 0
	
	$PlantOptions/VBoxContainer/Ype.disabled = $"../UI/Bag".has_item_quantity("Ype Seed") > 0

	if hud.money < 1:
		$"MainOptions/VBoxContainer/Clear Pests".disabled = true
		
	else:
		$"MainOptions/VBoxContainer/Clear Pests".disabled = false
		

	
func _process(_delta: float) -> void:
	if soilPlot == null : return
	
	$MainOptions/VBoxContainer/Plant.disabled = (soilPlot.is_planted() or soilPlot.has_pests())
		
	$MainOptions/VBoxContainer/Harvest.disabled = !soilPlot.can_harvest()
	
	$MainOptions/VBoxContainer/Water.disabled = soilPlot.is_watered()
		
	$PlantOptions/VBoxContainer/Rose.disabled =  $"../UI/Bag".has_item_quantity("Rose Seed") <= 0
	$PlantOptions/VBoxContainer/Rose.text = "Rose (x"+str($"../UI/Bag".has_item_quantity("Rose Seed"))+")"
	
	$PlantOptions/VBoxContainer/Sunflower.disabled = $"../UI/Bag".has_item_quantity("Sunflower Seed") <= 0
	$PlantOptions/VBoxContainer/Sunflower.text = "Sunflower (x"+str($"../UI/Bag".has_item_quantity("Sunflower Seed"))+")"
	
	$PlantOptions/VBoxContainer/Ype.disabled = $"../UI/Bag".has_item_quantity("Ype Seed") <= 0
	$PlantOptions/VBoxContainer/Ype.text ="Ype (x"+str($"../UI/Bag".has_item_quantity("Ype Seed"))+")"
		
	if hud.money < 1:
		$"MainOptions/VBoxContainer/Clear Pests".disabled = true
	else:
		$"MainOptions/VBoxContainer/Clear Pests".disabled = false
		
		   
func disable()->void:
	soilPlot = null
	player = null
	visible = false
	

func _on_plant_pressed() -> void:
	$PlantOptions.visible = !$PlantOptions.visible


func _on_harvest_pressed() -> void:
	soilPlot.interact("Harvest")
	disable()


func _on_water_pressed() -> void:
	soilPlot.interact("Water")
	player.smachine.state.transition_to("Water")
	disable()


func _on_clear_pests_pressed() -> void:
	soilPlot.interact("Kill")
	player.smachine.state.transition_to("ClearPests")
	disable()


func _on_close_pressed() -> void:
	disable()


func _on_ype_pressed() -> void:
	#decrease money
	soilPlot.interact("Ype")
	disable()


func _on_sunflower_pressed() -> void:
	#decrease money
	soilPlot.interact("Sunflower")
	disable()


func _on_rose_pressed() -> void:
	#decrease money
	soilPlot.interact("Rose")
	disable()

