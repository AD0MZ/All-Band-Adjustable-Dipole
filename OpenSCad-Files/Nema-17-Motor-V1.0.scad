$fn=100;
  


module chamfer (){
	// Used to build rounded edges of motor body
		translate ([0,0,-.01])
			difference () {
				cylinder (46.02,35,35);
				cylinder (46.02,26,26);
			}
}

module shaft (){
	// Cuts the flat part into the shaft
		difference (){
			cylinder (22,2.5,2.5);
			translate ([-2.5,2,7])
				cube ([5,5,22]);
		}
}

	

module motor (){
// Draws the main body - and chamfers and adds the holes and shaft.
		difference (){
			 translate ([-21,-21,0]) 
				color ("DarkGray")
					cube ([42,42,46]);
				color ("DarkGray")
			  chamfer ();

    //Screw Holes
		color ("Black"){
			translate ([15.5,15.5,-.01])
				cylinder (46.02,1.5,1.5);
			translate ([15.5,-15.5,-.010])
				cylinder (46.02,1.5,1.5);
			translate ([-15.5,15.5,-.01])
				cylinder (46.02,1.5,1.5);
			translate ([-15.5,-15.5,-.01])
				cylinder (46.02,1.5,1.5);
			}
}
	
	// Bearing Boss
		translate ([0,0,46])
			color ("LightGray")
			cylinder (2,11,11);
	// Position Shaft on Top
		translate ([0,0,48])
		rotate (-100,[0,0,1])
			color ("Gainsboro")
			shaft ();
}
// END MOTOR

//  Draw the whole thing.
motor ();