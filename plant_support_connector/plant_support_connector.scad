height = 20;
outer_width_1 = 2;
outer_width_2 = 2.1;
inner_radius = 5.5;
halves_distance = inner_radius * 2 + max(outer_width_1, outer_width_2);

$fa = 1;
$fs = 0.4;

module connector_half(outer_width) {
	resize([0,0,height])
	rotate(aperture_angle / 2)
	rotate_extrude(angle=360 - aperture_angle) {
		translate([inner_radius + outer_width / 2, 0])
			square(outer_width, center=true);
	}
}

module full_connector() {
	connector_half(outer_width_1);

	down = inner_radius + outer_width_2 - height / 2;

	translate([-halves_distance, 0, down])
		rotate([-90, -90, 180])
		connector_half(outer_width_2);
}

full_connector();
