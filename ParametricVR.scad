/** @file ParametricVR.scad
 * @copyright Copyright (c) 2021 Marceline Cramer
 * SPDX-License-Identifier: MIT
 */

include <Chassis.scad>;
include <FaceDummy.scad>;
include <FacePlate.scad>;

show_dummy = false;
plate_width = 135;
plate_height = 70;
interior_depth = 80;
exterior_depth = 40;
ipd = 64;
lens_diameter = 45;
lens_distance = 25;

if (show_dummy) {
  color([0.4, 0.4, 1.0])
  translate([-lens_distance,0,0])
  FaceDummy(ipd);
}

color([0.4, 1, 0.4])
difference() {
  translate([interior_depth,0,0])
  Chassis(plate_width, plate_height, interior_depth + exterior_depth + lens_distance);

  translate([-lens_distance,0,0])
  Head();
}

color([1.0, 0.4, 0.4])
FacePlate(plate_width, plate_height, lens_diameter, ipd);
