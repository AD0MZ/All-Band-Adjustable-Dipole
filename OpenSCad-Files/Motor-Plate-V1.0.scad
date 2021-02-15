$fn=100;

module main_plate (){
	cylinder (3,26,26);
}


// V 2.1 increased size of holes to 1.6 from 1.5
// V 202 incfreased the size of the center motor hole

module motor_holes () {
color ("Black"){
			translate ([15.5,15.5,0])
				cylinder (16.02,1.6,1.6);
			translate ([15.5,-15.5,0])
				cylinder (16.02,1.6,1.6);
			translate ([-15.5,15.5,0])
				cylinder (16.02,1.6,1.6);
			translate ([-15.5,-15.5,0])
				cylinder (16.02,1.6,1.6);

				cylinder (3.02,11.5,11.5);
			}
}
module plate_holes () {
color ("Black"){
			translate ([17,17,0])
				cylinder (16.02,1.6,1.6);
			translate ([17,-17,0])
				cylinder (16.02,1.6,1.6);
			translate ([-17,17,0])
				cylinder (16.02,1.6,1.6);
			translate ([-17,-17,0])
				cylinder (16.02,1.6,1.6);
			}
}

module motor_plate (){
difference (){
main_plate ();
translate ([0,0,-.01])
motor_holes ();
translate ([0,0,-.01])
rotate (45,[0,0,1])
plate_holes ();
}
}
motor_plate() ;