// created by ilu2404
// Body including all rigidly attached parts (wings, barge boards, etc.)
[BODY]
name=body mass=(0.0) inertia=(0.0,0.0,0.0)
pos=(0.0,0.00,0.0) ori=(0.0,0.0,0.0)

// Front spindles
[BODY]
name=fl_spindle mass=(15.5) inertia=(0.0275,0.0260,0.0245)
pos=(0.785,0.0,-1.345) ori=(0.0,0.0,0.0)

[BODY]
name=fr_spindle mass=(15.5) inertia=(0.0275,0.0260,0.0245)
pos=(-0.785,0.0,-1.345) ori=(0.0,0.0,0.0)

// Front wheels
[BODY]
name=fl_wheel mass=(22.0) inertia=(1.292,0.724,0.724)
pos=(0.805,0.0,-1.345) ori=(0.0,0.0,0.0)

[BODY]
name=fr_wheel mass=(22.0) inertia=(1.292,0.724,0.724)
pos=(-0.805,0.0,-1.345) ori=(0.0,0.0,0.0)

// Rear spindles
[BODY]
name=rl_spindle mass=(17.0) inertia=(0.0275,0.0260,0.0245)
pos=(0.785,0.0,1.345) ori=(0.0,0.0,0.0)

[BODY]
name=rr_spindle mass=(17.0) inertia=(0.0275,0.0260,0.0245)
pos=(-0.785,0.0,1.345) ori=(0.0,0.0,0.0)

// Rear wheels (includes half of rear-axle)
[BODY]
name=rl_wheel mass=(26.0) inertia=(1.446,0.875,0.875)
pos=(0.8075,0.0,1.345) ori=(0.0,0.0,0.0)

[BODY]
name=rr_wheel mass=(26.0) inertia=(1.446,0.875,0.875)
pos=(-0.8075,0.0,1.345) ori=(0.0,0.0,0.0)

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
posbody=fl_wheel negbody=fl_spindle pos=fl_wheel axis=(0.805,0.0,0.0)

[JOINT&HINGE]
posbody=fr_wheel negbody=fr_spindle pos=fr_wheel axis=(-0.805,0.0,0.0)

// Front left suspension (2 A-arms + 1 steering arm = 5 links)
[BAR] // forward upper arm
name=fl_fore_upper posbody=body negbody=fl_spindle pos=(0.382,0.050,-1.420) neg=(0.776,0.070,-1.345)

[BAR] // rearward upper arm
posbody=body negbody=fl_spindle pos=(0.382,0.050,-1.219) neg=(0.776,0.070,-1.345)

[BAR] // forward lower arm
posbody=body negbody=fl_spindle pos=(0.315,-0.098,-1.420) neg=(0.772,-0.078,-1.345)

[BAR] // rearward lower arm
name=fl_fore_lower posbody=body negbody=fl_spindle pos=(0.315,-0.098,-1.219) neg=(0.772,-0.078,-1.345)

[BAR] // steering arm (must be named for identification)
name=fl_steering posbody=body negbody=fl_spindle pos=(0.097,-0.055,-1.53) neg=(0.765,-0.055,-1.53)

// Front right suspension (2 A-arms + 1 steering arm = 5 links)
[BAR] // forward upper arm (used in steering lock calculation)
name=fr_fore_upper posbody=body negbody=fr_spindle pos=(-0.382,0.050,-1.420) neg=(-0.776,0.070,-1.345)

[BAR] // rearward upper arm
posbody=body negbody=fr_spindle pos=(-0.382,0.050,-1.219) neg=(-0.776,0.070,-1.345)

[BAR] // forward lower arm
name=fr_fore_lower posbody=body negbody=fr_spindle pos=(-0.315,-0.098,-1.420) neg=(-0.772,-0.078,-1.345)

[BAR] // rearward lower arm
posbody=body negbody=fr_spindle pos=(-0.315,-0.098,-1.219) neg=(-0.772,-0.078,-1.345)

[BAR] // steering arm (must be named for identification)
name=fr_steering posbody=body negbody=fr_spindle pos=(-0.097,-0.055,-1.53) neg=(-0.765,-0.055,-1.53)

// Rear left suspension (2 A-arms + 1 straight link = 5 links)
[BAR] // forward upper arm
posbody=body negbody=rl_spindle pos=(0.373,0.058,1.226) neg=(0.772,0.078,1.345)

[BAR] // rearward upper arm
posbody=body negbody=rl_spindle pos=(0.373,0.058,1.456) neg=(0.772,0.078,1.345)

[BAR] // forward lower arm
posbody=body negbody=rl_spindle pos=(0.300,-0.092,1.226) neg=(0.780,-0.070,1.345)

[BAR] // rearward lower arm
posbody=body negbody=rl_spindle pos=(0.300,-0.092,1.456) neg=(0.780,-0.070,1.345)

[BAR] // straight link
posbody=body negbody=rl_spindle pos=(0.108,-0.02,1.596) neg=(0.656,0.008,1.586)

// Rear right suspension (2 A-arms + 1 straight link = 5 links)
[BAR] // forward upper arm
posbody=body negbody=rr_spindle pos=(-0.373,0.058,1.226) neg=(-0.772,0.078,1.345)

[BAR] // rearward upper arm
posbody=body negbody=rr_spindle pos=(-0.373,0.058,1.456) neg=(-0.772,0.078,1.345)

[BAR] // forward lower arm
posbody=body negbody=rr_spindle pos=(-0.300,-0.092,1.226) neg=(-0.780,-0.070,1.345)

[BAR] // rearward lower arm
posbody=body negbody=rr_spindle pos=(-0.300,-0.092,1.456) neg=(-0.780,-0.070,1.345)

[BAR] // straight link
posbody=body negbody=rr_spindle pos=(-0.108,-0.02,1.596) neg=(-0.656,0.008,1.586)

// Rear spindle and wheel connections
[JOINT&HINGE]
posbody=rl_wheel negbody=rl_spindle pos=rl_wheel axis=(0.8075,0.0,0.0)

[JOINT&HINGE]
posbody=rr_wheel negbody=rr_spindle pos=rr_wheel axis=(-0.8075,0.0,0.0)
