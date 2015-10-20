offset_y_digit=-9.77;

module gm_NumberMini(minitext,offset_y)
{
    rotate(a=60) {
        difference() {
            cylinder(h=6,r=12,$fn=6);
            cylinder(h=3,r=10,$fn=6);
        }
        translate([offset_y,0,5.9])
            scale([2.5,1,3.5])
                translate([0,2,0])
                    rotate(a=90,v=[1,0,0])
                        linear_extrude (height=4)
                            text(minitext);
        translate([0,-7,4])
            rotate(a=30,v=[0,0,1])
               cylinder(h=4,r=2,$fn=3);
        rotate(a=180,v=[1,0,0])
            translate([0,0,-5])
                cylinder(h=10,r=2);
        translate([0,0,-4.5])
            sphere(r=2.15);
    }
}

gm_NumberMini("1", offset_y_digit);
translate([0,24,0])
    gm_NumberMini("2", offset_y_digit);
translate([0,48,0])
    gm_NumberMini("3", offset_y_digit);
//translate([0,-14,-4.5])
//    rotate(a=-90,v=[1,0,0])
//        cylinder(h=114,r=2);

rotate(a=180,v=[0,1,0])
    translate ([0,12,-53]) {
        rotate(a=60,v=[0,0,1])
            gm_NumberMini("4", offset_y_digit);
        translate([0,24,0])
            rotate(a=60,v=[0,0,1])
                gm_NumberMini("5", offset_y_digit);
//        translate([0,-34,-4.5])
//            rotate(a=-90,v=[1,0,0])
//                cylinder(h=114,r=2);
    }
    
//translate([0,-14,-5.5])
//    cylinder(h=64,r=2);
//translate([0,136,0])
//    translate([0,-36,-5.5])
//        cylinder(h=64,r=2);
