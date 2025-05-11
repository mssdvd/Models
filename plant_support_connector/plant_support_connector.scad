// Customizable parameters
height = 29;		// Height of the connector halves
outer_radius = 9.5;	// Outer radius of the cylindrical part
inner_radius = 7.5;	// Inner radius of the hollow space
cube_width = 10;	// Width of the rectangular cutout
cube_length = 20;	// Length of the rectangular cutout
cube_offset = 10;	// Offset of the rectangular cutout from center
halves_distance = 16.5; // Distance between the two halves
epsilon = 0.002;	// Small addition to ensure proper differences

// Higher quality settings
$fa = 1;    // Minimum angle for fragments
$fs = 0.4;  // Minimum size of fragments

module empty_space(height) {
	// Central cylindrical cutout
	cylinder(h=height+epsilon, r=inner_radius, center=true);

	// Rectangular cutout
	translate([0, cube_offset, 0])
		cube([cube_width, cube_length, height+epsilon], center=true);
}

module connector_half() {
	difference() {
		// External shape
		cylinder(h=height, r=outer_radius, center=true);

		// Internal cutout
		empty_space(height);
	}
}

// Create the full connector
module full_connector() {
	// First half
	connector_half();

	// Second half
	translate([0, -halves_distance, 0])
	rotate([0, 90, 180])
		connector_half();
}

// Generate the model
full_connector();
