extends RigidBody

# class member variables go here, for example:
var power = 2
var rate = 2

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func lv(v):
	return transform.basis.xform(v)

func _physics_process(delta):
	var joy_throttle = (Input.get_joy_axis(0,2)+0.8)/2
	if joy_throttle < 0:
		joy_throttle = 0
	var joy_roll = -Input.get_joy_axis(0,0)
	var joy_pitch = -Input.get_joy_axis(0,1)
	var joy_yaw = -Input.get_joy_axis(0,3)
	angular_velocity = Vector3()
	print(joy_pitch)
	apply_impulse(Vector3(),lv(Vector3(0,joy_throttle*power,0)))
	angular_velocity = lv(Vector3(0 ,0,joy_roll*rate))
	angular_velocity = angular_velocity + lv(Vector3(joy_pitch*rate ,0,0))
	angular_velocity = angular_velocity + lv(Vector3(0,joy_yaw*rate,0))

