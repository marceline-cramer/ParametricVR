include <Chassis.scad>;
include <FaceDummy.scad>;
include <FacePlate.scad>;

plate_width = 135;
plate_height = 70;
ipd = 64;
eye_offset = 25;

color([0.4, 0.4, 1.0])
translate([-eye_offset,0,0])
FaceDummy(ipd);

color([0.4, 1, 0.4])
translate([50,0,0])
Chassis(plate_width=plate_width, plate_height=plate_height);

color([1.0, 0.4, 0.4])
FacePlate(width=plate_width, height=plate_height, lens_diameter=45, ipd=ipd);
