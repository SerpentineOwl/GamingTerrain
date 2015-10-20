offset_y_digit=-12;

module gm_NumberMini(minitext,offset_y)
{
    rotate(a=60) {
        difference() {
            cylinder(h=6,r=23,$fn=6);
            cylinder(h=3,r=20,$fn=6);
        }
        translate([offset_y,0,5.9])
            scale([3,1,4])
                translate([0,3,0])
                    rotate(a=90,v=[1,0,0])
                        linear_extrude (height=6)
                            text(minitext);
        translate([0,-14,4])
            rotate(a=30,v=[0,0,1])
               cylinder(h=4,r=4,$fn=3);
        rotate(a=180,v=[1,0,0])
            translate([0,0,-5])
                cylinder(h=10,r=2);
        translate([0,0,-4.5])
            sphere(r=2.15);
    }
}

gm_NumberMini("1", offset_y_digit);
translate([0,42,0])
    gm_NumberMini("2", offset_y_digit);
translate([0,84,0])
    gm_NumberMini("3", offset_y_digit);
translate([37,21,0])
    gm_NumberMini("4", offset_y_digit);
translate([37,63,0])
    gm_NumberMini("5", offset_y_digit);
translate([0,-26,-4.5])
    rotate(a=-90,v=[1,0,0])
        cylinder(h=136,r=2);
translate([37,-26,-4.5])
    rotate(a=-90,v=[1,0,0])
        cylinder(h=136,r=2);
translate([0,0,-4.5])
    rotate(a=-90,v=[1,0,0])
        rotate(a=60,v=[0,1,0])
            cylinder(h=42,r=2);
translate([0,42,-4.5])
    rotate(a=-90,v=[1,0,0])
        rotate(a=60,v=[0,1,0])
            cylinder(h=42,r=2);
translate([0,42,-4.5])
    rotate(a=-90,v=[1,0,0])
        rotate(a=120,v=[0,1,0])
            cylinder(h=42,r=2);
translate([0,84,-4.5])
    rotate(a=-90,v=[1,0,0])
        rotate(a=120,v=[0,1,0])
            cylinder(h=42,r=2);

rotate(a=180,v=[0,1,0])
    translate ([0,21,-53]) {
        gm_NumberMini("6", offset_y_digit);
        translate([0,42,0])
            gm_NumberMini("7", offset_y_digit);
        translate([-37,-21,0])
            gm_NumberMini("8", offset_y_digit);
        translate([-37,21,0])
            gm_NumberMini("9", offset_y_digit);
        translate([-37,63,0])
            gm_NumberMini("0", offset_y_digit);
        translate([-37,-48,-4.5])
            rotate(a=-90,v=[1,0,0])
                cylinder(h=136,r=2);
        translate([0,-48,-4.5])
            rotate(a=-90,v=[1,0,0])
                cylinder(h=136,r=2);
        translate([-37,-21,0]) {
            translate([0,0,-4.5])
                rotate(a=-90,v=[1,0,0])
                    rotate(a=60,v=[0,1,0])
                        cylinder(h=42,r=2);
            translate([0,42,-4.5])
                rotate(a=-90,v=[1,0,0])
                    rotate(a=60,v=[0,1,0])
                        cylinder(h=42,r=2);
            translate([0,42,-4.5])
                rotate(a=-90,v=[1,0,0])
                    rotate(a=120,v=[0,1,0])
                        cylinder(h=42,r=2);
            translate([0,84,-4.5])
                rotate(a=-90,v=[1,0,0])
                    rotate(a=120,v=[0,1,0])
                        cylinder(h=42,r=2);
        }
    }
    
translate([0,-26,-5.5])
    cylinder(h=64,r=2);
translate([37,0,0])
    translate([0,-26,-5.5])
        cylinder(h=64,r=2);
translate([0,136,0])
    translate([0,-26,-5.5])
        cylinder(h=64,r=2);
translate([37,136,0])
    translate([0,-26,-5.5])
        cylinder(h=64,r=2);
