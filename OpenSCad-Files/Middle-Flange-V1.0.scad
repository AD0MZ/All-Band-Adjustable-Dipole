$fn=100;

// The followin holes build the "half-hub" to engage the motor shaft.
module bolt_hole (){
	cylinder (4,1.55,1.55, $fn=100);
	translate ([0,0,4])
		cylinder (9,2.75,2.75, $fn=100);
}

module hub (){
	difference (){
		cylinder (10,10,10);
		translate ([1,-10,-.01])
			cube ([10,20,10.02]);
	}
}


// The following holes and pigs help align the parts for assembly.
module peg_hole() {
	// This is too simple to modularize in this part, but it helps test sizes with only one edit...
			cylinder (2.5,.55,.55,center = true);
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

module peg() {
			cylinder (2,.5,.5,center = true);
}

module pegs(){
	// alignment pegs for aseembly
		translate ([33,0,0])
			peg ();
		translate ([-33,0,0])
			peg ();
		translate ([0,-33,0])
			peg ();
		translate ([0,33,0])
			peg ();
}

// The following holes are for the captive square nuts.
module square_nut_hole (){
color ("Red")
cube ([9,5.45,2],center=true);
}
module square_nut_holes (){
		translate ([25.5,0,0])
			square_nut_hole ();
		translate ([-25.5,0,0])
		rotate (180,[0,0,1])
			square_nut_hole ();
		translate ([0,-25.5,0])
		rotate (270,[0,0,1])
			square_nut_hole ();
		translate ([0,25.5,0])
		rotate (90,[0,0,1])
			square_nut_hole ();
}
// V2.1 Changed to 1.6 from 1.55
module bolt_holes (){
		translate ([27,0,0])
			cylinder (10.2,1.6,1.6);
		translate ([-27,0,0])
			cylinder (10.2,1.6,1.6);
		translate ([0,-27,0])
			cylinder (10.2,1.6,1.6);
		translate ([0,27,0])
			cylinder (10.2,1.6,1.6);
}

//  The following parts create the bosses used to re-enforce the bolting areas.

module bosses(){
translate ([27,0,0])
		cylinder (10,5,5);
	translate ([-27,0,0]) 
		cylinder (10,5,5);
	translate ([0,-27,0])
		cylinder (10,5,5);
	translate ([0,27,0])
		cylinder (10,5,5);
}


module middle_flange_extruded (){
//
// Module "middle_flange_extruded" creates and assembles all the solid parts of the main flange (default = union)...
// This could have been done by subtracting cylinders.
// This module "assembles" all the solid parts into one place, all the holes
	rotate_extrude (convexity = 10)
		square ([47.5,3]);
	rotate_extrude (convexity = 10)
		translate ([31.5,0,0])
		square ([3,10]);
// Add the bosses for bolts
	bosses ();
// Add the half-hub...
	hub ();
// Add the pegs, rotate so they don't align with the bosses.
// V2.1 lowered the pegs .5 from 10 to 9.5
	translate ([0,0,9.5])
	rotate (45,[0,0,1])
		pegs ();
}
/*
-----------------------------------------------
Support modules above.  Real assembly below (in Middle_Flange_Main!!!) ...
-----------------------------------------------

The following code draws the extruded flange including the bosses added above, then subracts all the various holes...
*/	

module middle_flange_main () {
// "Main" is superfluous, but it's nice to have everthing in containers for maybe later re-use. 

difference (){

	middle_flange_extruded ();

// Just drew the flange, hub. and bosses, now subtracting the following...

	// Bolt holes...

		translate ([0,0,-.01])
			bolt_holes ();

	//	Square nut holes...
		translate ([0,0,6])
			square_nut_holes ();
		

	// Center hole...
	translate ([0,0,-.01])
	cylinder (10.02,2.5,2.5);

	// Rotate the peg holes axially so they don't match the bolt holes and place...
	rotate (45,[0,0,1])
	peg_holes ();

	// Subtract the two bolt holes from the hub area...
	translate ([1.01,5,6.5])
		rotate (-90,[0,1,0])
			bolt_hole ();
	translate ([1.01,-5,6.5])
		rotate (-90,[0,1,0])
			bolt_hole ();

}
}

/*
-----------------------------------------------
Draw Middle_flange_main below... (Everything except the hub_lock, which is another part.)
*/


middle_flange_main ();
