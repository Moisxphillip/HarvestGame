class_name SoilPlot
extends Area3D

var plant = null
@onready var plantInstance = load("res://scenes/plant.tscn")

func interact(_type : String = "-")->void:
    if plant == null:
        plant = plantInstance.instantiate()
        add_child(plant)
    elif plant.fullGrown:
        plant.queue_free()
        plant = null
        
        
    
