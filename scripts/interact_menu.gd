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
    
    #TODO update options in real time as well
    if soilPlot.is_planted() or soilPlot.has_pests():
        $MainOptions/VBoxContainer/Plant.disabled = true
    else:
        $MainOptions/VBoxContainer/Plant.disabled = false
        
    if !soilPlot.can_harvest():
        $MainOptions/VBoxContainer/Harvest.disabled = true
    else:
        $MainOptions/VBoxContainer/Harvest.disabled = false
        
    if soilPlot.is_watered():
        $MainOptions/VBoxContainer/Water.disabled = true
    else:
        $MainOptions/VBoxContainer/Water.disabled = false
    
func _process(_delta: float) -> void:
    if soilPlot == null : return
    
    if soilPlot.is_planted() or soilPlot.has_pests():
        $MainOptions/VBoxContainer/Plant.disabled = true
    else:
        $MainOptions/VBoxContainer/Plant.disabled = false
        
    if !soilPlot.can_harvest():
        $MainOptions/VBoxContainer/Harvest.disabled = true
    else:
        $MainOptions/VBoxContainer/Harvest.disabled = false
        
    if soilPlot.is_watered():
        $MainOptions/VBoxContainer/Water.disabled = true
    else:
        $MainOptions/VBoxContainer/Water.disabled = false
        
           
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

