// created by ilu2404
// Body including all rigidly attached parts (wings, barge boards, etc.)
[BODY]
name=body mass=(0.0) inertia=(0.0,0.0,0.0)
pos=(0.0,0.0,0.0) ori=(0.0,0.0,0.0)

// Front spindles
[BODY]
name=fl_spindle mass=(15.5) inertia=(0.0275,0.0260,0.0245)
pos=(0.712,0.0,-1.1865) ori=(0.0,0.0,0.0)

[BODY]
name=fr_spindle mass=(15.5) inertia=(0.0275,0.0260,0.0245)
pos=(-0.712,0.0,-1.1865) ori=(0.0,0.0,0.0)

// Front wheels
[BODY]
name=fl_wheel mass=(22.0) inertia=(1.292,0.724,0.724)
pos=(0.782,0.0,-1.1865) ori=(0.0,0.0,0.0)

[BODY]
name=fr_wheel mass=(22.0) inertia=(1.292,0.724,0.724)
pos=(-0.782,0.0,-1.1865) ori=(0.0,0.0,0.0)

// Rear spindles
[BODY]
name=rl_spindle mass=(17.0) inertia=(0.0275,0.0260,0.0245)
pos=(0.760,0.00,1.1865) ori=(0.0,0.0,0.0)

[BODY]
name=rr_spindle mass=(17.0) inertia=(0.0275,0.0260,0.0245)
pos=(-0.760,0.00,1.1865) ori=(0.0,0.0,0.0)

// Rear wheels (includes half of rear-axle)
[BODY]
name=rl_wheel mass=(26.0) inertia=(1.446,0.875,0.875)
pos=(0.810,0.0,1.1865) ori=(0.0,0.0,0.0)

[BODY]
name=rr_wheel mass=(26.0) inertia=(1.446,0.875,0.875)
pos=(-0.810,0.0,1.1865) ori=(0.0,0.0,0.0)

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
posbody=fl_wheel negbody=fl_spindle pos=fl_wheel axis=(0.782,0.0,0.0)

[JOINT&HINGE]
posbody=fr_wheel negbody=fr_spindle pos=fr_wheel axis=(-0.782,0.0,0.0)

// Front left suspension (2 A-arms + 1 steering arm = 5 links)
[BAR] // forward upper arm
name=fl_fore_upper posbody=body negbody=fl_spindle pos=(0.400,0.064,-1.1865) neg=(0.723,0.064,-1.1865)

[BAR] // rearward upper arm
posbody=body negbody=fl_spindle pos=(0.400,0.064,-1.45) neg=(0.723,0.064,-1.1865)

[BAR] // forward lower arm
posbody=body negbody=fl_spindle pos=(0.300,-0.060,-1.1865) neg=(0.708,-0.060,-1.1865)

[BAR] // rearward lower arm
name=fl_fore_lower posbody=body negbody=fl_spindle pos=(0.300,-0.060,-1.40) neg=(0.708,-0.060,-1.1865)

[BAR] // steering arm (must be named for identification)
name=fl_steering posbody=body negbody=fl_spindle pos=(0.142,-0.02,-1.395) neg=(0.710,-0.02,-1.395)

// Front right suspension (2 A-arms + 1 steering arm = 5 links)
[BAR] // forward upper arm (used in steering lock calculation)
name=fr_fore_upper posbody=body negbody=fr_spindle pos=(-0.400,0.064,-1.1865) neg=(-0.723,0.064,-1.1865)

[BAR] // rearward upper arm
posbody=body negbody=fr_spindle pos=(-0.400,0.064,-1.45) neg=(-0.723,0.064,-1.1865)

[BAR] // forward lower arm
name=fr_fore_lower posbody=body negbody=fr_spindle pos=(-0.300,-0.060,-1.1865) neg=(-0.708,-0.060,-1.1865)

[BAR] // rearward lower arm
posbody=body negbody=fr_spindle pos=(-0.300,-0.060,-1.40) neg=(-0.708,-0.060,-1.1865)

[BAR] // steering arm (must be named for identification)
name=fr_steering posbody=body negbody=fr_spindle pos=(-0.142,-0.02,-1.395) neg=(-0.710,-0.02,-1.395)

// Rear left suspension (2 A-arms + 1 straight link = 5 links)
[BAR] // forward upper arm
posbody=body negbody=rl_spindle pos=(0.482,0.072,1.1080) neg=(0.766,0.088,1.1680)

[BAR] // rearward upper arm
posbody=body negbody=rl_spindle pos=(0.482,0.088,1.2700) neg=(0.768,0.072,1.1980)

[BAR] // forward lower arm
posbody=body negbody=rl_spindle pos=(0.436,-0.160,1.0865) neg=(0.752,-0.170,1.1865)

[BAR] // rearward lower arm
posbody=body negbody=rl_spindle pos=(0.436,-0.166,1.2865) neg=(0.752,-0.170,1.1865)

[BAR] // straight link
posbody=body negbody=rl_spindle pos=(0.390,0.000,1.4365) neg=(0.755,-0.006,1.4365)

// Rear right suspension (2 A-arms + 1 straight link = 5 links)
[BAR] // forward upper arm
posbody=body negbody=rr_spindle pos=(-0.482,0.072,1.1080) neg=(-0.766,0.088,1.1680)

[BAR] // rearward upper arm
posbody=body negbody=rr_spindle pos=(-0.482,0.088,1.2700) neg=(-0.768,0.072,1.1980)

[BAR] // forward lower arm
posbody=body negbody=rr_spindle pos=(-0.436,-0.160,1.0865) neg=(-0.752,-0.170,1.1865)

[BAR] // rearward lower arm
posbody=body negbody=rr_spindle pos=(-0.436,-0.166,1.2865) neg=(-0.752,-0.170,1.1865)

[BAR] // straight link
posbody=body negbody=rr_spindle pos=(-0.390,0.000,1.4365) neg=(-0.755,-0.006,1.4365)

// Rear spindle and wheel connections
[JOINT&HINGE]
posbody=rl_wheel negbody=rl_spindle pos=rl_wheel axis=(0.810,0.0,0.0)

[JOINT&HINGE]
posbody=rr_wheel negbody=rr_spindle pos=rr_wheel axis=(-0.810,0.0,0.0)
