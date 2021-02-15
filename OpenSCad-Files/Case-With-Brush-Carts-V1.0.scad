$fa=1;
$fn=180;
use <nut and bolt holes.scad> 

// Create the Various holes.
module wire_hole (){
color ("pink")
	rotate (90,[0,1,0])
		cylinder (100,1,1);
}
module string_hole (){
color ("pink")
	rotate (90,[0,.7,0])
		cylinder (100,.7,1);
}



module wire_slide_hole (){
	translate ([0,-2,0])
		cube ([100,4,1]);
}

module wire_cone (){
	rotate (90,[0,1,0])
		cylinder (10,4,0);
}

module wire_passage_hole (){
	wire_hole ();

translate ([0,0,.5])
	wire_slide_hole ();
wire_cone ();
}

module string_cone (){
	rotate (90,[0,1,0])
		cylinder (16,4,0);
}
module string_passage_hole (){
	string_hole ();
	string_cone ();
}

module screw_holes (){
translate ([44,0,0])
rotate (90,[0,1,0])
	m3_bolt_head_WFB();

translate ([-44,0,0])
rotate (-90,[0,1,0])
	m3_bolt_head_WFB();

translate ([0,44,0])
rotate (-90,[1,0,0])
	m3_bolt_head_WFB();

translate ([0,-44,0])
rotate (90,[1,0,0])
	m3_bolt_head_WFB();
}
module cart_hole_body_4_wires (){
// Create the models for the tall brush cartridge
translate ([-8.25,-8.25,0])
	cube ([16.5,16.5,90]);
}
module roof_cube_4_wires (){
		translate ([-15,-15,0])
		rotate (45,[0,0,1])
		rotate (11,[0,1,0])
		rotate (-45,[0,0,1])
			cube ([30,30,40]);
}
module cart_hole_body_4_strings (){
// Create the models for the String liglhtening hole.

translate ([-8.25,-8.25,0])
	cube ([16.5,16.5,80]);
}
module roof_cube_4_strings (){
		translate ([20,20,0])
		rotate (135,[0,0,1])
		rotate (-50,[1,0,0])
		rotate (45,[0,0,1])
			cube ([40,40,30]);
}
module cart_hole_trimmed_4_wires (){
difference (){
cart_hole_body_4_wires ();
translate ([0,0,77])
color ("red")
roof_cube_4_wires ();
}
}
module cart_hole_trimmed_4_strings (){
difference (){
cart_hole_body_4_strings ();
translate ([0,0,94])
color ("red")
roof_cube_4_strings ();
}
}

// ------------------------------------


// From here down things are assembeld into parts tha will make the final single solid.
module brush_holder_body_cube (){
// Creates a pipette to make the brush holders
// ( -- The "wings" on the outsides of the cylinder.)
translate ([-18.5,-17.5,0])
	cube ([37,35,80]);	
}

module string_holder_body_cube (){
// Creates a pipette to make the string holders - "wings".
translate ([-18.5,-17.5,0])
	cube ([37,35,80]);	
}

module brush_holder_cube_trimmed (){
// Create the brush holder assembly and fillets by trimming the tops of the body_cubes.
		difference (){
			brush_holder_body_cube ();
		translate ([-10,29,-.01])
			cylinder (99.02,15,15);	
		translate ([32,-19,-.01])
			cylinder (99.02,22,22);
		translate ([15,15,88])
		rotate (-45,[0,0,1])
		rotate (-11,[1,0,0])
			cube ([45,45,25], center=true);
}
}
module string_holder_cube_trimmed (){
// Stuff to make a copy of above for opposite corners (strings)
	mirror ([0,1,0])
		difference (){
			string_holder_body_cube ();
		translate ([-10,29,-.01])
			cylinder (99.02,15,15);	
		translate ([32,-19,-.01])
			cylinder (99.02,22,22);
		translate ([4,15,81])
		rotate (-45,[0,0,1])
		rotate (-42,[1,0,0])
			cube ([60,60,25], center=true);
}
}

module test_retainer_hole_short (){
rotate (90,[1,0,0])
cylinder (40,1,1,center=true);
}

module retainer_holes (){

translate ([50,33,4])
//translate ([0,6,4])
rotate (90,[0,0,1])
test_retainer_hole_short ();

translate ([50,45,4])
//translate ([0,6,4])
rotate (90,[0,0,1])
test_retainer_hole_short ();

translate ([-50,-33,2])
//translate ([0,-6,4])
rotate (90,[0,0,1])
test_retainer_hole_short ();

translate ([-50,-45,2])
//translate ([0,-6,4])
rotate (90,[0,0,1])
test_retainer_hole_short ();

}


// Assemble solid parts into one pipette...
module case_shell_shapes (){
		// Outer diameter of main cylinder.  Starts as a big "drum".  Will hollow it out later.
	cylinder (h=90,r1=54,r2=54);

		// place the two Brush_holder-solids (wings)
	translate ([42,32,0])
		brush_holder_cube_trimmed ();

		translate ([-42,-32,0])	
		rotate (180,[0,0,1])
		brush_holder_cube_trimmed ();

// Use the manually mirrored versions adjusted for strings.
		translate ([-42,32,0])	
		rotate (180,[0,0,1])
		string_holder_cube_trimmed ();

		translate ([42,-32,0])	
		rotate (0,[0,0,1])
		string_holder_cube_trimmed ();
}
//
// Make all the holes...
//
module antenna_case_all (){
difference (){
// Put all the holes into the now-built structure.  Doing it late lets construction parts hang into the middle by erasing them now.
	case_shell_shapes () ;

// The big hole down the middle
translate ([0,0,-.01])
color ("RED")
	cylinder (h=90.2,r1=50.150,r2=50.150);

// Drill the wire holes...
translate ([30,39,66.5])
	color ("Yellow")
	wire_passage_hole ();
	translate ([-30,-39,34.5])
	rotate (180,[0,0,1])
	color ("Yellow")
	wire_passage_hole ();

// Drill the string holes...
translate ([30,-39,50.5])
	color ("Yellow")
	string_passage_hole ();
	translate ([-30,39,50.5])
	rotate (180,[0,0,1])
	color ("Yellow")
	string_passage_hole ();


// Drill the verticle holes for the brush carts.
	translate ([-50,-39,-.01])
	rotate (180,[0,0,1])
		cart_hole_trimmed_4_wires ();
	translate ([50,39,-.01])
		cart_hole_trimmed_4_wires ();

// Drill the verticle holes for the string hollow areas (H2O drains?).
	translate ([50,-39,-.01])
		rotate (90,[0,0,1])
			cart_hole_trimmed_4_strings ();
	translate ([-50,39,-0.01])
	rotate (270,[0,0,1])				cart_hole_trimmed_4_strings ();

// Place and substract the assembled screw holes for rings
	translate ([0,0,14])
			screw_holes ();
	translate ([0,0,84.5])
		screw_holes ();

// Add the screw holes for the accessory pod or base.
	translate ([0,0,5])
		rotate (-13,[0,0,1])
			screw_holes ();

// Draw extro holes if it seems too weak.  Note the rotation above too.
//	translate ([0,0,5])
//		rotate (-13,[0,0,1])
//			screw_holes ();


// Drill the holes for the brush cart retainers
	retainer_holes ();

}
}
// Show it...
// Aggregated into a final module for easy re-use later....

antenna_case_all();


 // retainer_holes ();
