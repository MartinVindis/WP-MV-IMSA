// created by ilu2404
// Body including all rigidly attached parts (wings, barge boards, etc.)
[BODY]
name=body mass=(940.0) inertia=(1200,1784,484)
pos=(0.0,0.00,0.0) ori=(0.0,0.0,0.0)

// Front spindles
[BODY]
name=fl_spindle mass=(15.5) inertia=(1.0275,1.0260,1.0245)
pos=(0.829,0.0,-1.255) ori=(0.0,0.0,0.0)

[BODY]
name=fr_spindle mass=(15.5) inertia=(1.0275,1.0260,1.0245)
pos=(-0.829,0.0,-1.255) ori=(0.0,0.0,0.0)

// Front wheels
[BODY]
name=fl_wheel mass=(22.0) inertia=(1.292,1.724,1.724)
pos=(0.8705,0.0,-1.255) ori=(0.0,0.0,0.0)

[BODY]
name=fr_wheel mass=(22.0) inertia=(1.292,1.724,1.724)
pos=(-0.8705,0.0,-1.255) ori=(0.0,0.0,0.0)

// Rear spindles
[BODY]
name=rl_spindle mass=(17.0) inertia=(1.0275,1.0260,1.0245)
pos=(0.825,0.0,1.255) ori=(0.0,0.0,0.0)

[BODY]
name=rr_spindle mass=(17.0) inertia=(1.0275,1.0260,11.0245)
pos=(-0.825,0.0,1.255) ori=(0.0,0.0,0.0)

// Rear wheels (includes half of rear-axle)
[BODY]
name=rl_wheel mass=(26.0) inertia=(1.446,1.875,1.875)
pos=(0.858,0.0,1.255) ori=(0.0,0.0,0.0)

[BODY]
name=rr_wheel mass=(26.0) inertia=(1.446,1.875,1.875)
pos=(-0.858,0.0,1.255) ori=(0.0,0.0,0.0)

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
posbody=fl_wheel negbody=fl_spindle pos=fl_wheel axis=(0.8705,0.0,0.0)

[JOINT&HINGE]
posbody=fr_wheel negbody=fr_spindle pos=fr_wheel axis=(-0.8705,0.0,0.0)

// Front left suspension (2 A-arms + 1 steering arm = 5 links)
[BAR] // forward upper arm
name=fl_fore_upper posbody=body negbody=fl_spindle pos=(0.450,0.120,-1.395) neg=(0.795,0.120,-1.255)

[BAR] // rearward upper arm
posbody=body negbody=fl_spindle pos=(0.450,0.120,-1.105) neg=(0.795,0.120,-1.255)

[BAR] // forward lower arm
posbody=body negbody=fl_spindle pos=(0.420,-0.100,-1.395) neg=(0.790,-0.121,-1.255)

[BAR] // rearward lower arm
name=fl_fore_lower posbody=body negbody=fl_spindle pos=(0.420,-0.100,-1.105) neg=(0.790,-0.121,-1.255)

[BAR] // steering arm (must be named for identification)
name=fl_steering posbody=body negbody=fl_spindle pos=(0.144,0.0025,-1.435) neg=(0.798,0.0025,-1.425)

// Front right suspension (2 A-arms + 1 steering arm = 5 links)
[BAR] // forward upper arm (used in steering lock calculation)
name=fr_fore_upper posbody=body negbody=fr_spindle pos=(-0.450,0.120,-1.395) neg=(-0.795,0.120,-1.255)
 
[BAR] // rearward upper arm
posbody=body negbody=fr_spindle pos=(-0.450,0.120,-1.105) neg=(-0.795,0.120,-1.255)

[BAR] // forward lower arm
name=fr_fore_lower posbody=body negbody=fr_spindle pos=(-0.420,-0.100,-1.395) neg=(-0.790,-0.121,-1.255) 

[BAR] // rearward lower arm
posbody=body negbody=fr_spindle pos=(-0.420,-0.100,-1.105) neg=(-0.790,-0.121,-1.255)

[BAR] // steering arm (must be named for identification)
name=fr_steering posbody=body negbody=fr_spindle pos=(-0.144,0.0025,-1.435) neg=(-0.798,0.0025,-1.425)

// Rear left suspension (2 A-arms + 1 straight link = 5 links)
[BAR] // forward upper arm
posbody=body negbody=rl_spindle pos=(0.391,0.180,1.185) neg=(0.790,0.160,1.255)

[BAR] // rearward upper arm
posbody=body negbody=rl_spindle pos=(0.391,0.150,1.425) neg=(0.790,0.160,1.255)

[BAR] // forward lower arm
posbody=body negbody=rl_spindle pos=(0.242,-0.182,1.185) neg=(0.790,-0.150,1.255)

[BAR] // rearward lower arm
posbody=body negbody=rl_spindle pos=(0.242,-0.132,1.425) neg=(0.790,-0.150,1.255)

[BAR] // straight link
posbody=body negbody=rl_spindle pos=(0.17,0.008,1.54) neg=(0.790,0.008,1.54)

// Rear right suspension (2 A-arms + 1 straight link = 5 links)
[BAR] // forward upper arm
posbody=body negbody=rr_spindle pos=(-0.391,0.180,1.185) neg=(-0.790,0.160,1.255)

[BAR] // rearward upper arm
posbody=body negbody=rr_spindle pos=(-0.391,0.150,1.425) neg=(-0.790,0.160,1.255)

[BAR] // forward lower arm
posbody=body negbody=rr_spindle pos=(-0.242,-0.182,1.185) neg=(-0.790,-0.150,1.255)

[BAR] // rearward lower arm
posbody=body negbody=rr_spindle pos=(-0.242,-0.132,1.425) neg=(-0.790,-0.150,1.255)

[BAR] // straight link
posbody=body negbody=rr_spindle pos=(-0.17,0.008,1.54) neg=(-0.790,0.008,1.54)

// Rear spindle and wheel connections
[JOINT&HINGE]
posbody=rl_wheel negbody=rl_spindle pos=rl_wheel axis=(0.858,0.0,0.0)

[JOINT&HINGE]
posbody=rr_wheel negbody=rr_spindle pos=rr_wheel axis=(-0.858,0.0,0.0)
