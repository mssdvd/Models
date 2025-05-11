height = 20;
outer_size = 2;
inner_radius = 5.5;
halves_distance = inner_radius * 2 + outer_size;
aperture_angle = 90;

$fa = 1;
$fs = 0.4;

module connector_half() {
	resize([0,0,height])
	rotate(aperture_angle / 2)
	rotate_extrude(angle=360 - aperture_angle) {
		translate([inner_radius + outer_size / 2, 0])
			square(outer_size, center=true);
	}
}

module full_connector() {
	connector_half();

	translate([-halves_distance, 0, -2.5])
		rotate([-90, -90, 180])
		connector_half();
}

full_connector();
