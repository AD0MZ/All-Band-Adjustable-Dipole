$fn=100;

// bring in the definitions of various nut holes.
use <nut and bolt holes.scad>

// create a ring to add to the bottom disk to make it taller (10mm).  (Could have subtracted a smaller disk.)
module base_plate_addition (){
difference (){
		cylinder (2,50,50);
		translate ([0,0,-.01])
		cylinder (2.02,44,44);
}
}

// Combine a 50MM disk with the ring built above.
module base_plate_flange (){
base_plate_addition ();
cylinder (8,50,50);
}



// Asssemble the disk and the extension rimg into a "cup".
module base_ring_plate (){
	translate ([0,0,8])
		base_plate_addition ();
		base_plate_flange();
}


// Create the cylinders that represent the Big holes (Assembled into a difference" module) (Opposed 180 degrees for easy rotation later)
module base_ring_holes_1 (){
translate  ([30,0,0])
	cylinder (8.02,14,14);
translate ([-30,0,0])
	cylinder (8.02,14,14);
}

// Create the cylinders that represent the two sizes of small holes. (Subtracted later)
module base_ring_holes_2 (){
translate  ([36,0,0])
	cylinder (8.02,8,8);
translate ([-36,0,0])
	cylinder (8.02,8,8);
translate  ([22,0,0])
	cylinder (8.02,4,4);
translate ([-22,0,0])
	cylinder (8.02,4,4);
}


// Create a "virtual ring" of holes for the nuts and screws.  Added to the "Difference" module later.  Easest to rotate them into correct orientation, and then move them out a fixed amount from center (no math!).
module nut_ring_holes (){
		translate ([40,0,0])
			rotate (-90,[0,0,1])
			rotate (-90,[1,0,0])
			m3_square_nut_WFB ();

		translate ([-40,0,0])
		rotate (90,[0,0,1])
		rotate (-90,[1,0,0])
			m3_square_nut_WFB ();

		translate ([0,-40,0])
		rotate (180,[0,0,1])
		rotate (-90,[1,0,0])
			m3_square_nut_WFB ();

		translate ([0,40,0])
		rotate (0,[0,0,1])
		rotate (-90,[1,0,0])
			m3_square_nut_WFB ();
}

// Combine all the "holes' into one object (module) for easy assembly and rotation.
module ring_holes_master (){
translate ([0,0,1])
		cylinder (7,11.05,11.05);

	translate ([0,0,0])
		cylinder (6,8,8);

	base_ring_holes_1 ();

	rotate (90,[0,0,1])
		base_ring_holes_1 ();

	rotate (45,[0,0,1])
		base_ring_holes_2 ();

	rotate (-45,[0,0,1])
		base_ring_holes_2 ();

	color("Red")
	translate ([0,0,2])
		rotate (27.25,[0,0,1])
		nut_ring_holes ();
}



// Combine the assembly into a module.  Makes it easy to "use" in other constructions and refer to by one name!  "base_plate"
module base_plate (){
difference (){
base_ring_plate ();
translate ([0,0,2])
ring_holes_master ();
}
}

base_plate ();
