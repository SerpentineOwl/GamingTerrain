include <WylochStyleDungeonLibrary.scad>; 

wsdl_Base_1x2(size,baseheight,topperheight);
wsdl_Wall_1_Left(wallwidththin,walllength,wallheight);
wsdl_Wall_1_Center(wallwidththin,walllength,wallheight);
wsdl_Wall_2_Bottom(wallwidththin,walllength,wallheight);
wsdl_Wall_1_DoubleRight(wallwidththin,walllength,wallheight);
//Hack to fix unfilled corners
translate([size-(wallwidth/2)-1,0,0])
    cube([wallwidth+2,walllength,baseheight+topperheight]);
