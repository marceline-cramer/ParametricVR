module ChassisCase(
    width,
		height,
		bulge_depth) {
	back_depth = 60;

  linear_extrude(height, center=true) {
	  union() {
	    resize([bulge_depth*2, width])
		    circle(d=20);

		  translate([-back_depth/2,0,0])
		    square([back_depth, width], center=true);
	  }
	}
}

module ChassisInterior(width, height) {
	back_depth = 100;

	translate([-back_depth, -width/2, -height/2])
    cube([back_depth, width, height]);
}

module Chassis(
    plate_width,
    plate_height,
	  shell_thickness=5,
	  bulge_depth=30) {
	case_width = plate_width + shell_thickness * 2;
	case_height = plate_height  + shell_thickness * 2;

  difference() {
  	ChassisCase(case_width, case_height, bulge_depth);
		ChassisInterior(plate_width, plate_height);
	}
}
