//Constants
wallleft = 0;
wallbottom = 1;
wallright = 2;
walltop = 3;
wallcenter = 4;
walldoubleright = 5;


//Variables
size = 32;
baseheight = 6;
topperheight = 2;
topperrounded = true;
walllength = size;
wallheight = 25 + baseheight + topperheight;
wallwidth = 6;
wallwidththin = 4;


//Functions
function hypotenuse_ra(side_a, side_b) =
    sqrt(pow(side_a, 2) + pow(side_b, 2));
    
    
//Modules    
module wsdl_Base(s,bh)
{
    cube([s,s,bh]);
}

module wsdl_Topper(s,bh,th,tr)
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

module wsdl_Base_1x1(s,bh,th,tr) 
{
    union () {
        wsdl_Base(s,bh);
        wsdl_Topper(s,bh,th,tr);
    }
}

module wsdl_Base_1x2(s,bh,th,tr)
{
    union () {
        wsdl_Base_1x1(s,bh,th,tr);
        translate([s,0,0])
            wsdl_Base_1x1(s,bh,th,tr);
    }
}
 
module wsdl_Base_2x2(s,bh,th,tr)
{
    union () {
        wsdl_Base_1x2(s,bh,th,tr);
        translate([0,s,0])
            wsdl_Base_1x2(s,bh,th,tr);
    }
}
 
module wsdl_Base_2x4(s,bh,th,tr)
{
    union () {
        wsdl_Base_2x2(s,bh,th,tr);
        translate([s*2,0,0])
            wsdl_Base_2x2(s,bh,th,tr);
    }
}
 
module wsdl_Base_4x4(s,bh,th,tr)
{
    union () {
        wsdl_Base_2x4(s,bh,th,tr);
        translate([0,s*2,0])
            wsdl_Base_2x4(s,bh,th,tr);
    }
}
 
module wsdl_Wall_1(w,l,h)
{
    cube([w,l,h]);   
}

module wsdl_Wall_1_Position(w,l,h,p)
{
    if (p==0) {
        wsdl_Wall_1(w,l,h);
    }
    
    else if (p==1) {
        rotate(a=-90)
           translate([-w,0,0])
               wsdl_Wall_1(w,l,h);       
    }
    
    else if (p==2) {
        translate([(size)-w,0,0])
            wsdl_Wall_1(w,l,h);
    }
    
    else if (p==3) {
        rotate(a=-90)
            translate([-l,0,0])
                wsdl_Wall_1(w,l,h);
    }
    
    else if (p==4) {
        translate([(size)-w/2,0,0])
            wsdl_Wall_1(w,l,h);
    }
    
    else if (p==5) {
        translate([(size*2)-w,0,0])
           wsdl_Wall_1(w,l,h);       
    }
}

module wsdl_Wall_2(w,l,h)
{
    union() {
        wsdl_Wall_1(w,l,h);
        translate([0,l,0])
            wsdl_Wall_1(w,l,h);
    }
}

module wsdl_Wall_2_Position(w,l,h,p)
{
    if (p==0) {
        wsdl_Wall_2(w,l,h);
    }
    
    else if (p==1) {
        rotate(a=-90)
            translate([-w,0,0])
                wsdl_Wall_2(w,l,h);
    }
    
    else if (p==2) {
    translate([(size*2)-w,0,0])
        wsdl_Wall_2(w,l,h);
    }
    
    else if (p==3) {
        rotate(a=-90)
            translate([-l*2,0,0])
                wsdl_Wall_2(w,l,h);
    }
    
    else if (p==4) {
        translate([(size)-w/2,0,0])
            wsdl_Wall_2(w,l,h);
    }
}
