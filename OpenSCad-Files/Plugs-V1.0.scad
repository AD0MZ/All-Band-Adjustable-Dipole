$fa=1;
$fn=100;


// Decided to go to two wire retainers at edge rather than a filament down one sdie.

/*
module test_retainer_hole (){
rotate (90,[1,0,0])
cylinder (14,.9,.9,center=true);
}

*/


module test_retainer_hole_short (){
rotate (90,[1,0,0])
cylinder (14,1,1,center=true);
}


module dent(){
cylinder (4,5.1,5.1);
cylinder (120,1,1,center = true);
}


module tall_wire_plug (){
difference (){
translate ([-6.3,-6.9,0])
//verify this zise
cube ([12.6,13.8,35.5]);
translate ([0,0,33.25])
dent ();


translate ([-6,-0,4])
//rotate (90,[0,0,1])
test_retainer_hole_short ();

translate ([6,0,4])
//rotate (90,[0,0,1])
test_retainer_hole_short ();


}
}




module short_wire_plug (){
difference (){
translate ([-6.3,-6.9,0])
cube ([12.6,13.8,3.5]);
translate ([0,0,1])
dent ();

translate ([-6,0,2])
// rotate (90,[0,0,1])
test_retainer_hole_short ();

translate ([6,0,2])
// rotate (90,[0,0,1])
test_retainer_hole_short ();


}
}
translate ([20,0,0])
tall_wire_plug ();

translate ([-20,0,0])
short_wire_plug ();

