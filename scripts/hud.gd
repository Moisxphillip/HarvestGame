extends Control

#doesnot work like this, review 
var money = 10

func start()->void:
    money = 10
    $Value.text = str(money)
    $Timer.start()
    
# Called when the node enters the scene tree for the first time.
func _ready():
    start()

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
    #game over playboy
    pass # Replace with function body.
