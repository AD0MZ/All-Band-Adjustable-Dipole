$fn=100;
$fa=1;

// bring in the definitions of various nut holes.
use <nut and bolt holes.scad>

module base_plate_flange (){
	// Draw the base flange and pipe socket
cylinder (7.9,45.9,45.9);
translate ([0,0,7.5])
	cylinder (25,18,18);
}



module base_ring_holes_1 (){
	// Draw the holes for element wires.
translate  ([34,0,0])
	cylinder (11.02,1.5,1.5);
translate  ([-34,0,0])
	cylinder (11.2,1.5,1.5);

}
module base_ring_holes_2 (){
	// Draw the little lighltening holes
translate  ([31,0,0])
	cylinder (8.02,11,11);
translate ([-31,0,0])
	cylinder (8.02,11,11);
}


module nut_ring_holes (){
	// Using "nuts and nolts.scad" draw and align the square nut holes
		translate ([37,0,0])
		rotate (90,[0,0,1])
		rotate (90,[1,0,0])
			m3_square_nut_WFB ();

		translate ([-37,0,0])
		rotate (-90,[0,0,1])
		rotate (90,[1,0,0])
			m3_square_nut_WFB ();

		translate ([0,-37,0])
		rotate (90,[1,0,0])
			m3_square_nut_WFB ();

		translate ([0,37,0])
		rotate (180,[0,0,1])
		rotate (90,[1,0,0])
			m3_square_nut_WFB ();
}
module boss_ring_holes (){
	// Draw the screw holes for the bosses, using "nuts and bolts.scad"
		translate ([40,0,0])
		rotate (-90,[0,0,1])
		rotate (180,[1,0,0])
			m3_bolt_head_WFB ();

		translate ([-40,0,0])
		rotate (90,[0,0,1])
		rotate (180,[1,0,0])
			m3_bolt_head_WFB ();

		translate ([0,-40,0])
		rotate (180,[0,0,1])
		rotate (180,[1,0,0])
			m3_bolt_head_WFB ();

		translate ([0,40,0])
		rotate (0,[0,0,1])
		rotate (180,[1,0,0])
			m3_bolt_head_WFB ();
}
module ring_holes_master (){
	// Duplicate and rotate holes radially
	rotate (78,[0,0,1])
		base_ring_holes_2 ();
	rotate (-12,[0,0,1])
		base_ring_holes_2 ();

}
module bolt_hole (){
	// Draw the bigt horizontal holes in the pipe socket
	translate ([-45,0,20])
	rotate (90,[0,1,0])
		cylinder (90,3.5,3.5);
}

module web (){
rotate (90,[1,0,0])
difference (){
cube ([24.5,24.5,4]);
translate ([0,0,-.01])
rotate (45,[0,0,1])
cube ([45,45,4.2]);
}
}

module webs(){
translate ([-41,2,7.8])
web();
rotate (180,[0,0,1])
translate ([-41,2,7.8])
web();

rotate (90,[0,0,1])
translate ([-41,2,7.8])
web();
rotate (-90,[0,0,1])
translate ([-41,2,7.8])
web();
}





module base_plate (){
	rotate (34,[0,0,1])
	webs();
	// substract all the holes from the main flange
	difference (){
		base_plate_flange();

	translate ([0,0,3])
		ring_holes_master ();

	translate ([0,0,7])
		cylinder (30,13,13);

	color("Red")
	translate ([0,0,10])
		rotate (45,[0,0,1])
		boss_ring_holes ();

	translate ([0,0,4])
	rotate (26,[0,0,1])
		nut_ring_holes ();
	bolt_hole ();

	translate ([0,0,-1])
	rotate (14,[0,0,1])
		base_ring_holes_1 ();
// draw the coax exit hole in a hole.
rotate (22,[0,0,1])
translate ([0,33,-1])
	cylinder (12,4,4);
	
}
}

// Make everyting visible by calling the main module.
base_plate ();


