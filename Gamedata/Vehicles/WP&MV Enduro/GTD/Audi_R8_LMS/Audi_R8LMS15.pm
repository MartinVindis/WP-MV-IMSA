// created by ilu2404
// Body including all rigidly attached parts (wings, barge boards, etc.)
[BODY]
name=body mass=(0.0) inertia=(0.0,0.0,0.0)
pos=(0.0,0.0,0.0) ori=(0.0,0.0,0.0)

// Front spindles
[BODY]
name=fl_spindle mass=(15.5) inertia=(0.0275,0.0260,0.0245)
pos=(0.800,0.0,-1.325) ori=(0.0,0.0,0.0)

[BODY]
name=fr_spindle mass=(15.5) inertia=(0.0275,0.0260,0.0245)
pos=(-0.800,0.0,-1.325) ori=(0.0,0.0,0.0)

// Front wheels
[BODY]
name=fl_wheel mass=(20.0) inertia=(1.292,0.724,0.724)
pos=(0.822,0.0,-1.325) ori=(0.0,0.0,0.0)

[BODY]
name=fr_wheel mass=(20.0) inertia=(1.292,0.724,0.724)
pos=(-0.822,0.0,-1.325) ori=(0.0,0.0,0.0)

// Rear spindles
[BODY]
name=rl_spindle mass=(17.0) inertia=(0.0275,0.0260,0.0245)
pos=(0.770,0.0,1.325) ori=(0.0,0.0,0.0)

[BODY]
name=rr_spindle mass=(17.0) inertia=(0.0275,0.0260,0.0245)
pos=(-0.770,0.0,1.325) ori=(0.0,0.0,0.0)

// Rear wheels (includes half of rear-axle)
[BODY]
name=rl_wheel mass=(25.0) inertia=(1.446,0.875,0.875)
pos=(0.8025,0.0,1.325) ori=(0.0,0.0,0.0)

[BODY]
name=rr_wheel mass=(25.0) inertia=(1.446,0.875,0.875)
pos=(-0.8025,0.0,1.325) ori=(0.0,0.0,0.0)

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
posbody=fl_wheel negbody=fl_spindle pos=fl_wheel axis=(0.822,0.0,0.0)

[JOINT&HINGE]
posbody=fr_wheel negbody=fr_spindle pos=fr_wheel axis=(-0.822,0.0,0.0)

// Front left suspension (2 A-arms + 1 steering arm = 5 links)
[BAR] // forward upper arm
name=fl_fore_upper posbody=body negbody=fl_spindle pos=(0.425,0.080,-1.444) neg=(0.790,0.060,-1.325)

[BAR] // rearward upper arm
posbody=body negbody=fl_spindle pos=(0.425,0.080,-1.204) neg=(0.790,0.060,-1.325)

[BAR] // forward lower arm
posbody=body negbody=fl_spindle pos=(0.317,-0.073,-1.444) neg=(0.790,-0.058,-1.325)

[BAR] // rearward lower arm
name=fl_fore_lower posbody=body negbody=fl_spindle pos=(0.317,-0.073,-1.204) neg=(0.790,-0.058,-1.325)

[BAR] // steering arm (must be named for identification)
name=fl_steering posbody=body negbody=fl_spindle pos=(0.116, -0.005,-1.53) neg=(0.785, -0.005 ,-1.53)

// Front right suspension (2 A-arms + 1 steering arm = 5 links)
[BAR] // forward upper arm (used in steering lock calculation)
name=fr_fore_upper posbody=body negbody=fr_spindle pos=(-0.425,0.080,-1.444) neg=(-0.790,0.060,-1.325)

[BAR] // rearward upper arm
posbody=body negbody=fr_spindle pos=(-0.425,0.080,-1.204) neg=(-0.790,0.060,-1.325)

[BAR] // forward lower arm
name=fr_fore_lower posbody=body negbody=fr_spindle pos=(-0.317,-0.073,-1.444) neg=(-0.790,-0.058,-1.325)

[BAR] // rearward lower arm
posbody=body negbody=fr_spindle pos=(-0.317,-0.073,-1.204) neg=(-0.790,-0.058,-1.325)

[BAR] // steering arm (must be named for identification)
name=fr_steering posbody=body negbody=fr_spindle pos=(-0.116, -0.005,-1.53) neg=(-0.785, -0.005,-1.53)

// Rear left suspension (2 A-arms + 1 straight link = 5 links)
[BAR] // forward upper arm
posbody=body negbody=rl_spindle pos=(0.368,0.098,1.163) neg=(0.765,0.078,1.325)

[BAR] // rearward upper arm
posbody=body negbody=rl_spindle pos=(0.368,0.098,1.453) neg=(0.765,0.078,1.325)

[BAR] // forward lower arm
posbody=body negbody=rl_spindle pos=(0.295,-0.090,1.163) neg=(0.763,-0.080,1.325)

[BAR] // rearward lower arm
posbody=body negbody=rl_spindle pos=(0.295,-0.090,1.453) neg=(0.763,-0.080,1.325)

[BAR] // straight link
posbody=body negbody=rl_spindle pos=(0.100,0.039,1.603) neg=(0.765,0.015,1.623)

// Rear right suspension (2 A-arms + 1 straight link = 5 links)
[BAR] // forward upper arm
posbody=body negbody=rr_spindle pos=(-0.368,0.098,1.163) neg=(-0.765,0.078,1.325)

[BAR] // rearward upper arm
posbody=body negbody=rr_spindle pos=(-0.368,0.098,1.453) neg=(-0.765,0.078,1.325)

[BAR] // forward lower arm
posbody=body negbody=rr_spindle pos=(-0.295,-0.090,1.163) neg=(-0.763,-0.080,1.325)

[BAR] // rearward lower arm
posbody=body negbody=rr_spindle pos=(-0.295,-0.090,1.453) neg=(-0.763,-0.080,1.325)

[BAR] // straight link
posbody=body negbody=rr_spindle pos=(-0.100,0.039,1.603) neg=(-0.765,0.015,1.623)

// Rear spindle and wheel connections
[JOINT&HINGE]
posbody=rl_wheel negbody=rl_spindle pos=rl_wheel axis=(0.8025,0.0,0.0)

[JOINT&HINGE]  
posbody=rr_wheel negbody=rr_spindle pos=rr_wheel axis=(-0.8025,0.0,0.0)
