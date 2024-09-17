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

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
    $Minutes.text = str(int($Timer.time_left)/60)
    $Seconds.text = str(int($Timer.time_left)%60)
    pass

func interact(playerRef:Player, soilRef:SoilPlot)->void:
    $InteractMenu.soilPlot = soilRef
    $InteractMenu.player = playerRef
    $InteractMenu.enable()
    
func is_interacting()->bool:
    return $InteractMenu.visible
    
