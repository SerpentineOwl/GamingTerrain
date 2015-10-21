//Constants
sml_BaseCircle = 180;
sml_BaseTriangle = 3;
sml_BaseSquare = 4;
sml_BasePentagon = 5;
sml_BaseHexagon = 6;

//Functions
function getRadiusForTriangle(w) = w*.577;
function getRadiusForSquare(w) = (w*1.41)/2;

//Modules
module sml_MiniBase (bsc, bw, bto, bh) {
    difference () {
        //Base
        {
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
        //Facing Indicator
        translate([6,0,bh-2])
            cylinder(h=4, r=2, $fn=3);
    }
}

module sml_Cutout (bw, bh, coh, cot) {
    //Top Cutout
    translate([-(cot/2),-(bw+2)/2,bh-coh])
       cube([cot,bw+2,coh]);    
}

module sml_MiniBaseWithCutout (bsc, bw, bto, bh, coh, cot) {
    translate([0,0,bh])
        rotate([180,0,0])
            difference () {
                sml_MiniBase(bsc, bw, bto, bh);
                sml_Cutout (bw, bh, coh, cot);
            }
}
    

sml_BaseSideCount = 6;
sml_BaseWidth = 24;
sml_BaseTopOffset = 1;
sml_BaseHeight = 6;

sml_TextThickness = 4;
sml_TextHeightScale = 4;
sml_TextWidthScale = 3;

sml_CutoutHeight = 3;
sml_CutoutThickness = sml_TextThickness;

//sml_MiniBase(sml_BaseSideCount, sml_BaseWidth, sml_BaseTopOffset, sml_BaseHeight);
//sml_Cutout (sml_BaseWidth, sml_BaseHeight);

sml_MiniBaseWithCutout(sml_BaseSideCount, sml_BaseWidth, sml_BaseTopOffset, sml_BaseHeight, sml_CutoutHeight, sml_CutoutThickness);
