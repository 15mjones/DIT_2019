extends Area2D

func _ready():
    connect("body_entered", self, "_on_RigidBody2D_body_entered")


func _on_RigidBody2D_body_enter(body):
    print("Collision")
    if (body.get_name() == "Player"):
        print("Ouch!")

