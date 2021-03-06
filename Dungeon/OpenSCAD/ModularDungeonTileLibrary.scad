//Constants
wallleft = 0;
wallbottom = 1;
wallright = 2;
walltop = 3;
wallcenter = 4;
walldoubleright = 5;


//Variables
size = 32;
connectorlength = size-10;
connectorwidth = 6;
connectorheight = 4;
baseheight = 8;
topperheight = 2;
topperrounded = true;
walllength = size;
wallheight = 25;
wallwidth = 6;
wallwidththin = 4;


//Functions
function hypotenuse_ra(side_a, side_b) =
    sqrt(pow(side_a, 2) + pow(side_b, 2));
    
    
//Modules    
module mtdl_Base_Connector(cw,cl,ch) {
    translate([-connectorwidth/2,-connectorlength/2,-connectorheight/2]) {
        cube([cw,cl,ch/2]);
        translate([cw/3,0,ch/2])
            cube([cw/3,cl,ch/2]);
        translate([-(cw-2)/2,cl/2-2,0])
            cube([cw+4,4,ch]);
    }
}

module mdtl_Base(s,bh)
{
    cube([s,s,bh]);
}

module mdtl_Topper(s,bh,th,tr)
{
    if (tr) {
        translate([0,0,bh])
            intersection() {
                difference () {
                        cube([s,s,th]);
                        union () {
                        rotate(a=45, v=[1,0,0])
                            cube([s,th*2,th*2]);
                        translate([0,s,0])
                            rotate(a=45, v=[1,0,0])
                                cube([s,th*2,th*2]);
                        rotate(a=-45, v=[0,1,0])
                            cube([th*2,s,th*2]);
                        translate([s,0,0])
                            rotate(a=-45, v=[0,1,0])
                                cube([th*2,s,th*2]);
                        }
                }
                translate([s/2,s/2,0])
                    cylinder(
                        h=th, 
                        r1=hypotenuse_ra(s/2-1.2, s/2-1.2), 
                        r2=hypotenuse_ra(s/2-th-.8, s/2-th-.8), 
                        center=false, 
                        $fa=.1);
            }    
    }
    else {
        translate([0,0,bh])
            difference() {
                cube([s,s,th]);
                union () {
                rotate(a=45, v=[1,0,0])
                    cube([s,th*2,th*2]);
                translate([0,s,0])
                    rotate(a=45, v=[1,0,0])
                        cube([s,th*2,th*2]);
                rotate(a=-45, v=[0,1,0])
                    cube([th*2,s,th*2]);
                translate([s,0,0])
                    rotate(a=-45, v=[0,1,0])
                        cube([th*2,s,th*2]);
                }
            }    
    }
}

module mdtl_Base_1x1(s,bh,th,tr) 
{
    difference () {
        union () {
            mdtl_Base(s,bh);
            mdtl_Topper(s,bh,th,tr);
        }
//        union () {
//            translate([size/2,size,baseheight/2])
//                rotate([0,180,0])
//                    mtdl_Base_Connector(connectorwidth,connectorlength,connectorheight);
//            translate([size/2,0,baseheight/2])
//                rotate([0,180,0])
//                    mtdl_Base_Connector(connectorwidth,connectorlength,connectorheight);
//            translate([size,size/2,baseheight/2])
//                rotate([0,180,90])
//                    mtdl_Base_Connector(connectorwidth,connectorlength,connectorheight);
//            translate([0,size/2,baseheight/2])
//                rotate([0,180,90])
//                    mtdl_Base_Connector(connectorwidth,connectorlength,connectorheight);
//        }
    }
}

module mdtl_Base_1x2(s,bh,th,tr)
{
    union () {
        mdtl_Base_1x1(s,bh,th,tr);
        translate([s,0,0])
            mdtl_Base_1x1(s,bh,th,tr);
    }
}
 
module mdtl_Base_2x2(s,bh,th,tr)
{
    union () {
        mdtl_Base_1x2(s,bh,th,tr);
        translate([0,s,0])
            mdtl_Base_1x2(s,bh,th,tr);
    }
}
 
module mdtl_Base_2x4(s,bh,th,tr)
{
    union () {
        mdtl_Base_2x2(s,bh,th,tr);
        translate([s*2,0,0])
            mdtl_Base_2x2(s,bh,th,tr);
    }
}
 
module mdtl_Base_4x4(s,bh,th,tr)
{
    union () {
        mdtl_Base_2x4(s,bh,th,tr);
        translate([0,s*2,0])
            mdtl_Base_2x4(s,bh,th,tr);
    }
}
 
module mdtl_Wall_1(w,l,h)
{
    translate([0,0,baseheight])
        cube([w,l,h]);   
}

module mdtl_Wall_1_Position(w,l,h,p)
{
    if (p==0) {
        mdtl_Wall_1(w,l,h);
    }
    
    else if (p==1) {
        rotate(a=-90)
           translate([-w,0,0])
               mdtl_Wall_1(w,l,h);       
    }
    
    else if (p==2) {
        translate([(size)-w,0,0])
            mdtl_Wall_1(w,l,h);
    }
    
    else if (p==3) {
        rotate(a=-90)
            translate([-l,0,0])
                mdtl_Wall_1(w,l,h);
    }
    
    else if (p==4) {
        translate([(size)-w/2,0,0])
            mdtl_Wall_1(w,l,h);
    }
    
    else if (p==5) {
        translate([(size*2)-w,0,0])
           mdtl_Wall_1(w,l,h);       
    }
}

module mdtl_Wall_2(w,l,h)
{
    union() {
        mdtl_Wall_1(w,l,h);
        translate([0,l,0])
            mdtl_Wall_1(w,l,h);
    }
}

module mdtl_Wall_2_Position(w,l,h,p)
{
    if (p==0) {
        mdtl_Wall_2(w,l,h);
    }
    
    else if (p==1) {
        rotate(a=-90)
            translate([-w,0,0])
                mdtl_Wall_2(w,l,h);
    }
    
    else if (p==2) {
    translate([(size*2)-w,0,0])
        mdtl_Wall_2(w,l,h);
    }
    
    else if (p==3) {
        rotate(a=-90)
            translate([-l*2,0,0])
                mdtl_Wall_2(w,l,h);
    }
    
    else if (p==4) {
        translate([(size)-w/2,0,0])
            mdtl_Wall_2(w,l,h);
    }
}