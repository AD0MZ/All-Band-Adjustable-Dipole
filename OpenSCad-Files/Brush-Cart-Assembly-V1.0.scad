$fa=1;
$fn=100;

// Create the shapes that make various holes.
module bottom_hole (){
translate ([-6.5,-7,0])
	color ("lightBlue")
	cube ([13,14.2,37.75]);
}

module spring_hole (){
cylinder (16,4.5,4.5);
}

module brush_hole (){
translate ([-2.75,-5.75,0])
	color ("green")
// brush cube a bit taller to make holes look better.
	cube ([5.25,11.25,28.77]);
}
// Combine the shapes into more complex hole models.
module brush_holder_holes (){
bottom_hole ();
translate ([0,0,37.75])
		spring_hole ();
translate ([0,0,37.75])
	brush_hole ();
}

module test_retainer_hole_short (){
rotate (90,[1,0,0])
cylinder (24,1,1,center=true);
}


// Rotate the holes so that they subtract from the bottom up  (easier - no math).
module brush_holder_holes_rotated (){
	translate ([0,0,66.5])
	rotate (180,[1,0,0])
		brush_holder_holes ();
}
// Draw the "shells" for the carts.
module tall_cartridge (){
	difference (){
	translate ([-8,-8,-.01])
		cube ([16,16,65]);
		color ("red")
		brush_holder_holes_rotated ();


translate ([-6,0,61])
test_retainer_hole_short ();

translate ([6,0,61])
color ("lightblue")
test_retainer_hole_short ();


}
}
module short_cartridge (){
	difference (){
	translate ([-8,-8,-.01])
		cube ([16,16,33.5]);
		color ("red")
		brush_holder_holes_rotated ();

translate ([-6,0,31.5])
test_retainer_hole_short ();

translate ([6,0,31.5])
color ("lightblue")
test_retainer_hole_short ();


}
}
// Draw the final shapes.
// Comment one by one to export.

translate ([30,0,0])
tall_cartridge ();

translate ([-30,0,0])
	short_cartridge ();



// ---- Testing area - drawn at bottom.
module test_area (){
brush_holder_holes ();

translate ([30,0,0])
brush_holder_holes_rotated ();

translate ([50,0,0])
brush_hole ();

translate ([70,0,0])
spring_hole ();

translate ([90,0,0])
cube ([70,20,90]);

translate ([0,-6,2])
test_retainer_hole_short ();

translate ([0,6,2])
test_retainer_hole_short ();


}

// Un-comment to show build and test area.
// translate ([80,40,0])
// test_area ();
