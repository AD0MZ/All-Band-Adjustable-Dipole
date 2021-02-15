$fn=100;

module flange_shape (){
	square ([16,3]);
	square ([3,22]);
}


// V2.1 reduced the top of the Peg from .5 to .3 to make up for printer detrius....

module peg() {
			cylinder (2,.5,.3,center = true);
}

module top_flange (){

		rotate_extrude (convexity = 10)
		translate ([31.5,0,0])
			flange_shape ();

//  V 2.1 reduced height of pegs by lower each of them a bit.  (Subtraction still works!)
// alignment pegs for aseembly
		translate ([33,0,21.5])
			peg ();
		translate ([-33,0,21.5])
			peg ();
		translate ([0,-33,21.5])
			peg ();
			translate ([0,33,21.5])
			peg ();

}

color ("LightBlue")
top_flange ();