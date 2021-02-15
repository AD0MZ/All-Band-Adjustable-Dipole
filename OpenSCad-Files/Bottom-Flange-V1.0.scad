$fn=100;


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

// V 2.1 enlarged the holes to R=1.6 from R=1.55 (Reduce random printed inaccuracies.
module bottom_bolt_holes (){
		translate ([27,0,0])
			cylinder (22.2,1.6,1.6);
		translate ([-27,0,0])
			cylinder (22.2,1.6,1.6);
		translate ([0,-27,0])
			cylinder (22.2,1.6,1.6);
		translate ([0,27,0])
			cylinder (22.2,1.6,1.6);
}

module bottom_bosses(){
translate ([27,0,0])
		cylinder (22,5,5);
	translate ([-27,0,0]) 
		cylinder (22,5,5);
	translate ([0,-27,0])
		cylinder (22,5,5);
	translate ([0,27,0])
		cylinder (22,5,5);
}
module bottom_flange_extruded (){
//
// Module "middle_flange_extruded" creates and assembles all the solid parts of the main flange (default = union)...
	rotate_extrude (convexity = 10)
		square ([47.5,3]);
	rotate_extrude (convexity = 10)
		translate ([31.5,0,0])
		square ([3,22]);
// Add the bosses for bolts
	bottom_bosses ();
// Add the alilgnment pegs
//  V2.1 shortens the pegs (by lowering them) .5
	rotate (45,[0,0,1])
	translate ([0,0,21.5])
		pegs ();
}
/*
-----------------------------------------------
 Module "Bottom_flange" draws the extruded flange including the bosses added above, then subract all the various holes...
*/	

module bottom_flange () {
// "Bottom_flange" is superfluous, but it's nice to have everthing in containers for maybe later re-use. 

difference (){

	bottom_flange_extruded ();

// Just drew the flange, hub. and bosses, now subtracting the following...

	// Bolt holes...
		translate ([0,0,-.01])
			bottom_bolt_holes ();

	// Center hole...
	translate ([0,0,-.01])
	cylinder (21.02,2.6,2.6);

	// Rotate the holes axially so they don't match the bolt holes and place...
	rotate (45,[0,0,1])
	peg_holes ();
}
}

/*
----------------------------------------------
Draw the Bottom_flange...

*/
bottom_flange ();