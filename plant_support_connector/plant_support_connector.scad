height = 29;
outer_size = 2;
inner_radius = 7.5;
halves_distance = inner_radius * 2 + outer_size;
aperture_width = 10;

$fa = 1;
$fs = 0.4;

module connector_half() {
	aperture_angle = 2 * asin(aperture_width / (2 * inner_radius));
	resize([0,0,height])
	rotate(aperture_angle/2)
	rotate_extrude(angle=360-aperture_angle) {
		translate([inner_radius + outer_size/2, 0])
			square(outer_size, center=true);
	}
}

module full_connector() {
	connector_half();

	translate([-halves_distance, 0, 0])
		rotate([-90, 0, 180])
		connector_half();
}

full_connector();
