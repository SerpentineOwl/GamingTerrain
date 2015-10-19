size = 32;
baseheight = 6;
topperheight = 2;
walllength = size;
wallheight = 25 + baseheight + topperheight;
wallwidth = 6;
wallwidththin = 4;

function hypotenuse_ra(side_a, side_b) =
    sqrt(pow(side_a, 2) + pow(side_b, 2));

module wsdl_Base_1x1(s,bh,th) 
{
    union () {
        cube([s,s,bh]);
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
}

module wsdl_Base_1x2(s,bh,th)
{
    union () {
        wsdl_Base_1x1(s,bh,th);
        translate([s,0,0])
            wsdl_Base_1x1(s,bh,th);
    }
}
 
module wsdl_Base_2x2(s,bh,th)
{
    union () {
        wsdl_Base_1x2(s,bh,th);
        translate([0,s,0])
            wsdl_Base_1x2(s,bh,th);
    }
}
 
module wsdl_Base_2x4(s,bh,th)
{
    union () {
        wsdl_Base_2x2(s,bh,th);
        translate([s*2,0,0])
            wsdl_Base_2x2(s,bh,th);
    }
}
 
module wsdl_Base_4x4(s,bh,th)
{
    union () {
        wsdl_Base_2x4(s,bh,th);
        translate([0,s*2,0])
            wsdl_Base_2x4(s,bh,th);
    }
}
 
module wsdl_Wall_1(w,l,h)
{
    cube([w,l,h]);   
}

module wsdl_Wall_2(w,l,h)
{
    union() {
        wsdl_Wall_1(w,l,h);
        translate([0,l,0])
            wsdl_Wall_1(w,l,h);
    }
}

module wsdl_Wall_1_Left(w,l,h) 
{
    wsdl_Wall_1(w,l,h);
}

module wsdl_Wall_1_Right(w,l,h) 
{
    translate([(size)-w,0,0])
        wsdl_Wall_1(w,l,h);
}

module wsdl_Wall_1_DoubleRight(w,l,h) 
{
    translate([(size*2)-w,0,0])
        wsdl_Wall_1(w,l,h);
}

module wsdl_Wall_1_Bottom(w,l,h) 
{
rotate(a=-90)
    translate([-w,0,0])
        wsdl_Wall_1(w,l,h);

}

module wsdl_Wall_1_Top(w,l,h) 
{
rotate(a=-90)
    translate([-l,0,0])
        wsdl_Wall_1(w,l,h);

}

module wsdl_Wall_1_Center(w,l,h) 
{
    translate([(size)-w/2,0,0])
        wsdl_Wall_1(w,l,h);
}


module wsdl_Wall_2_Left(w,l,h) 
{
    wsdl_Wall_2(w,l,h);
}

module wsdl_Wall_2_Right(w,l,h) 
{
    translate([(size*2)-w,0,0])
        wsdl_Wall_2(w,l,h);
}

module wsdl_Wall_2_Bottom(w,l,h) 
{
rotate(a=-90)
    translate([-w,0,0])
        wsdl_Wall_2(w,l,h);

}

module wsdl_Wall_2_Top(w,l,h) 
{
rotate(a=-90)
    translate([-l*2,0,0])
        wsdl_Wall_2(w,l,h);

}

module wsdl_Wall_2_Center(w,l,h) 
{
    translate([(size)-w/2,0,0])
        wsdl_Wall_2(w,l,h);
}
