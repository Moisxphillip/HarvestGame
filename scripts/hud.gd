extends Control

#doesnot work like this, review 
var money = 10
var goal = 500

func start()->void:
    money = 10
    $Value.text = str(money)
    $GoalValue.text = str(goal)
    $Timer.start()
    $UI.show()
# Called when the node enters the scene tree for the first time.
func _ready():
    pass

func get_money(amount:int)->void:
    money+=amount
    $Value.text = str(money)


func spend_money(amount:int)->void:
    money-=amount
    $Value.text = str(money)


func _process(_delta):
    var sec = int($Timer.time_left)%60
    $Minutes.text = str(int($Timer.time_left)/60)
    $Seconds.text = "0" + str(sec) if sec<=9 else str(sec)
    pass


func interact(playerRef:Player, soilRef:SoilPlot)->void:
    $InteractMenu.soilPlot = soilRef
    $InteractMenu.player = playerRef
    $InteractMenu.enable()
    
    
func is_interacting()->bool:
    return $InteractMenu.visible
    

func _on_timer_timeout() -> void:
    $Timer.stop()
    if money < goal:
        get_tree().change_scene_to_file("res://scenes/game_over.tscn")
        return
    get_tree().change_scene_to_file("res://scenes/you_win.tscn")
    
func harvest(item_name):
    pass
    
