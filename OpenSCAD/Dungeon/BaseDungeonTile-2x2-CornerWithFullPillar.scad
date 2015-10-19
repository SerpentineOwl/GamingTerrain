include <WylochStyleDungeonLibrary.scad>; 

wsdl_Base_2x2(size,baseheight,topperheight);
wsdl_Wall_2_Top(wallwidth,walllength,wallheight);
wsdl_Wall_2_Right(wallwidth,walllength,wallheight);
//Create Pillar with Modified wall
wsdl_Wall_1_Left(size,size,wallheight);
