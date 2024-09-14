class_name SoilPlot
extends Area3D

var plant = null
@onready var roseInstance = load("res://scenes/plants/rose.tscn")
@onready var sunflowerInstance = load("res://scenes/plants/sunflower.tscn")
@onready var ypeInstance = load("res://scenes/plants/ype.tscn")

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
        print(plant.name)
        if plant.name == "Rose":
            Hud.roseQty.text = str(int(Hud.roseQty.text)+1)
        elif plant.name == "Sunflower":
            Hud.sunflowerQty.text = str(int(Hud.sunflowerQty.text)+1)
        elif plant.name == "Ype":
            print(Hud.ypeQty.text)
            Hud.ypeQty.text = str(int(Hud.ypeQty.text)+1)
        plant.queue_free()
        plant = null
        #add code for flower in inventory
        
        
        
    
