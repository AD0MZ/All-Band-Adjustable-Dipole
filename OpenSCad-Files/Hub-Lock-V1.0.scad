$fn=100;

/*
--------------------------------------------------------
EXTRA STUFF BELOW!!  ...  Descibes a separate part.
Draw and place the hub lock (for looks).  
The dummy_shaft and hub_lock should be moved to a separate file for STL generation???

Dummy_shaft is part of hub_lock.
*/

//  v 2.1 enlarges the nut hole to "Best Fit"
module nut_hole (){
	cylinder (6,1.6,1.6);
	translate ([0,0,6])
		cylinder (6,3.2,3.25, $fn=6);
}


module dummy_shaft(){
	difference (){
		cylinder (9.02,2.5,2.5);
		translate ([2.0,-2.5,-.01])
		cube ([5,5,9.04]);
	}
}

module hub_lock (){

	difference (){
		cylinder (7,10,10);
		translate ([-18.5,-10,-.01])
			cube ([20,20,7.02]);
		translate ([0,0,-.01])
			dummy_shaft();
		translate ([-2,5,3.5])
			rotate (90,[0,1,0])
			nut_hole ();
		translate ([-2,-5,3.5])
			rotate (90,[0,1,0])
			nut_hole ();

		

	}
}



/*

Draw and place the hub_lock for a look at the whole assembly.  (Move for printing ????)
*/
translate ([0,0,3])
	hub_lock ();