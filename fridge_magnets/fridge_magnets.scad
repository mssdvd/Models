layer_height = 0.2;
nozzle_size = 0.4;
width = 10;
magnet_radius = 2.5;
magnet_height = 1.6;
shell_thickness = 2 * layer_height;

$fa = 1;
$fs = 0.4;

module magnet() {
	cylinder(r = magnet_radius + 2 * nozzle_size, magnet_height + 2 * shell_thickness);
}

module magnets(lenght) {
	trans = [lenght / 2, 0];
	for (i = [-1:1]) {
		translate(i * trans)
			magnet();
	}
}

module stripe(lenght) {
	hull() {
		trans = [lenght / 2, 0];
		for (i = [-1:2:1]) {
			translate(i * trans)
				cylinder(r = width / 2, shell_thickness, center = true);
		}
	}
}

module fridge_magnet(lenght) {
	stripe(lenght);
	magnets(lenght);
}

lenghts = [
	80,
	160
	];

for (i = [0:len(lenghts)-1])
	translate([0, - i * width * 1.5])
		fridge_magnet(lenghts[i]);
