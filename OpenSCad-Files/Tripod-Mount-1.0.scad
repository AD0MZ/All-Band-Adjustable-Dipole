$fn=100;

// bring in the definitions of various nut holes.
use <nut and bolt holes.scad>
// Combine a 50MM disk with the ring built above.
 
module base_plate_flange (){
cylinder (7.8,50,50);
rotate (180,[1,0,0])
translate ([-20.5,-20.5,-16])
motor_mount ();

}

module base_ring_holes_1 (){
translate  ([32,0,0])
	cylinder (8.02,11,11);
translate ([-32,0,0])
	cylinder (8.02,11,11);
}

module base_ring_holes_2 (){
translate  ([38,0,0])
	cylinder (8.02,10,10);
translate ([-38,0,0])
	cylinder (8.02,10,10);
}
module nut_ring_holes (){
		translate ([41,0,0])
			rotate (-90,[0,0,1])
			rotate (-90,[1,0,0])
			m3_square_nut_WFB ();

		translate ([-41,0,0])
		rotate (90,[0,0,1])
		rotate (-90,[1,0,0])
			m3_square_nut_WFB ();

		translate ([0,-41,0])
		rotate (180,[0,0,1])
		rotate (-90,[1,0,0])
			m3_square_nut_WFB ();

		translate ([0,41,0])
		rotate (0,[0,0,1])
		rotate (-90,[1,0,0])
			m3_square_nut_WFB ();
}

module ring_holes_master (){

	base_ring_holes_1 ();

	rotate (90,[0,0,1])
		base_ring_holes_1 ();

	rotate (45,[0,0,1])
		base_ring_holes_2 ();

	rotate (-45,[0,0,1])
		base_ring_holes_2 ();


	color("Red")
	translate ([0,0,2])
		// rotate (45,[0,0,1])
		nut_ring_holes ();

}

module mount_part_notched (){
difference (){
cube ([41,41,6.5]);
translate ([41,-.5,0])
rotate (-30,[0,1,0])
cube ([42,42,10]);
translate ([0,-.5,0])
rotate (-60,[0,1,0])
cube ([42,42,10]);
}
}

module motor_mount (){
cube ([41,41,2.5]);
translate ([0,0,2])
mount_part_notched();
translate ([0,0,8])
cube ([41,41,3]);
}




// Asssemble the disk and the extension rimg into a "cup".
module base_ring_plate (){
//		base_plate_addition ();
		base_plate_flange();
}

module base_plate (){
difference (){
base_ring_plate ();
translate ([0,0,2])
ring_holes_master ();
translate ([0,0,-1])
cylinder (30,14,14);
}
}

base_plate ();


