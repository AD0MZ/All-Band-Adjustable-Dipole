$fn=100;
module base_plate_flange (){
cylinder (4,47.5,47.5);
translate ([0,0,4])
cylinder (2,6,6);
translate ([0,0,5])
cylinder (6,4,4);
}

module peg_hole() {
	// This is too simple to modularize in this part, but it helps test sizes with only one edit...
			cylinder (2.5,.55,.55,center = true);
}

//  VV2.1 adjusted size to 1.2 from 1.6

module base_bolt_holes (){
		translate ([27,0,0])
			cylinder (10.2,1.6,1.6);
		translate ([-27,0,0])
			cylinder (10.2,1.6,1.6);
		translate ([0,-27,0])
			cylinder (10.2,1.6,1.6);
		translate ([0,27,0])
			cylinder (10.2,1.6,1.6);
}

//  V2.1 adjusted head size to 2.75 from 2.25
module bottom_bolt_head_holes (){
		translate ([27,0,0])
			cylinder (1.5,2.75,2.75);
		translate ([-27,0,0])
					cylinder (1.5,2.75,2.75);
		translate ([0,-27,0])
					cylinder (1.5,2.75,2.75);
		translate ([0,27,0])
					cylinder (1.5,2.75,2.75);
}



module peg_holes (){
		translate ([33,0,0])
			peg_hole ();
		translate ([-33,0,0])
			peg_hole ();
		translate ([0,-33,0])
			peg_hole ();
		translate ([0,33,0])
			peg_hole ();
}

module base_plate (){
	difference (){
		base_plate_flange();
	translate ([0,0,-.5])
	rotate (45,[0,0,1])
		peg_holes ();
	translate ([0,0,-.01])
		base_bolt_holes ();
	// Bolt head recessess...
		translate ([0,0,3])
			bottom_bolt_head_holes ();

}
}

base_plate ();
