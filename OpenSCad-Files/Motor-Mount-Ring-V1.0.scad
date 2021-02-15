$fa=1;
// V 2.1 adds square nut holes and makes the outer righ a bit thicker on the inside.  


include <nut and Bolt Holes.scad>

module boss_cylinder (){
	cylinder (26,26,26);
}
module webs () {
			translate ([-3,31,0])
				cube ([6,16,5]);
			translate ([-3,-47,0])
				cube ([6,16,5]);
			translate ([-47,-3,0])
				cube ([16,6,5]);
			translate ([31,-3,0])
				cube ([16,6,5]);
}
module plate_holes () {
color ("Black"){
			translate ([17,17,0])
				cylinder (26.02,1.5,1.5);
			translate ([17,-17,0])
				cylinder (26.02,1.5,1.5);
			translate ([-17,17,0])
				cylinder (26.02,1.5,1.5);
			translate ([-17,-17,0])
				cylinder (26.02,1.5,1.5);
			}
}

module motor_bosses (){
	difference (){
		boss_cylinder ();
		translate ([0,0,-.01])
		rotate (45,[0,0,1])
		plate_holes ();
		
	}
}




module ring_mount (){
difference (){
cylinder (8,50,50);
translate ([0,0,4])
cylinder (5,45,44.5);
}
}

module inner_ring (){
cylinder (5,32,32);
}

// Create a "virtual ring" of holes for the nuts and screws.  Added to the "Difference" module later.  Easest to rotate them into correct orientation, and then move them out a fixed amount from center (no math!).
module nut_ring_holes (){
		translate ([42,0,0])
			rotate (-90,[0,0,1])
			rotate (-90,[1,0,0])
			m3_square_nut_WFB ();

		translate ([-42,0,0])
		rotate (90,[0,0,1])
		rotate (-90,[1,0,0])
			m3_square_nut_WFB ();

		translate ([0,-42,0])
		rotate (180,[0,0,1])
		rotate (-90,[1,0,0])
			m3_square_nut_WFB ();

		translate ([0,42,0])
		rotate (0,[0,0,1])
		rotate (-90,[1,0,0])
			m3_square_nut_WFB ();
}


module adder (){
ring_mount ();
motor_bosses () ;	
translate ([0,0,4])
inner_ring ();

translate ([0,0,3])
webs();
}

module motor_mount_ring (){
difference (){
	adder ();
	cube ([42.5,42.5,85], center = true);
	translate ([0,0,5.5])
		rotate (45,[0,0,1])
		nut_ring_holes ();
}
}

motor_mount_ring ();