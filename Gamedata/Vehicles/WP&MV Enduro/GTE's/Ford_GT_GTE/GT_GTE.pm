// created by ilu2404
// Body including all rigidly attached parts (wings, barge boards, etc.)
[BODY]
name=body mass=(0.0) inertia=(0.0,0.0,0.0)
pos=(0.0,0.0,0.0) ori=(0.0,0.0,0.0)

// Front spindles
[BODY]
name=fl_spindle mass=(15.5) inertia=(0.0275,0.0260,0.0245)
pos=(0.760,0.0,-1.355) ori=(0.0,0.0,0.0)

[BODY]
name=fr_spindle mass=(15.5) inertia=(0.0275,0.0260,0.0245)
pos=(-0.760,0.0,-1.355) ori=(0.0,0.0,0.0)

// Front wheels
[BODY]
name=fl_wheel mass=(20.0) inertia=(1.292,0.724,0.724)
pos=(0.7995,0.0,-1.355) ori=(0.0,0.0,0.0)

[BODY]
name=fr_wheel mass=(20.0) inertia=(1.292,0.724,0.724)
pos=(-0.7995,0.0,-1.355) ori=(0.0,0.0,0.0)

// Rear spindles
[BODY]
name=rl_spindle mass=(17.0) inertia=(0.0275,0.0260,0.0245)
pos=(0.740,0.0,1.355) ori=(0.0,0.0,0.0)

[BODY]
name=rr_spindle mass=(17.0) inertia=(0.0275,0.0260,0.0245)
pos=(-0.740,0.0,1.355) ori=(0.0,0.0,0.0)

// Rear wheels (includes half of rear-axle)
[BODY]
name=rl_wheel mass=(25.0) inertia=(1.446,0.875,0.875)
pos=(0.809,0.0,1.355) ori=(0.0,0.0,0.0)

[BODY]
name=rr_wheel mass=(25.0) inertia=(1.446,0.875,0.875)
pos=(-0.809,0.0,1.355) ori=(0.0,0.0,0.0)

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
posbody=fl_wheel negbody=fl_spindle pos=fl_wheel axis=(0.7995,0.0,0.0)

[JOINT&HINGE]
posbody=fr_wheel negbody=fr_spindle pos=fr_wheel axis=(-0.7995,0.0,0.0)

// Front left suspension (2 A-arms + 1 steering arm = 5 links)
[BAR] // forward upper arm
name=fl_fore_upper posbody=body negbody=fl_spindle pos=(0.400,0.157,-1.450) neg=(0.700,0.180,-1.355)

[BAR] // rearward upper arm
posbody=body negbody=fl_spindle pos=(0.400,0.157,-1.260) neg=(0.700,0.180,-1.355)

[BAR] // forward lower arm
posbody=body negbody=fl_spindle pos=(0.350,-0.188,-1.470) neg=(0.710,-0.168,-1.355)

[BAR] // rearward lower arm
name=fl_fore_lower posbody=body negbody=fl_spindle pos=(0.350,-0.188,-1.240) neg=(0.710,-0.168,-1.355)

[BAR] // steering arm (must be named for identification)
name=fl_steering posbody=body negbody=fl_spindle pos=(0.120, 0.005,-1.58) neg=(0.700, 0.007 ,-1.58)

// Front right suspension (2 A-arms + 1 steering arm = 5 links)
[BAR] // forward upper arm (used in steering lock calculation)
name=fr_fore_upper posbody=body negbody=fr_spindle pos=(-0.400,0.157,-1.450) neg=(-0.700,0.180,-1.355)

[BAR] // rearward upper arm
posbody=body negbody=fr_spindle pos=(-0.400,0.157,-1.260) neg=(-0.700,0.180,-1.355)

[BAR] // forward lower arm
name=fr_fore_lower posbody=body negbody=fr_spindle pos=(-0.350,-0.188,-1.470) neg=(-0.710,-0.168,-1.355)

[BAR] // rearward lower arm
posbody=body negbody=fr_spindle pos=(-0.350,-0.188,-1.240) neg=(-0.710,-0.168,-1.355)

[BAR] // steering arm (must be named for identification)
name=fr_steering posbody=body negbody=fr_spindle pos=(-0.120, 0.005,-1.58) neg=(-0.700, 0.007,-1.58)

// Rear left suspension (2 A-arms + 1 straight link = 5 links)
[BAR] // forward upper arm
posbody=body negbody=rl_spindle pos=(0.403,0.160,1.220) neg=(0.730,0.178,1.355)

[BAR] // rearward upper arm
posbody=body negbody=rl_spindle pos=(0.403,0.160,1.480) neg=(0.730,0.178,1.355)

[BAR] // forward lower arm
posbody=body negbody=rl_spindle pos=(0.343,-0.182,1.120) neg=(0.720,-0.170,1.355)

[BAR] // rearward lower arm
posbody=body negbody=rl_spindle pos=(0.343,-0.182,1.355) neg=(0.720,-0.170,1.355)

[BAR] // straight link
posbody=body negbody=rl_spindle pos=(0.090,-0.000,1.604) neg=(0.580,0.015,1.604)

// Rear right suspension (2 A-arms + 1 straight link = 5 links)
[BAR] // forward upper arm
posbody=body negbody=rr_spindle pos=(-0.403,0.160,1.220) neg=(-0.730,0.178,1.355)

[BAR] // rearward upper arm
posbody=body negbody=rr_spindle pos=(-0.403,0.160,1.480) neg=(-0.730,0.178,1.355)

[BAR] // forward lower arm
posbody=body negbody=rr_spindle pos=(-0.343,-0.182,1.120) neg=(-0.720,-0.170,1.355)

[BAR] // rearward lower arm
posbody=body negbody=rr_spindle pos=(-0.343,-0.182,1.355) neg=(-0.720,-0.170,1.355)

[BAR] // straight link
posbody=body negbody=rr_spindle pos=(-0.090,-0.00,1.604) neg=(-0.580,0.015,1.604)

// Rear spindle and wheel connections
[JOINT&HINGE]
posbody=rl_wheel negbody=rl_spindle pos=rl_wheel axis=(0.809,0.0,0.0)

[JOINT&HINGE]
posbody=rr_wheel negbody=rr_spindle pos=rr_wheel axis=(-0.809,0.0,0.0)
