n = 8; // Number of petals
flower_radius = 15;

$fa = 1;
$fs = 0.4;

module petal() {
	scale ([1.33,1,1])
		cylinder(r=15,h=2,center=true);
}

module petals() {
	step = 360 / n;
	for (angle=[0:step:359]) {
		dx = flower_radius * cos(angle);
		dy = flower_radius * sin(angle);
		translate([dx,dy,0])
			rotate([5,-20,angle])
			petal();
	}
}

module flower() {
	petals();
	translate([0,0,-8])
		cylinder(r=15, h=9.5);
}
flower();
