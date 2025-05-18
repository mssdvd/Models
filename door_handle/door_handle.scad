epsilon = 0.01;

$fa = 1;
$fs = 0.4;

module handle() {
	resize([40, 0, 0])
		cylinder(h = 10, r = 10.5);
}

module interface() {
	difference() {
		translate([0, 0, 6.7-epsilon])
			cylinder(h = 1.8, r1 = 9.5, r2 = 3.6);
		translate([0, 0, 6.7-epsilon])
			cube([19, 2, 8.5], center = true);
	}
	translate([0, 0, 6.7-epsilon])
		cylinder(h = 4, r1 = 1.7, r2 = 3.8);
	cylinder(h = 6.7, r = 9.5);
}

difference() {
	handle();
	translate([0, 0, -epsilon])
		interface();
}
