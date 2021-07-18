module ChassisCase(
    width,
		height,
		depth,
		bulge_depth) {
  linear_extrude(height, center=true) {
	  union() {
	    resize([bulge_depth*2, width])
		    circle(d=20);

		  translate([-depth/2,0,0])
		    square([depth, width], center=true);
	  }
	}
}

module ChassisInterior(width, height, depth) {
  margin = 5;
	back_depth = depth + margin;

	translate([-back_depth, -width/2, -height/2])
    cube([back_depth, width, height]);
}

module Chassis(
    plate_width,
    plate_height,
		side_depth=60,
	  shell_thickness=5,
	  bulge_depth=30) {
	case_width = plate_width + shell_thickness * 2;
	case_height = plate_height  + shell_thickness * 2;

  difference() {
  	ChassisCase(case_width, case_height, side_depth, bulge_depth);
		ChassisInterior(plate_width, plate_height, side_depth);
	}
}
