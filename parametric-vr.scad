ipd = 62;
ipd2 = ipd / 2;

module eye() {
	eye_width = 24;
	eye_width2 = eye_width / 2;

  hull() {
	  translate([0, -eye_width2, 0])
		  sphere(nan);

		translate([0, eye_width2, 0])
		  sphere(nan);

		sphere(d=eye_width * 0.6);
	}
}

module face() {
  translate([0, -ipd2, 0])
	  eye();
	translate([0, ipd2, 0])
	  eye();
}

face();

module personal_space() {
	face_dia = 60;
	face_ratio = 0.4;
  face_space = face_dia * face_ratio;
	face_width = 160;
	face_depth = 120;

  translate([-face_space, 0, 0])
	resize([face_depth, face_width, 0])
  hull() {
	  translate([0, 0, face_space]) sphere(face_dia);
		translate([0, 0, -face_space]) sphere(face_dia);
	}
}

lens_diameter = 38;
plate_width = 135;
plate_height = 70;

holder_thickness = 4;

module lens_base() {
  translate([35, 0, 0]) cube([5, plate_width, plate_height], center=true);
}

module lens_shaft() {
	// inner hole
	translate([0, 0, holder_thickness])
	cylinder(h=25, d=lens_diameter);
}

module lens_holder() {
  translate([20, 0, 0])
	rotate([0, 90, 0])
  difference() {
    // outer shell
    cylinder(h=25, d=lens_diameter + holder_thickness);

	  // eye hole
	  translate([0, 0, -2])
	  cylinder(h=30, d=lens_diameter - holder_thickness);

    // lens shaft
	  lens_shaft();
	}
}

module lens_plate() {
  difference() {
    lens_base();
		translate([20, -ipd2, 0]) rotate([0, 90, 0]) lens_shaft();
		translate([20,  ipd2, 0]) rotate([0, 90, 0]) lens_shaft();
	}

	translate([0, -ipd2, 0]) lens_holder();
	translate([0,  ipd2, 0]) lens_holder();
}

headset_width = plate_width + 5;
headset_height = 80;
headset_bulge = 90;  // owo

module headset_body() {
  translate([20, 0, 0])
  linear_extrude(headset_height, center=true)
  union() {
    translate([30, 0, 0])
    resize([headset_bulge, headset_width])
	  circle(d=20);

    square([60, headset_width], center=true);
	}
}

module headset_space() {
	cube([140, 135, 70], center=true);
}

module headset_shell() {
  difference() {
	  headset_body();
		headset_space();
		personal_space();
	}
}

headset_shell();
lens_plate();
