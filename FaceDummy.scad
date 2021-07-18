/** @file FaceDummy.scad
 * @copyright Copyright (c) 2021 Marceline Cramer
 * SPDX-License-Identifier: MIT
 */

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

module Head() {
  face_dia = 60;
	face_ratio = 0.4;
	face_space = face_dia * face_ratio;
	face_width = 136;
	face_height = 200;
	face_depth = 120;

	translate([-face_space - 30,0,0])
  resize([face_depth, face_width, face_height])
	hull() {
	  translate([0,0,-face_space]) sphere(face_dia);
		translate([0,0, face_space]) sphere(face_dia);
	}
}

module FaceDummy(ipd=64) {
  translate([0,-ipd/2, 0])
	  Eye();
	translate([0, ipd/2, 0])
	  Eye();
	Head();
}
