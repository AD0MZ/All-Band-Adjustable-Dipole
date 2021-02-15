$fn=100;
$fa=1;

use <nut and bolt holes.scad> 

module eave (){
// Draw the "roof" over the servo wire exit.
difference (){
rotate (90,[0,1,0])
cylinder (70,11,11);

translate ([0,-20,-42])
cube ([42,42,40]);

translate ([36,-20,-2])
rotate (60,[0,1,0])
cube ([40,40,40]);
}
}

module shell () {
// Draw the cone, and add the eave.
    cylinder (55,58,0);
translate ([18,0,21])
rotate (45,[0,0,1])
rotate (25,[0,1,0]) 
	eave ();
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

module inner () {
// Draw the flat-topped cone to create the hollow area.
    cylinder (25,52,26);
}

module ring (){
//  Draw the transition ring to to the bolt hole ring.
difference (){
	translate ([0,0,8])
	cylinder (2,54.1,54.1);
	translate ([0,0,7.99])
	cylinder (2.02,55.1,52);
}
// Draw the bolt hole ring with holes.
    difference () {
        cylinder (10,58,58);
		translate ([0,0,-.01])
        cylinder (10.02,54.1,54.1);
	translate ([0,0,4])
	screw_holes ();
/*
// Do we need more holes (Narrow margins)	
translate ([0,0,4])
	rotate (45,[0,0,1])
	screw_holes ();
*/
    }
}

module bevel (){
// Cutouts for the rope hole
    rotate (90,[0,1,0])
    cylinder (100,28,28);
}

module hole (){
// Hole for the rope
    rotate (90,[1,0,0])
    cylinder (100,5,5);
}

module cone (){
// Subtract all the holes from the solid shell (made above)
difference () {
shell ();
	translate ([0,0,-.01])
    inner ();
    translate ([-50,-32,58])
        bevel ();
        translate ([-50,32,58])
        bevel ();
    translate ([0,50,37])
        hole ();
// Drill out the wire hole under the eave
translate ([25,6,23])
rotate (45,[0,0,1])
rotate (115,[0,1,0]) 
cylinder (60,3,3);





}
}


ring ();
translate ([0,0,10])
cone ();


