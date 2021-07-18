module Eye(eye_width=24) {
	smooth_amount = 3.0;

	hull() {
	  translate([0, -eye_width/2, 0])
		  sphere(smooth_amount);

		translate([0, eye_width/2, 0])
		  sphere(smooth_amount);

		sphere(d=eye_width * 0.6);
	}
}

module FaceDummy(ipd=64) {
  translate([0,-ipd/2, 0])
	  Eye();
	translate([0, ipd/2, 0])
	  Eye();
}
