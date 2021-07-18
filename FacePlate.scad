module FacePlateBase(width, height) {
  thickness = 3;
  translate([0, -width/2, -height/2])
	  cube([thickness, width, height]);
}

module LensMountShaft(lens_diameter, depth) {
  margin = 2;
  translate([0,0,-margin/2])
    cylinder(h=depth+margin, d=lens_diameter);
}

module LensMountEyeHole(lens_diameter, depth, thickness) {
  translate([0,0,1-depth])
    cylinder(h=depth, d=lens_diameter - thickness * 2);
}

module LensMountOuter(lens_diameter, depth, thickness) {
  translate([0,0,-thickness])
    cylinder(h=depth+thickness, d=lens_diameter + thickness * 2);
}

module LensMount(lens_diameter, thickness, depth=10) {
  rotate([0,90,0]) {
    difference() {
      LensMountOuter(lens_diameter, depth, thickness);
      LensMountEyeHole(lens_diameter, depth, thickness);
      LensMountShaft(lens_diameter, depth);
    }
  }
}

module FacePlate(width, height, lens_diameter, ipd, mount_thickness=3) {
  mount_depth = 10;
  difference() {
    FacePlateBase(width, height);
		translate([0,-ipd/2,0]) rotate([0,90,0]) cylinder(h=mount_depth, d=lens_diameter, center=true);
    translate([0, ipd/2,0]) rotate([0,90,0]) cylinder(h=mount_depth, d=lens_diameter, center=true);
  }

  translate([0,-ipd/2,0]) LensMount(lens_diameter, mount_thickness, mount_depth);
  translate([0, ipd/2,0]) LensMount(lens_diameter, mount_thickness, mount_depth);
}
