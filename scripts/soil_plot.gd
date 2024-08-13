class_name SoilPlot
extends Area3D

var plant = null
@onready var roseInstance = load("res://scenes/rose.tscn")
@onready var sunflowerInstance = load("res://scenes/sunflower.tscn")
@onready var ypeInstance = load("res://scenes/ype.tscn")

func interact(_type : String = "0")->void:
    if plant == null :
        if _type == "0":
            return #harvesting
            
        if _type == "1":
            plant = ypeInstance.instantiate()
        
        elif _type == "2":
            plant = sunflowerInstance.instantiate()
        
        elif _type == "3":
            plant = roseInstance.instantiate()
        add_child(plant)
    
    elif plant.fullGrown: #can only harvest here
        plant.queue_free()
        plant = null
        #add code for flower in inventory
        
        
        
    
