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
    //Cutout
    translate([-(cot),-(bw)/2,bh-coh])
        difference() {
            cube([cot*2,bw,coh]);
            translate([cot,0,coh/2])
                cube([cot,bw,coh/2]);
        }
}

module sml_MiniBaseWithCutout (bsc, bw, bto, bh, coh, cot) {
//    translate([0,0,bh])
//        rotate([180,0,0])
            difference () {
                sml_MiniBase(bsc, bw, bto, bh);
                sml_Cutout (bw, bh, coh, cot);
            }
}

module sml_Text(tc, tt, ths, tws) {
    scale([tws,ths,1])
        linear_extrude (height=tt)
            text(tc);
} 
    

sml_BaseSideCount = 6;
sml_BaseWidth = 24;
sml_BaseTopOffset = 0;
sml_BaseHeight = 6;

sml_CutoutHeight = 4;
sml_CutoutThickness = 2;

sml_TextThickness = sml_CutoutThickness;
sml_TextHeightScale = 3.8;
sml_TextWidthScale = 2;
sml_TextCharacter = "X";

sml_Text_X_Offset_023456789 = 7.77;
sml_Text_X_Offset_1 = 8.27;
sml_Text_X_Offset_ABX = 9.27;
sml_Text_X_Offset_D = 10.27;
sml_Text_X_Offset_C = 10.77;

translate([0,-(sml_BaseWidth*1.5),sml_BaseHeight])
    rotate([180,0,0])
        translate([0,-((sml_BaseWidth/2)+4),0])
            rotate([0,0,-90])
                sml_MiniBaseWithCutout(sml_BaseSideCount, sml_BaseWidth, sml_BaseTopOffset, sml_BaseHeight, sml_CutoutHeight, sml_CutoutThickness);

difference () {
    union () {
        translate([0,-sml_CutoutThickness+.1,sml_CutoutHeight-sml_BaseHeight])
            rotate([0,0,90])
                sml_Cutout(sml_BaseWidth, sml_BaseHeight, sml_CutoutHeight, sml_CutoutThickness);
        translate([-sml_Text_X_Offset_ABX,0,0])
            sml_Text(sml_TextCharacter, sml_TextThickness, sml_TextHeightScale, sml_TextWidthScale);
    }
    translate([0,-(sml_BaseHeight+sml_CutoutThickness-.2),0])
        rotate([0,-90,-90])
            difference() {
            translate([-(sml_BaseWidth+1)/2,-(sml_BaseWidth+1)/2,0])
                cube([sml_BaseWidth+1,sml_BaseWidth+1,sml_BaseHeight]);
            sml_MiniBaseWithCutout(sml_BaseSideCount, sml_BaseWidth, sml_BaseTopOffset, sml_BaseHeight, sml_CutoutHeight, sml_CutoutThickness);
        }
}


