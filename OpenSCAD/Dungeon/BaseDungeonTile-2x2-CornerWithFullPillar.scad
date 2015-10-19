include <WylochStyleDungeonLibrary.scad>; 

wsdl_Base_2x2(size,baseheight,topperheight,topperrounded);
wsdl_Wall_2_Position(wallwidth,walllength,wallheight,walltop);
wsdl_Wall_2_Position(wallwidth,walllength,wallheight,wallright);
//Create Pillar with Modified wall
wsdl_Wall_1_Position(size,size,wallheight,wallleft);
