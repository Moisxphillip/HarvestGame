class_name SoilPlot
extends Area3D

var plant = null
@onready var roseInstance = load("res://scenes/plants/rose.tscn")
@onready var sunflowerInstance = load("res://scenes/plants/sunflower.tscn")
@onready var ypeInstance = load("res://scenes/plants/ype.tscn")


func _ready() -> void:
    $AnimationWatered.play("Dry")
    kill_pest()
    $Gecko.visible = false
    $GeckoTimer.stop()
    $PestTick.start()
    $Worms.kill()

func interact(_type : String = "0")->void:
    if $Worms.active and _type == "Kill":
        Hud.spend_money(1)
        kill_pest()
        return
    if _type == "Water":
        water()
        if plant:
            plant.watered()
        return
    
    if plant == null :
        if !$Worms.active:           
            if _type == "Ype":
                Hud.spend_money(1)
                plant = ypeInstance.instantiate()
            
            elif _type == "Sunflower":
                Hud.spend_money(2)
                plant = sunflowerInstance.instantiate()
            
            elif _type == "Rose":
                Hud.spend_money(3)
                plant = roseInstance.instantiate()
            if plant: add_child(plant)
            return
        else:
            print("cant plant there worms")
            return
    
    elif _type == "Harvest": #can only harvest here
        if plant.name == "Rose":
            Hud.get_money(12)
        elif plant.name == "Sunflower":
            Hud.get_money(8)
        elif plant.name == "Ype":
            Hud.get_money(4)
            
        plant.queue_free()
        plant = null

        
        
func is_planted()->bool:
    return plant != null
 
        
func is_watered()->bool:
    return !$WateredTimer.is_stopped()
 
        
func has_pests()->bool:
    return $Worms.active
 
        
func can_harvest()->bool:
    return false if plant==null else plant.fullGrown
 

func water()->void:
    $AnimationWatered.play("Wet")
    $WateredTimer.start()
    if plant:
        plant.watered()


func _process(_delta: float) -> void:
    pass
    
func kill_pest()->void:
    
    $PestTimer.stop()
    $GeckoTimer.start()#restart
    $Gecko.visible = true
    $Worms.kill()
    pass

func _on_pest_tick_timeout() -> void:
    var rnd = randf_range(0,1)
    if (plant and rnd < plant.pestChance) or rnd < 0.05:
        $Worms.activate()
        $PestTimer.start()
        $PestTick.stop()
        return
    $PestTick.start()#restart


func _on_pest_timer_timeout() -> void:
    $PestTimer.stop()
    if plant:
        plant.queue_free()
        plant = null


func _on_gecko_timer_timeout() -> void:
    $Gecko.visible = false
    $GeckoTimer.stop()
    $PestTick.start()


func _on_watered_timer_timeout() -> void:
    $WateredTimer.stop()
    $AnimationWatered.play("Dry")
    if plant:
        plant.dried()
