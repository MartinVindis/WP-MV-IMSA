// Simtek - World Endurance Series
// Simtek © 2014

// Conventions:
//
// +x = left
// +z = rear
// +y = up
// +pitch = nose up
// +yaw = nose right
// +roll = right
//
// [BODY]  - a rigid mass with mass and inertial properties
// [JOINT] - a ball joint constraining an offset of one body to an
//           offset of another body (eliminates 3 DOF)
// [HINGE] - a constraint restricting the relative rotations of two
//           bodies to be around a single axis (eliminates 2 DOF).
// [BAR]   - a constraint holding an offset of one body from an offset of
//           another body at a fixed distance (eliminates 1 DOF).
// [JOINT&HINGE] - both the joint and hinge constraints, forming the
//           conventional definition of a hinge (eliminates 5 DOF).
//
//////////////////////////////////////////////////////////////////////////

// Body including all rigidly attached parts (wings, barge boards, etc.)
[BODY]
name=body mass=(0.0) inertia=(0.0,0.0,0.0)
pos=(0.0,0.0,0.0) ori=(0.0,0.0,0.0)

// Front spindles
[BODY]
name=fl_spindle mass=(10.0) inertia=(0.025,0.0240,0.0190)
pos=(0.780,0.0,-1.570) ori=(0.0,0.0,0.0)

[BODY]
name=fr_spindle mass=(10.0) inertia=(0.025,0.0240,0.0190)
pos=(-0.780,0.0,-1.570) ori=(0.0,0.0,0.0)

// Front wheels
[BODY]
name=fl_wheel mass=(22.0) inertia=(1.597,0.998,0.998)
pos=(0.835,0.0,-1.570) ori=(0.0,0.0,0.0)

[BODY]
name=fr_wheel mass=(22.0) inertia=(1.597,0.998,0.998)
pos=(-0.835,0.0,-1.570) ori=(0.0,0.0,0.0)

// Rear spindles
[BODY]
name=rl_spindle mass=(10.0) inertia=(0.025,0.0240,0.0190)
pos=(0.760,0.0,1.320) ori=(0.0,0.0,0.0)

[BODY]
name=rr_spindle mass=(10.0) inertia=(0.025,0.0240,0.0190)
pos=(-0.760,0.0,1.320) ori=(0.0,0.0,0.0)

// Rear wheels (includes half of rear-axle)
[BODY]
name=rl_wheel mass=(26.0) inertia=(2.100,1.335,1.335)
pos=(0.815,0.0,1.320) ori=(0.0,0.0,0.0)

[BODY]
name=rr_wheel mass=(26.0) inertia=(2.100,1.335,1.335)
pos=(-0.815,0.0,1.320) ori=(0.0,0.0,0.0)

// Fuel in tank is not rigidly attached - it is attached with springs and
// dampers to simulate movement.  Properties are defined in the HDV file.
[BODY]
name=fuel_tank mass=(1.0) inertia=(1.0,1.0,1.0)
pos=(0.0,0.0,0.0) ori=(0.0,0.0,0.0)

// Driver's head is not rigidly attached, and it does NOT affect the vehicle
// physics.  Position is from the eyepoint defined in the VEH file, while
// other properties are defined in the head physics file.
[BODY]
name=driver_head mass=(5.0) inertia=(0.02,0.02,0.02)
pos=(0.0,0.0,0.0) ori=(0.0,0.0,0.0)

//////////////////////////////////////////////////////////////////////////
//
// Constraints
//
//////////////////////////////////////////////////////////////////////////

// Front wheel and spindle connections
[JOINT&HINGE]
posbody=fl_wheel negbody=fl_spindle pos=fl_wheel axis=(-0.835,0.0,0.0)

[JOINT&HINGE]
posbody=fr_wheel negbody=fr_spindle pos=fr_wheel axis=(0.835,0.0,0.0)

// Front left suspension (2 A-arms + 1 steering arm = 5 links)
[BAR] // forward upper arm
name=fl_fore_upper posbody=body negbody=fl_spindle pos=(0.140,0.075,-1.630) neg=(0.735,0.105,-1.570)

[BAR] // rearward upper arm
posbody=body negbody=fl_spindle pos=(0.140,0.075,-1.320) neg=(0.735,0.105,-1.570)

[BAR] // forward lower arm
posbody=body negbody=fl_spindle pos=(0.05,-0.120,-1.660) neg=(0.735,-0.115,-1.570)

[BAR] // rearward lower arm
name=fl_fore_lower posbody=body negbody=fl_spindle pos=(0.05,-0.120,-1.290) neg=(0.735,-0.115,-1.570)

[BAR] // steering arm (must be named for identification)
name=fl_steering posbody=body negbody=fl_spindle pos=(0.14,0.075,-1.690) neg=(0.735,0.105,-1.640)

// Front right suspension (2 A-arms + 1 steering arm = 5 links)
[BAR] // forward upper arm
name=fr_fore_upper posbody=body negbody=fr_spindle pos=(-0.140,0.075,-1.630) neg=(-0.735,0.105,-1.570)

[BAR] // rearward upper arm
posbody=body negbody=fr_spindle pos=(-0.140,0.075,-1.320) neg=(-0.735,0.105,-1.570)

[BAR] // forward lower arm
posbody=body negbody=fr_spindle pos=(-0.05,-0.120,-1.660) neg=(-0.735,-0.115,-1.570)

[BAR] // rearward lower arm
name=fr_fore_lower posbody=body negbody=fr_spindle pos=(-0.05,-0.120,-1.290) neg=(-0.735,-0.115,-1.570)

[BAR] // steering arm (must be named for identification)
name=fr_steering posbody=body negbody=fr_spindle pos=(-0.14,0.075,-1.690) neg=(-0.735,0.105,-1.640)

// Rear left suspension (2 A-arms + 1 straight link = 5 links)
[BAR] // forward upper arm
posbody=body negbody=rl_spindle pos=(0.100,0.095,1.020) neg=(0.745,0.105,1.320)

[BAR] // rearward upper arm
posbody=body negbody=rl_spindle pos=(0.100,0.095,1.420) neg=(0.745,0.105,1.320)

[BAR] // forward lower arm
posbody=body negbody=rl_spindle pos=(0.050,-0.09,1.020) neg=(0.745,-0.105,1.320)

[BAR] // rearward lower arm
posbody=body negbody=rl_spindle pos=(0.050,-0.09,1.420) neg=(0.745,-0.105,1.320)

[BAR] // straight link
posbody=body negbody=rl_spindle pos=(0.050,0.0195,1.520) neg=(0.745,0.02,1.520)

// Rear right suspension (2 A-arms + 1 straight link = 5 links)
[BAR] // forward upper arm
posbody=body negbody=rr_spindle pos=(-0.100,0.095,1.020) neg=(-0.745,0.105,1.320)

[BAR] // rearward upper arm
posbody=body negbody=rr_spindle pos=(-0.100,0.095,1.420) neg=(-0.745,0.105,1.320)

[BAR] // forward lower arm
posbody=body negbody=rr_spindle pos=(-0.050,-0.09,1.020) neg=(-0.745,-0.105,1.320)

[BAR] // rearward lower arm
posbody=body negbody=rr_spindle pos=(-0.050,-0.09,1.420) neg=(-0.745,-0.105,1.320)

[BAR] // straight link
posbody=body negbody=rr_spindle pos=(-0.050,0.0195,1.520) neg=(-0.745,0.02,1.520) 
// Rear spindle and wheel connections

[JOINT&HINGE]
posbody=rl_wheel negbody=rl_spindle pos=rl_wheel axis=(0.815,0.0,0.0)

[JOINT&HINGE]
posbody=rr_wheel negbody=rr_spindle pos=rr_wheel axis=(0.815,0.0,0.0)



