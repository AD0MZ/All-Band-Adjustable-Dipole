$fn=100;
//   WFB = With Fake Bolt - a clearance hole
//   Nuts  are H=Thickness, R1 and R2 = circumscribed radiu

module m3_nut_WFB (){
cylinder (32, 1.6,1.6);	
	translate ([0,0,4])
cylinder (2.5, 3.15,3.15, $fn=6, center=true);
}

module m3_square_nut_WFB (){
	cylinder (32, 1.6,1.6);
	translate ([0,-5.2,4])
	cube ([5.45,16,2], center =true);
}

module m3_bolt_head_WFB (){
	cylinder (32, 1.6,1.6);
	cylinder (3,2.75,2.75);
}

/*
m3_nut_WFB ();
	translate ([8,0,0])
	rotate (-90,[1,0,0])
m3_square_nut_WFB ();
	translate ([16,0,0])
m3_bolt_head_WFB ();
*/