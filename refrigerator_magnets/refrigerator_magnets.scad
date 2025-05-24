layer_height = 0.2;
width = 10;
hole_radius = 4;

lenght_short = 80;
lenght_long = 160;

$fa = 1;
$fs = 0.4;

module hole() {
	cylinder(r = hole_radius);
}

module holes(lenght) {
	trans = [0, lenght / 2];
	for (i = [-1:1]) {
		translate(i * trans)
			hole();
	}
}

module stripe(lenght) {
	hull() {
		trans = [0, lenght / 2];
		for (i = [-1:2:1]) {
			translate(i * trans)
				cylinder(r = width / 2, layer_height * 2, center = true);
		}
	}
}

module refrigerator_magnet(lenght) {
	difference () {
		stripe(lenght);
		holes(lenght);
	}
}

refrigerator_magnet(lenght_short);

translate([width * 1.5, 0])
refrigerator_magnet(lenght_long);
