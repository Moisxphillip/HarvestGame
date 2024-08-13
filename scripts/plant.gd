class_name Plant
extends StaticBody3D

@export var stepTime: float  = 5.0
var phases: int = 4
var currPhase: int = 0
@onready var timer: Timer = $Timer
var fullGrown : bool = false

func _ready():
    timer.wait_time = stepTime
    timer.start()
    $Animation.play("0")

func _on_timer_timeout():
    if currPhase < phases-2:
        currPhase+=1
        $Animation.play(str(currPhase))
        timer.start()
    else:
        currPhase+=1
        $Animation.play(str(currPhase))
        fullGrown = true
        timer.stop()
