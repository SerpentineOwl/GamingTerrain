//Constants
sml_BaseCircle = 0;
sml_BaseTriangle = 3;
sml_BaseSquare = 4;
sml_BasePentagon = 5;
sml_BaseHexagon = 6;

//Variables
//Base
//sml_BaseSideCount = 0; //Circle
//sml_BaseWidth = 24; //1 Inch Base
//sml_BaseTopOffset = 0; //Top Taper Offset
//sml_BaseHeight = 4; 
//Mini
//sml_MiniText = "0";  //Single Character Preferred

//Functions
function getRadiusForTriangle(w) = w*.577;
function getRadiusForSquare(w) = (w*1.41)/2;

//Modules
module sml_MiniBase (bsc, bw, bto, bh) {
 
    if (bsc == sml_BaseCircle) {
        rotate([0,0,0])
            cylinder(h=bh, r1=bw/2, r2=(bw/2)-bto, $fn=bsc);
    }
    else if (bsc == sml_BaseTriangle) {
        rotate([0,0,0])
            cylinder(h=bh, r1=getRadiusForTriangle(bw), r2=getRadiusForTriangle(bw)-bto, $fn=bsc);
    }
    else if (bsc == sml_BaseSquare) {
        rotate([0,0,45])
            cylinder(h=bh, r1=getRadiusForSquare(bw), r2=getRadiusForSquare(bw)-bto, $fn=bsc);
    }
    else if (bsc == sml_BasePentagon) {
        rotate([0,0,0])
            cylinder(h=bh, r1=bw/2, r2=(bw/2)-bto, $fn=bsc);
    }
    else if (bsc == sml_BaseHexagon) {
        rotate([0,0,30])
            cylinder(h=bh, r1=bw/2, r2=(bw/2)-bto, $fn=bsc);
    }
    else {
        rotate([0,0,0])
            cylinder(h=bh, r1=bw/2, r2=(bw/2)-bto, $fn=bsc);
    }
}

sml_BaseSideCount = 3;
sml_BaseWidth = 24;
sml_BaseTopOffset = 1;
sml_BaseHeight = 6;

sml_MiniBase(sml_BaseSideCount, sml_BaseWidth, sml_BaseTopOffset, sml_BaseHeight);

