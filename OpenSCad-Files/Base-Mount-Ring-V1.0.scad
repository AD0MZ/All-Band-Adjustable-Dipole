include <Nut and Bolt Holes.scad> ;
$fn=100;
diam=44;
mdiam=40;
mhite=20;

module nut_ring_holes (){
		translate ([40,0,0])
			rotate (-90,[0,0,1])
			rotate (-90,[1,0,0])
			m3_square_nut_WFB ();

		translate ([-40,0,0])
		rotate (90,[0,0,1])
		rotate (-90,[1,0,0])
			m3_square_nut_WFB ();

		translate ([0,-40,0])
		rotate (180,[0,0,1])
		rotate (-90,[1,0,0])
			m3_square_nut_WFB ();

		translate ([0,40,0])
		rotate (0,[0,0,1])
		rotate (-90,[1,0,0])
			m3_square_nut_WFB ();
}

module boss_nut_holes (){

		translate ([mdiam,0,mhite])
			rotate (90,[0,0,1])
			rotate (180,[1,0,0])
			m3_square_nut_WFB ();

		translate ([-mdiam,0,mhite])
		rotate (-90,[0,0,1])
		rotate (180,[1,0,0])
			m3_square_nut_WFB ();

		translate ([0,mdiam,mhite])
		rotate (180,[0,0,1])
		rotate (180,[1,0,0])
			m3_square_nut_WFB ();

		translate ([0,-mdiam,mhite])
		rotate (0,[0,0,1])
		rotate (-180,[1,0,0])
			m3_square_nut_WFB ();

}


module bottom_bosses(){

translate ([diam,0,8])
		cylinder (40,10,10);
	translate ([-diam,0,8]) 
		cylinder (40,10,10);
	translate ([0,-diam,8])
		cylinder (40,10,10);
	translate ([0,diam,8])
		cylinder (40,10,10);
}


module bosses_and_holes (){
difference (){
rotate (45,[0,0,1])
bottom_bosses ();
rotate (45,[0,0,1])
boss_nut_holes ();
}
}

module trim_ring (){
difference (){
cylinder (60,58,58);
cylinder (60,50.05,50.05);
}
}

module mount_ring_parts (){
bosses_and_holes ();
difference(){
cylinder (48,50.05,50.05);
translate ([0,0,-1])
cylinder (50,46,46);
translate ([0,0,44])
nut_ring_holes ();
}

}
module mount_ring (){
difference (){
mount_ring_parts ();
trim_ring();
}
}
translate ([0,0,48])
rotate (180,[1,0,0])
mount_ring ();

