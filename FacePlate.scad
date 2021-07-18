module FacePlateBase(width, height) {
  thickness = 3;
  translate([-width/2, -height/2, 0])
	  cube([width, height, thickness]);
}

module LensMountShaft(lens_diameter) {
  cylinder(h=100, d=lens_diameter);
}

module LensMountEyeHole(lens_diameter, depth, thickness) {
  translate([0,0,1-depth])
    cylinder(h=depth, d=lens_diameter - thickness * 2);
}

module LensMountOuter(lens_diameter, depth, thickness) {
  translate([0,0,-thickness])
    cylinder(h=depth+thickness, d=lens_diameter + thickness * 2);
}

module LensMount(lens_diameter, thickness, depth=30) {
  difference() {
    LensMountOuter(lens_diameter, depth, thickness);
    LensMountEyeHole(lens_diameter, depth, thickness);
    LensMountShaft(lens_diameter);
  }
}

module FacePlate(width, height, lens_diameter, ipd, mount_thickness=3) {
  difference() {
    FacePlateBase(width, height);
		translate([-ipd/2,0,0]) cylinder(h=100, d=lens_diameter, center=true);
    translate([ ipd/2,0,0]) cylinder(h=100, d=lens_diameter, center=true);
  }

  translate([-ipd/2,0,0]) LensMount(lens_diameter, mount_thickness);
  translate([ ipd/2,0,0]) LensMount(lens_diameter, mount_thickness);
}
