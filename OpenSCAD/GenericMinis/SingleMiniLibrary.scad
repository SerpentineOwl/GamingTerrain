//Constants
sml_BaseCircle = 90;
sml_BaseTriangle = 3;
sml_BaseSquare = 4;
sml_BasePentagon = 5;
sml_BaseHexagon = 6;

//Functions
function getRadiusForTriangle(w) = (w*.577)-.5; //Slightly less than w
function getRadiusForSquare(w) = ((w*1.41)-1)/2;  //Slightly less than w

//Modules
module sml_Base (bsc, bw, bto, bh) {
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
        translate([((bw/2)-bto)*.5,0,bh-2])
            cylinder(h=4, r=2, $fn=3);
    }
}

module sml_BaseInverse (bsc, bw, bto, bh, coh, cot) {
    difference () {
        translate([-(bw+4)/2,-(bw+4)/2,0])
            cube([bw+4,bw+4,bh]);
            sml_Base(bsc, bw, bto, bh);
    }
}

module sml_Cutout (bw, bh, coh, cot) {
    //Cutout
    translate([-cot/2,-(bw+4)/2,bh-(coh)])
        union () {
            cube([cot,bw+4,coh]);
            translate([cot,0,0])
                cube([cot/2,bw+4,cot/2]);
        }
}

module sml_Text(tc, tt, ths, tws, to, bh) {
    translate([-tt/2,-to,bh-.5])
        rotate([90,0,90])
            scale([tws,ths,1])
                linear_extrude (height=tt)
                    text(tc);
} 

module sml_BaseFinal (bsc, bw, bto, bh, coh, cot) {
    difference() {
        sml_Base(bsc, bw, bto, bh);
        sml_Cutout(bw, bh, coh, cot);
    }
}

module sml_TextFinal (bsc, bw, bto, bh, coh, cot, tc, tt, ths, tws, to) {
            difference () {
                    union () {
                        sml_Text(tc, tt, ths, tws, to, bh);        
                        sml_Cutout(bw, bh, coh, cot);
                    }
                    difference () {
                        sml_BaseInverse (bsc, bw, bto, bh, coh, cot);
                        sml_BaseFinal (bsc, bw, bto, bh, coh, cot);
                    }
                }
}

module sml_Mini (bsc, bw, bto, bh, coh, cot, tc, tt, ths, tws, to) {
    translate([0,0,tt/2])
        rotate([0,-90,0])    
            sml_TextFinal(bsc, bw, bto, bh, coh, cot, tc, tt, ths, tws, to);
    translate([0,0,bh])
        rotate([180,0,0])
            translate([bw/2,0,0])
                sml_BaseFinal(bsc, bw, bto, bh, coh, cot);
}

sml_BaseSideCount = 6;
sml_BaseWidth = 24;
sml_BaseTopOffset = 1;
sml_BaseHeight = 6;

sml_TextThickness = 4;
sml_TextHeightScale = 3.2;
sml_TextWidthScale = 2;
sml_TextCharacter = "0";

sml_CutoutHeight = 4;
sml_CutoutThickness = sml_TextThickness;

sml_Text_Offset_Digit = 7.77;
sml_Text_Offset_1 = 8.1;

translate([0,-sml_BaseWidth*1.1,0])
sml_Mini(sml_BaseSideCount, sml_BaseWidth, sml_BaseTopOffset, sml_BaseHeight, sml_CutoutHeight, sml_CutoutThickness, sml_TextCharacter, sml_TextThickness, sml_TextHeightScale, sml_TextWidthScale, sml_Text_Offset_Digit);

sml_Mini(sml_BaseSideCount, sml_BaseWidth, sml_BaseTopOffset, sml_BaseHeight, sml_CutoutHeight, sml_CutoutThickness, "1", sml_TextThickness, sml_TextHeightScale, sml_TextWidthScale, sml_Text_Offset_1);

translate([0,sml_BaseWidth*1.1,0])
sml_Mini(sml_BaseSideCount, sml_BaseWidth, sml_BaseTopOffset, sml_BaseHeight, sml_CutoutHeight, sml_CutoutThickness, "2", sml_TextThickness, sml_TextHeightScale, sml_TextWidthScale, sml_Text_Offset_Digit);
